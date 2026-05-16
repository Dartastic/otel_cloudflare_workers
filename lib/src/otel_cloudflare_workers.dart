// Licensed under the Apache License, Version 2.0
// Copyright 2025, Mindful Software LLC, All rights reserved.

import 'package:dartastic_opentelemetry/dartastic_opentelemetry.dart';
import 'package:dartastic_opentelemetry_api/dartastic_opentelemetry_api.dart';

import 'otel_cloudflare_workers_suppression.dart';

class CloudflareWorkersResult {
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

class CloudflareWorkersCallResult<T> {
  const CloudflareWorkersCallResult({required this.value, this.result});
  final T value;
  final CloudflareWorkersResult? result;
}

Future<T> tracedCloudflareWorkers<T>({
  required String operation,
  required Future<CloudflareWorkersCallResult<T>> Function() invoke,
  Tracer? tracer,
}) async {
  if (cloudflareWorkersInstrumentationSuppressed()) {
    final r = await invoke();
    return r.value;
  }
  final t =
      tracer ?? OTel.tracerProvider().getTracer('otel_cloudflare_workers');
  final span =
      t.startSpan('cloudflare_workers $operation', kind: SpanKind.client);
  try {
    span.setStringAttribute('rpc.system', 'cloudflare_workers');
    span.setStringAttribute('rpc.method', operation);
    final r = await invoke();
    final res = r.result;
    if (res != null) {
      if (res.account != null) {
        span.setStringAttribute('cloudflare.account', res.account!);
      }
      if (res.scriptName != null) {
        span.setStringAttribute('cloudflare.script.name', res.scriptName!);
      }
      if (res.scriptId != null) {
        span.setStringAttribute('cloudflare.script.id', res.scriptId!);
      }
      if (res.workerNamespace != null) {
        span.setStringAttribute(
            'cloudflare.worker.namespace', res.workerNamespace!);
      }
      if (res.workerEnvironment != null) {
        span.setStringAttribute(
            'cloudflare.worker.environment', res.workerEnvironment!);
      }
      if (res.triggerType != null) {
        span.setStringAttribute('cloudflare.trigger.type', res.triggerType!);
      }
      if (res.triggerRoute != null) {
        span.setStringAttribute('cloudflare.trigger.route', res.triggerRoute!);
      }
      if (res.colo != null) {
        span.setStringAttribute('cloudflare.colo', res.colo!);
      }
      if (res.runtime != null) {
        span.setStringAttribute('cloudflare.runtime', res.runtime!);
      }
      if (res.compatibilityDate != null) {
        span.setStringAttribute(
            'cloudflare.compatibility_date', res.compatibilityDate!);
      }
      if (res.cpuTimeMs != null) {
        span.setIntAttribute('cloudflare.cpu_time_ms', res.cpuTimeMs!);
      }
      if (res.wallTimeMs != null) {
        span.setIntAttribute('cloudflare.wall_time_ms', res.wallTimeMs!);
      }
      if (res.memoryMb != null) {
        span.setIntAttribute('cloudflare.memory_mb', res.memoryMb!);
      }
      if (res.subrequests != null) {
        span.setIntAttribute('cloudflare.subrequests', res.subrequests!);
      }
      if (res.kvNamespaceId != null) {
        span.setStringAttribute(
            'cloudflare.kv.namespace_id', res.kvNamespaceId!);
      }
      if (res.kvKey != null) {
        span.setStringAttribute('cloudflare.kv.key', res.kvKey!);
      }
      if (res.kvReadCount != null) {
        span.setIntAttribute('cloudflare.kv.read_count', res.kvReadCount!);
      }
      if (res.kvWriteCount != null) {
        span.setIntAttribute('cloudflare.kv.write_count', res.kvWriteCount!);
      }
      if (res.r2BucketName != null) {
        span.setStringAttribute('cloudflare.r2.bucket', res.r2BucketName!);
      }
      if (res.r2ObjectKey != null) {
        span.setStringAttribute('cloudflare.r2.object_key', res.r2ObjectKey!);
      }
      if (res.r2OperationsClassA != null) {
        span.setIntAttribute(
            'cloudflare.r2.operations.class_a', res.r2OperationsClassA!);
      }
      if (res.r2OperationsClassB != null) {
        span.setIntAttribute(
            'cloudflare.r2.operations.class_b', res.r2OperationsClassB!);
      }
      if (res.queueName != null) {
        span.setStringAttribute('cloudflare.queue.name', res.queueName!);
      }
      if (res.queueMessageCount != null) {
        span.setIntAttribute(
            'cloudflare.queue.message_count', res.queueMessageCount!);
      }
      if (res.queueRetries != null) {
        span.setIntAttribute('cloudflare.queue.retries', res.queueRetries!);
      }
      if (res.durableObjectNamespace != null) {
        span.setStringAttribute(
            'cloudflare.do.namespace', res.durableObjectNamespace!);
      }
      if (res.durableObjectId != null) {
        span.setStringAttribute('cloudflare.do.id', res.durableObjectId!);
      }
      if (res.aiModel != null) {
        span.setStringAttribute('cloudflare.ai.model', res.aiModel!);
      }
      if (res.aiTokensIn != null) {
        span.setIntAttribute('cloudflare.ai.tokens.in', res.aiTokensIn!);
      }
      if (res.aiTokensOut != null) {
        span.setIntAttribute('cloudflare.ai.tokens.out', res.aiTokensOut!);
      }
      if (res.statusCode != null) {
        span.setIntAttribute('http.response.status_code', res.statusCode!);
      }
      if (res.errorCode != null) {
        span.setStringAttribute('cloudflare.error.code', res.errorCode!);
      }
      final fail = res.errorCode != null ||
          (res.statusCode != null && res.statusCode! >= 400);
      if (fail) {
        span.setStringAttribute(ErrorResource.errorType.key,
            res.errorCode ?? 'cloudflare_workers.error');
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
