// Licensed under the Apache License, Version 2.0
// Copyright 2025-2026 Mindful Software LLC d/b/a Dartastic.io, All rights reserved.

import 'package:dartastic_opentelemetry_api/dartastic_opentelemetry_api.dart';

import 'otel_cloudflare_workers_suppression.dart';

class CloudflareWorkersResult {
  /// Creates a result.
  const CloudflareWorkersResult({
    this.account,
    this.scriptName,
    this.scriptId,
    this.workerNamespace,
    this.workerEnvironment,
    this.triggerType,
    this.triggerRoute,
    this.colo,
    this.runtime,
    this.compatibilityDate,
    this.cpuTimeMs,
    this.wallTimeMs,
    this.memoryMb,
    this.subrequests,
    this.kvNamespaceId,
    this.kvKey,
    this.kvReadCount,
    this.kvWriteCount,
    this.r2BucketName,
    this.r2ObjectKey,
    this.r2OperationsClassA,
    this.r2OperationsClassB,
    this.queueName,
    this.queueMessageCount,
    this.queueRetries,
    this.durableObjectNamespace,
    this.durableObjectId,
    this.aiModel,
    this.aiTokensIn,
    this.aiTokensOut,
    this.statusCode,
    this.errorCode,
    this.errorMessage,
  });

  final String? account;
  final String? scriptName;
  final String? scriptId;
  final String? workerNamespace;
  final String? workerEnvironment;
  final String? triggerType;
  final String? triggerRoute;
  final String? colo;
  final String? runtime;
  final String? compatibilityDate;
  final int? cpuTimeMs;
  final int? wallTimeMs;
  final int? memoryMb;
  final int? subrequests;
  final String? kvNamespaceId;
  final String? kvKey;
  final int? kvReadCount;
  final int? kvWriteCount;
  final String? r2BucketName;
  final String? r2ObjectKey;
  final int? r2OperationsClassA;
  final int? r2OperationsClassB;
  final String? queueName;
  final int? queueMessageCount;
  final int? queueRetries;
  final String? durableObjectNamespace;
  final String? durableObjectId;
  final String? aiModel;
  final int? aiTokensIn;
  final int? aiTokensOut;
  final int? statusCode;
  final String? errorCode;
  final String? errorMessage;
}

/// What a traced call returned: the value for the caller plus fields
/// recorded on the span.
class CloudflareWorkersCallResult<T> {
  /// Creates a call result.
  const CloudflareWorkersCallResult({required this.value, this.result});

  /// The value returned to the caller.
  final T value;
  final CloudflareWorkersResult? result;
}

