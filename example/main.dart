// Licensed under the Apache License, Version 2.0
// Copyright 2025-2026 Mindful Software LLC d/b/a Dartastic.io, All rights reserved.

import 'package:dartastic_opentelemetry/dartastic_opentelemetry.dart';
import 'package:otel_cloudflare_workers/otel_cloudflare_workers.dart';

/// Traces Cloudflare Workers calls with OpenTelemetry.
///
/// `otel_cloudflare_workers` depends on the OpenTelemetry API only, so the application
/// initializes an SDK once at startup. Wrap each Cloudflare Workers call in
/// [tracedCloudflareWorkers]; the `invoke` callback makes the real call and reports what
/// came back, which is recorded on the span.
Future<void> main() async {
  await OTel.initialize(serviceName: 'cloudflare-workers-example');

  // Traces a Cloudflare Workers call.
  final cloudflareWorkersId = await tracedCloudflareWorkers<String>(
    operation: 'create',
    invoke: () async {
      // Make the Cloudflare Workers call here, then report what it returned.
      const id = 'cloudflare_workers_8f3a2c';
      return const CloudflareWorkersCallResult(
          value: id,
          result: CloudflareWorkersResult(
              account: 'example',
              scriptName: 'example',
              scriptId: 'script_8f3a2c',
              workerNamespace: 'example',
              workerEnvironment: 'example',
              triggerType: 'standard',
              triggerRoute: 'example',
              colo: 'example',
              runtime: 'example',
              compatibilityDate: 'example',
              cpuTimeMs: 120,
              wallTimeMs: 120,
              memoryMb: 1,
              subrequests: 1,
              kvNamespaceId: 'kvnamespace_8f3a2c',
              kvKey: 'orders/2026/inv-1042.pdf',
              kvReadCount: 3,
              kvWriteCount: 3,
              r2BucketName: 'invoices',
              r2ObjectKey: 'orders/2026/inv-1042.pdf',
              r2OperationsClassA: 1,
              r2OperationsClassB: 1,
              queueName: 'orders',
              queueMessageCount: 3,
              queueRetries: 1,
              durableObjectNamespace: 'example',
              durableObjectId: 'durableobject_8f3a2c',
              aiModel: 'standard',
              aiTokensIn: 128,
              aiTokensOut: 128,
              statusCode: 201,
              errorCode: 'example',
              errorMessage: 'example'));
    },
  );
  OTelLog.info('tracedCloudflareWorkers create returned $cloudflareWorkersId');

  // Calls that should not be traced, such as health checks, run inside
  // runWithoutCloudflareWorkersInstrumentationAsync.
  await runWithoutCloudflareWorkersInstrumentationAsync(
    () => tracedCloudflareWorkers<String>(
      operation: 'create',
      invoke: () async {
        const id = 'cloudflare_workers_8f3a2c';
        return const CloudflareWorkersCallResult(
            value: id,
            result: CloudflareWorkersResult(
                account: 'example',
                scriptName: 'example',
                scriptId: 'script_8f3a2c',
                workerNamespace: 'example',
                workerEnvironment: 'example',
                triggerType: 'standard',
                triggerRoute: 'example',
                colo: 'example',
                runtime: 'example',
                compatibilityDate: 'example',
                cpuTimeMs: 120,
                wallTimeMs: 120,
                memoryMb: 1,
                subrequests: 1,
                kvNamespaceId: 'kvnamespace_8f3a2c',
                kvKey: 'orders/2026/inv-1042.pdf',
                kvReadCount: 3,
                kvWriteCount: 3,
                r2BucketName: 'invoices',
                r2ObjectKey: 'orders/2026/inv-1042.pdf',
                r2OperationsClassA: 1,
                r2OperationsClassB: 1,
                queueName: 'orders',
                queueMessageCount: 3,
                queueRetries: 1,
                durableObjectNamespace: 'example',
                durableObjectId: 'durableobject_8f3a2c',
                aiModel: 'standard',
                aiTokensIn: 128,
                aiTokensOut: 128,
                statusCode: 201,
                errorCode: 'example',
                errorMessage: 'example'));
      },
    ),
  );

  await OTel.shutdown();
}
