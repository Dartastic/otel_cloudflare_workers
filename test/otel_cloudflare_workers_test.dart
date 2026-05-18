// Licensed under the Dartastic Pro Software License Agreement.
// Copyright 2025-2026 Mindful Software LLC d/b/a Dartastic.io, All rights reserved.

import 'package:dartastic_opentelemetry/dartastic_opentelemetry.dart';
import 'package:dartastic_opentelemetry/testing.dart';
import 'package:otel_cloudflare_workers/otel_cloudflare_workers.dart';
import 'package:test/test.dart';

void main() {
  late TestHarness harness;
  late InMemorySpanExporter spans;

  setUpAll(() async {
    harness = await maybeInitializeOtelForTest(
      serviceName: 'otel_cloudflare_workers-test',
    );
    spans = harness.spans;
  });

  setUp(() => harness.clear());

  Map<String, Object> attrsOf(Span s) =>
      {for (final a in s.attributes.toList()) a.key: a.value};

  test('script.invoke records cpu + colo + subrequests', () async {
    await tracedCloudflareWorkers<String>(
      operation: 'script.invoke',
      invoke: () async => const CloudflareWorkersCallResult(
        value: 'ok',
        result: CloudflareWorkersResult(
          scriptName: 'api',
          colo: 'IAD',
          runtime: 'workerd',
          cpuTimeMs: 5,
          wallTimeMs: 18,
          subrequests: 3,
        ),
      ),
    );
    final a =
        attrsOf(spans.findSpanByName('cloudflare_workers script.invoke')!);
    expect(a['cloudflare.cpu_time_ms'], 5);
    expect(a['cloudflare.colo'], 'IAD');
    expect(a['cloudflare.subrequests'], 3);
  });

  test('kv.put records key', () async {
    await tracedCloudflareWorkers<String>(
      operation: 'kv.put',
      invoke: () async => const CloudflareWorkersCallResult(
        value: 'ok',
        result: CloudflareWorkersResult(
          kvNamespaceId: 'ns_1',
          kvKey: 'session:abc',
          kvWriteCount: 1,
        ),
      ),
    );
    final a = attrsOf(spans.findSpanByName('cloudflare_workers kv.put')!);
    expect(a['cloudflare.kv.namespace_id'], 'ns_1');
    expect(a['cloudflare.kv.key'], 'session:abc');
  });

  test('rate_limit sets span error', () async {
    await tracedCloudflareWorkers<String>(
      operation: 'script.invoke',
      invoke: () async => const CloudflareWorkersCallResult(
        value: 'ok',
        result: CloudflareWorkersResult(
          errorCode: 'rate_limit',
          statusCode: 429,
        ),
      ),
    );
    expect(
      spans.findSpanByName('cloudflare_workers script.invoke')!.status,
      SpanStatusCode.Error,
    );
  });

  test('suppression skips spans', () async {
    await runWithoutCloudflareWorkersInstrumentationAsync(() async {
      await tracedCloudflareWorkers<String>(
        operation: 'script.list',
        invoke: () async => const CloudflareWorkersCallResult(value: 'v'),
      );
    });
    expect(spans.findSpansStartingWith('cloudflare_workers '), isEmpty);
  });
}