Future<T> tracedCloudflareWorkers<T>({
  required String operation,
  required Future<CloudflareWorkersCallResult<T>> Function() invoke,
  APITracer? tracer,
}) async {
  if (cloudflareWorkersInstrumentationSuppressed()) {
    final r = await invoke();
    return r.value;
  }
  final t =
      tracer ?? OTelAPI.tracerProvider().getTracer('otel_cloudflare_workers');
  final span =
      t.startSpan('cloudflare_workers $operation', kind: SpanKind.client);
  try {
    span.addAttributes(OTelAPI.attributes(
        [OTelAPI.attributeString('rpc.system', 'cloudflare_workers')]));
    span.addAttributes(
        OTelAPI.attributes([OTelAPI.attributeString('rpc.method', operation)]));
    final r = await invoke();
    final res = r.result;
    if (res != null) {
      if (res.account != null) {
        span.addAttributes(OTelAPI.attributes(
            [OTelAPI.attributeString('cloudflare.account', res.account!)]));
      }
      if (res.scriptName != null) {
        span.addAttributes(OTelAPI.attributes([
          OTelAPI.attributeString('cloudflare.script.name', res.scriptName!)
        ]));
      }
      if (res.scriptId != null) {
        span.addAttributes(OTelAPI.attributes(
            [OTelAPI.attributeString('cloudflare.script.id', res.scriptId!)]));
      }
      if (res.workerNamespace != null) {
        span.addAttributes(OTelAPI.attributes([
          OTelAPI.attributeString(
              'cloudflare.worker.namespace', res.workerNamespace!)
        ]));
      }
      if (res.workerEnvironment != null) {
        span.addAttributes(OTelAPI.attributes([
          OTelAPI.attributeString(
              'cloudflare.worker.environment', res.workerEnvironment!)
        ]));
      }
      if (res.triggerType != null) {
        span.addAttributes(OTelAPI.attributes([
          OTelAPI.attributeString('cloudflare.trigger.type', res.triggerType!)
        ]));
      }
      if (res.triggerRoute != null) {
        span.addAttributes(OTelAPI.attributes([
          OTelAPI.attributeString('cloudflare.trigger.route', res.triggerRoute!)
        ]));
      }
      if (res.colo != null) {
        span.addAttributes(OTelAPI.attributes(
            [OTelAPI.attributeString('cloudflare.colo', res.colo!)]));
      }
      if (res.runtime != null) {
        span.addAttributes(OTelAPI.attributes(
            [OTelAPI.attributeString('cloudflare.runtime', res.runtime!)]));
      }
      if (res.compatibilityDate != null) {
        span.addAttributes(OTelAPI.attributes([
          OTelAPI.attributeString(
              'cloudflare.compatibility_date', res.compatibilityDate!)
        ]));
      }
      if (res.cpuTimeMs != null) {
        span.addAttributes(OTelAPI.attributes(
            [OTelAPI.attributeInt('cloudflare.cpu_time_ms', res.cpuTimeMs!)]));
      }
      if (res.wallTimeMs != null) {
        span.addAttributes(OTelAPI.attributes([
          OTelAPI.attributeInt('cloudflare.wall_time_ms', res.wallTimeMs!)
        ]));
      }
      if (res.memoryMb != null) {
        span.addAttributes(OTelAPI.attributes(
            [OTelAPI.attributeInt('cloudflare.memory_mb', res.memoryMb!)]));
      }
      if (res.subrequests != null) {
        span.addAttributes(OTelAPI.attributes([
          OTelAPI.attributeInt('cloudflare.subrequests', res.subrequests!)
        ]));
      }
      if (res.kvNamespaceId != null) {
        span.addAttributes(OTelAPI.attributes([
          OTelAPI.attributeString(
              'cloudflare.kv.namespace_id', res.kvNamespaceId!)
        ]));
      }
      if (res.kvKey != null) {
        span.addAttributes(OTelAPI.attributes(
            [OTelAPI.attributeString('cloudflare.kv.key', res.kvKey!)]));
      }
      if (res.kvReadCount != null) {
        span.addAttributes(OTelAPI.attributes([
          OTelAPI.attributeInt('cloudflare.kv.read_count', res.kvReadCount!)
        ]));
      }
      if (res.kvWriteCount != null) {
        span.addAttributes(OTelAPI.attributes([
          OTelAPI.attributeInt('cloudflare.kv.write_count', res.kvWriteCount!)
        ]));
      }
      if (res.r2BucketName != null) {
        span.addAttributes(OTelAPI.attributes([
          OTelAPI.attributeString('cloudflare.r2.bucket', res.r2BucketName!)
        ]));
      }
      if (res.r2ObjectKey != null) {
        span.addAttributes(OTelAPI.attributes([
          OTelAPI.attributeString('cloudflare.r2.object_key', res.r2ObjectKey!)
        ]));
      }
      if (res.r2OperationsClassA != null) {
        span.addAttributes(OTelAPI.attributes([
          OTelAPI.attributeInt(
              'cloudflare.r2.operations.class_a', res.r2OperationsClassA!)
        ]));
      }
      if (res.r2OperationsClassB != null) {
        span.addAttributes(OTelAPI.attributes([
          OTelAPI.attributeInt(
              'cloudflare.r2.operations.class_b', res.r2OperationsClassB!)
        ]));
      }
      if (res.queueName != null) {
        span.addAttributes(OTelAPI.attributes([
          OTelAPI.attributeString('cloudflare.queue.name', res.queueName!)
        ]));
      }
      if (res.queueMessageCount != null) {
        span.addAttributes(OTelAPI.attributes([
          OTelAPI.attributeInt(
              'cloudflare.queue.message_count', res.queueMessageCount!)
        ]));
      }
      if (res.queueRetries != null) {
        span.addAttributes(OTelAPI.attributes([
          OTelAPI.attributeInt('cloudflare.queue.retries', res.queueRetries!)
        ]));
      }
      if (res.durableObjectNamespace != null) {
        span.addAttributes(OTelAPI.attributes([
          OTelAPI.attributeString(
              'cloudflare.do.namespace', res.durableObjectNamespace!)
        ]));
      }
      if (res.durableObjectId != null) {
        span.addAttributes(OTelAPI.attributes([
          OTelAPI.attributeString('cloudflare.do.id', res.durableObjectId!)
        ]));
      }
      if (res.aiModel != null) {
        span.addAttributes(OTelAPI.attributes(
            [OTelAPI.attributeString('cloudflare.ai.model', res.aiModel!)]));
      }
      if (res.aiTokensIn != null) {
        span.addAttributes(OTelAPI.attributes([
          OTelAPI.attributeInt('cloudflare.ai.tokens.in', res.aiTokensIn!)
        ]));
      }
      if (res.aiTokensOut != null) {
        span.addAttributes(OTelAPI.attributes([
          OTelAPI.attributeInt('cloudflare.ai.tokens.out', res.aiTokensOut!)
        ]));
      }
      if (res.statusCode != null) {
        span.addAttributes(OTelAPI.attributes([
          OTelAPI.attributeInt('http.response.status_code', res.statusCode!)
        ]));
      }
      if (res.errorCode != null) {
        span.addAttributes(OTelAPI.attributes([
          OTelAPI.attributeString('cloudflare.error.code', res.errorCode!)
        ]));
      }
      final fail = res.errorCode != null ||
          (res.statusCode != null && res.statusCode! >= 400);
      if (fail) {
        span.addAttributes(OTelAPI.attributes([
          OTelAPI.attributeString(ErrorAttributes.errorType.key,
              res.errorCode ?? 'cloudflare_workers.error')
        ]));
        span.setStatus(SpanStatusCode.Error, res.errorMessage);
      }
    }
    return r.value;
  } catch (e, st) {
    span.recordException(e, stackTrace: st);
    span.setStatus(SpanStatusCode.Error, e.toString());
    rethrow;
  } finally {
    span.end();
  }
}
