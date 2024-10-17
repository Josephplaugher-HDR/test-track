//
// COPYRIGHT © 2024 ESRI
//
// All rights reserved under the copyright laws of the United States
// and applicable international laws, treaties, and conventions.
//
// This material is licensed for use under the Esri Master
// Agreement (MA) and is bound by the terms and conditions
// of that agreement.
//
// You may redistribute and use this code without modification,
// provided you adhere to the terms and conditions of the MA
// and include this copyright notice.
//
// See use restrictions at http://www.esri.com/legal/pdfs/mla_e204_e300/english
//
// For additional information, contact:
// Environmental Systems Research Institute, Inc.
// Attn: Contracts and Legal Department
// 380 New York Street
// Redlands, California 92373
// USA
//
// email: legal@esri.com
//

// AUTO GENERATED FILE, DO NOT EDIT.

// ignore_for_file: unused_element, unused_field

part of '../../../arcgis_maps.dart';

/// A job represents a long running asynchronous action.
///
/// A job can be paused and re-started. A job can involve multiple network
/// requests.
abstract final class Job<T>
    with JsonSerializable
    implements _CallbackReceiver, _InstanceId, ffi.Finalizable {
  final RT_JobHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.Job_destroyInstance.cast());

  static Job<T>? _fromHandle<T>(RT_JobHandle handle) {
    if (handle == ffi.nullptr) return null;
    return Job._instanceCache.instanceWith(handle);
  }

  static _JobType _objectTypeOf(RT_JobHandle handle) {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Job_getObjectType(handle, errorHandler);
    });
    return _JobType._fromCoreValue(coreValue);
  }

  _JobType get _objectType => Job._objectTypeOf(_handle);

  Job._withHandle(RT_JobHandle handle)
      : _messages = Memoized(getter: () {
          final arrayHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_Job_getMessages(handle, errorHandler);
          });
          return arrayHandle.toList();
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.Job_created(_handle);
    }
    final userData = _callbackRelay.register(this);
    _jobDoneStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_Job_setJobDoneCallback(_handle,
              bindings.addresses.asyncJobJobDoneEvent, userData, errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_Job_setJobDoneCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
    _messageAddedStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_Job_setMessageAddedCallback(
              _handle,
              bindings.addresses.asyncJobMessageAddedEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_Job_setMessageAddedCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
    _progressChangedStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_Job_setProgressChangedCallback(
              _handle,
              bindings.addresses.asyncJobProgressChangedEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_Job_setProgressChangedCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
    _statusChangedStreamController = StreamController.broadcast(
      onListen: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_Job_setStatusChangedCallback(
              _handle,
              bindings.addresses.asyncJobStatusChangedEvent,
              userData,
              errorHandler);
        });
      },
      onCancel: () {
        _withThrowingErrorHandler((errorHandler) {
          runtimecore.RT_Job_setStatusChangedCallback(
              _handle, ffi.nullptr, userData, errorHandler);
        });
      },
    );
  }

  late final StreamController<void> _jobDoneStreamController;

  /// Sets the function that will be called when the job is done.
  ///
  /// A job is done when it has finished with a result, or failed with an error.
  /// Canceling a job will also set an error. Setting the function to null after
  /// it has already been set will stop the function from being called.
  Stream<void> get onJobDone => _jobDoneStreamController.stream;

  late final StreamController<JobMessage> _messageAddedStreamController;

  /// Indicates that a new [JobMessage] was added to [Job.messages].
  Stream<JobMessage> get onMessageAdded => _messageAddedStreamController.stream;

  late final StreamController<int> _progressChangedStreamController;

  /// Sets the function that will be called when the job's progress has changed.
  ///
  /// This method will be called each time the job's progress increments. The
  /// actual progress value can be read from [Job.progress]. Setting the
  /// function to null after it has already been set will stop the function from
  /// being called.
  Stream<int> get onProgressChanged => _progressChangedStreamController.stream;

  late final StreamController<JobStatus> _statusChangedStreamController;

  /// Indicates that the [Job.status] property has changed.
  Stream<JobStatus> get onStatusChanged =>
      _statusChangedStreamController.stream;

  static final _instanceCache =
      _InstanceCache(factory: _JobFactory(), kind: 'Job');

  Completer<T>? _jobDoneCompleter;

  static final Map<int, Object> _completersInProgress = HashMap();

  /// Contains an error if the job fails, otherwise null.
  ///
  /// The error is available when the [Job.status] is [JobStatus.failed].
  ArcGISException? get error {
    final errorHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Job_getError(_handle, errorHandler);
    });
    return errorHandle.toArcGISException();
  }

  @override
  int get _instanceId {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Job_getInstanceId(_handle, errorHandler);
    });
  }

  /// The job's messages.
  ///
  /// When a new messages is added the [Job.onMessageAdded] event is fired.
  List<JobMessage> get messages => _messages.value;

  final Memoized<_ArrayList<JobMessage>> _messages;

  /// The current progress of the job as a percentage complete.
  ///
  /// When the progress value changes the [Job.onProgressChanged] event is
  /// fired.
  int get progress {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Job_getProgress(_handle, errorHandler);
    });
  }

  /// The server job Id of the job.
  String get serverJobId {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Job_getServerJobId(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// The status of the job.
  ///
  /// When status changes the [Job.onStatusChanged] event is fired.
  JobStatus get status {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Job_getStatus(_handle, errorHandler);
    });
    return JobStatus._fromCoreValue(coreValue);
  }

  /// The result of a job that has succeeded.
  T? get result;

  /// Cancels this [Job] and waits for any asynchronous, server-side operations
  /// to be canceled.
  ///
  /// The job is canceled and will result in a [JobStatus.failed] status after
  /// all cancellation tasks have completed. For jobs running on a server, a
  /// cancel request is sent for the associated [Job.serverJobId]. You should
  /// always cancel unneeded jobs (for example when exiting your app) to avoid
  /// placing unnecessary load on the server. Examples of server-side jobs
  /// include:
  ///
  /// * [ExportTileCacheJob]
  /// * [ExportVectorTilesJob]
  /// * [GenerateGeodatabaseJob]
  /// * `GeoprocessingJob`
  ///
  /// In addition, the [GenerateOfflineMapJob] is composed of several
  /// server-side jobs, depending on the types of layers in your [ArcGISMap].
  /// Canceling this high-level job will also send a cancel request to the
  /// underlying server jobs.
  ///
  /// Upon calling this method, the [Job.status] is immediately set to
  /// [JobStatus.canceling].
  ///
  /// Return Value: The [Future]<bool> returns true if the job was successfully
  /// canceled, false otherwise. The [Future]<bool> always completes without an
  /// error. Returns false if server jobs were requested to cancel but the
  /// response was not successful. Also returns false if the job has reached
  /// [JobStatus.succeeded] or [JobStatus.failed] status.
  Future<bool> cancel() {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Job_cancelAsync(_handle, errorHandler);
    });
    return taskHandle.toFuture((element) => element.getValueAsBool()!);
  }

  /// Cancelable version of [cancel]. See that method for more information.
  CancelableOperation<bool> cancelCancelable() {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Job_cancelAsync(_handle, errorHandler);
    });
    return taskHandle
        .toCancelableOperation((element) => element.getValueAsBool()!);
  }

  /// Initiates a request to check the server status.
  ///
  /// The task contains a bool indicating if the check was successful. The task
  /// completes after the status has been checked. If the job is polling the
  /// server for status and is in a time gap, then calling this method will
  /// ensure a request is sent right away. The result can be false if the job is
  /// not checking server status for example if the job status is paused or
  /// uploading.
  ///
  /// Return Value: a task containing bool which indicates if the status was
  /// successfully checked.
  Future<bool> checkStatus() {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Job_checkStatusAsync(_handle, errorHandler);
    });
    return taskHandle.toFuture((element) => element.getValueAsBool()!);
  }

  /// Cancelable version of [checkStatus]. See that method for more information.
  CancelableOperation<bool> checkStatusCancelable() {
    final taskHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Job_checkStatusAsync(_handle, errorHandler);
    });
    return taskHandle
        .toCancelableOperation((element) => element.getValueAsBool()!);
  }

  /// Pauses the job.
  ///
  /// Return Value: A value indicating whether the job was successfully paused.
  bool pause() {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Job_pause(_handle, errorHandler);
    });
  }

  /// Starts the job if the job is not started or paused.
  ///
  /// Return Value: A value indicating whether the job was successfully started.
  /// False is returned if the job is already running, has completed, of if
  /// there's an error.
  bool start() {
    final isStarted = _start();
    if (isStarted) _startCompleter();
    return isStarted;
  }

  bool _start() {
    return _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Job_start(_handle, errorHandler);
    });
  }

  /// Starts the job and returns a [Future] that completes with either the result
  /// of the job or an error if the job did not finish successfully.
  Future<T> run() {
    switch (status) {
      case JobStatus.notStarted:
      case JobStatus.paused:
        final isStarted = start();
        if (isStarted) {
          return _jobDoneCompleter!.future;
        } else {
          return Future<T>.error(
              ArcGISException._(message: 'Job failed to start.'));
        }
      case JobStatus.started:
        return _jobDoneCompleter!.future;
      case JobStatus.succeeded:
        return Future.value(result!);
      case JobStatus.failed:
        return Future.error(error!);
      case JobStatus.canceling:
        return Future<T>.error(
            ArcGISException._(message: 'Job has been canceled.'));
    }
  }

  void _startCompleter() {
    if (_jobDoneCompleter != null) return;

    // a reference must be kept during completion to prevent garbage collection
    _completersInProgress[identityHashCode(this)] = this;
    _jobDoneCompleter = Completer<T>();
    onJobDone.first.then((_) => _jobDone());
  }

  void _finishCompleter() {
    _jobDoneCompleter = null;
    _completersInProgress.remove(identityHashCode(this));
  }

  void _jobDone() async {
    if (_jobDoneCompleter == null) return;

    if (status == JobStatus.succeeded) {
      final t = result;
      _jobDoneCompleter!.complete(t!);
    } else {
      try {
        _jobDoneCompleter!.completeError(
            error ?? ArcGISException._(message: status.toString()));
        await _jobDoneCompleter!.future;
      } catch (_) {
        // If the client code is not awaiting on the future, the call to completeError
        // will throw an unhandled exception. To capture that exception, we await on
        // the future and catch it here. If the client code later calls await, it will
        // receive the same exception, so there is no need to process it further here.
      }
    }

    _finishCompleter();
  }

  @override
  String toJsonString() {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_Job_toJSON(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  factory Job.fromJsonString(String jsonString) {
    final objectHandle = _withThrowingErrorHandler((errorHandler) {
      final jsonCString = _CString(jsonString);
      return runtimecore.RT_Job_fromJSON(jsonCString.bytes, errorHandler);
    });
    return Job._fromHandle(objectHandle)!;
  }

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job.fromJsonString(jsonEncode(json));
  }

  @override
  void _processCallback(List<dynamic> message) {
    assert(message.isNotEmpty);
    final asyncType = message[0] as int;
    switch (asyncType) {
      case AsyncType.asyncTypeJobJobDoneEvent:
        _jobDoneStreamController.add(null);
      case AsyncType.asyncTypeJobMessageAddedEvent:
        final event = () {
          final objectHandle =
              ffi.Pointer<ffi.Void>.fromAddress(message[2] as int)
                  as RT_JobMessageHandle;
          return JobMessage._fromHandle(objectHandle)!;
        }();
        _messageAddedStreamController.add(event);
      case AsyncType.asyncTypeJobProgressChangedEvent:
        _progressChangedStreamController.add(progress);
      case AsyncType.asyncTypeJobStatusChangedEvent:
        final event = () {
          final coreValue = message[2] as int;
          return JobStatus._fromCoreValue(coreValue);
        }();
        _statusChangedStreamController.add(event);
      default:
        logger.f('Job unhandled asyncType $asyncType');
    }
  }
}

final class _JobFactory implements _InstanceFactory<Job, RT_JobHandle> {
  @override
  Job createInstance({required RT_JobHandle handle}) {
    switch (Job._objectTypeOf(handle)) {
      case _JobType.downloadPreplannedOfflineMapJob:
        return DownloadPreplannedOfflineMapJob._withHandle(handle);
      case _JobType.estimateTileCacheSizeJob:
        return EstimateTileCacheSizeJob._withHandle(handle);
      case _JobType.exportTileCacheJob:
        return ExportTileCacheJob._withHandle(handle);
      case _JobType.exportVectorTilesJob:
        return ExportVectorTilesJob._withHandle(handle);
      case _JobType.generateGeodatabaseJob:
        return GenerateGeodatabaseJob._withHandle(handle);
      case _JobType.generateOfflineMapJob:
        return GenerateOfflineMapJob._withHandle(handle);
      case _JobType.offlineMapSyncJob:
        return OfflineMapSyncJob._withHandle(handle);
      case _JobType.syncGeodatabaseJob:
        return SyncGeodatabaseJob._withHandle(handle);
      case _JobType.unknown:
        throw UnsupportedError('Uncreatable type "unknown"');
      default:
        throw UnsupportedError('Uncreatable type of an abstract parent class');
    }
  }

  @override
  void destroyHandle(RT_JobHandle handle) {
    bindings.Job_destroy(handle.cast());
  }

  @override
  int identifierOfInstanceWithHandle(RT_JobHandle handle) {
    return runtimecore.RT_Job_getInstanceId(handle, ffi.nullptr);
  }
}

/// A message from a job.
final class JobMessage implements ffi.Finalizable {
  final RT_JobMessageHandle _handle;

  static final _nativeFinalizer =
      ffi.NativeFinalizer(bindings.addresses.JobMessage_destroy.cast());

  static JobMessage? _fromHandle(RT_JobMessageHandle handle) {
    if (handle == ffi.nullptr) return null;
    return JobMessage._withHandle(handle);
  }

  JobMessage._withHandle(RT_JobMessageHandle handle)
      : _timestamp = Memoized(getter: () {
          final dateTimeHandle = _withThrowingErrorHandler((errorHandler) {
            return runtimecore.RT_JobMessage_getTimestamp(handle, errorHandler);
          });
          return dateTimeHandle.toDateTime()!;
        }),
        _handle = handle {
    _nativeFinalizer.attach(this, _handle.cast());
    if (HandleTracker.trackingEnabled) {
      bindings.JobMessage_created(_handle);
    }
  }

  /// The job message's message string.
  String get message {
    final stringHandle = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_JobMessage_getMessage(_handle, errorHandler);
    });
    return stringHandle.toDartString();
  }

  /// The job message's severity: information, warning or error.
  JobMessageSeverity get severity {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_JobMessage_getSeverity(_handle, errorHandler);
    });
    return JobMessageSeverity._fromCoreValue(coreValue);
  }

  /// The source of the job message, either from the service or from this API.
  JobMessageSource get source {
    final coreValue = _withThrowingErrorHandler((errorHandler) {
      return runtimecore.RT_JobMessage_getSource(_handle, errorHandler);
    });
    return JobMessageSource._fromCoreValue(coreValue);
  }

  /// The date and time that the job message was created. This will be the
  /// current system time on the user's device.
  DateTime get timestamp => _timestamp.value;

  final Memoized<DateTime> _timestamp;
}

/// The different levels of severity of a job message.
///
/// Each of the values represents a different level of job message severity.
enum JobMessageSeverity {
  /// An informative message is generated during the job's execution, such as a
  /// job uploading data, job progressing on a server or job results. This
  /// message type never indicates a problem.
  info,

  /// A warning message is generated when a job experiences a situation that may
  /// cause a problem during its execution or when the result may not be what
  /// you expect. For example, when the job has failed to take a layer offline
  /// from an online map. Generally the job will run to successful completion
  /// even if there are one or more warnings.
  warning,

  /// An error message indicates a critical event that caused the job to fail.
  /// The error instance is also available from the job's [Job.error] property.
  error;

  factory JobMessageSeverity._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return info;
      case 1:
        return warning;
      case 2:
        return error;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case info:
        return 0;
      case warning:
        return 1;
      case error:
        return 2;
    }
  }
}

/// The origin of a job message.
///
/// Each of the values represents a different type of job message source.
enum JobMessageSource {
  /// A job message generated by this API.
  client,

  /// A job message generated by a service.
  service;

  factory JobMessageSource._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return client;
      case 1:
        return service;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case client:
        return 0;
      case service:
        return 1;
    }
  }
}

/// Indicates the current status of a job.
enum JobStatus {
  /// A job that has not started.
  notStarted,

  /// A job that has started and is executing.
  started,

  /// A job that is paused. Use [Job.start] to re-start the job.
  paused,

  /// A job that has completed successfully.
  succeeded,

  /// A job that has completed and has failed.
  failed,

  /// A job that is in the process of being canceled.
  canceling;

  factory JobStatus._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return notStarted;
      case 1:
        return started;
      case 2:
        return paused;
      case 3:
        return succeeded;
      case 4:
        return failed;
      case 5:
        return canceling;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case notStarted:
        return 0;
      case started:
        return 1;
      case paused:
        return 2;
      case succeeded:
        return 3;
      case failed:
        return 4;
      case canceling:
        return 5;
    }
  }
}

/// The different types of job.
///
/// Each of the values represents a different type of job.
enum _JobType {
  /// A generate geodatabase job.
  generateGeodatabaseJob,

  /// A synchronize geodatabase job.
  syncGeodatabaseJob,

  /// An export tile cache job.
  exportTileCacheJob,

  /// An estimate tile cache size job.
  estimateTileCacheSizeJob,

  /// A geoprocessing job.
  geoprocessingJob,

  /// A job to download an online map and its contents to an offline map.
  generateOfflineMapJob,

  /// An export vector tiles job.
  exportVectorTilesJob,

  /// A job to synchronize an online map's geodatabases with their originating
  /// services.
  offlineMapSyncJob,

  /// A job to download a preplanned map area to an offline map.
  downloadPreplannedOfflineMapJob,

  /// A job to validate topology of a utility network after edits.
  utilityNetworkValidationJob,

  /// This value is returned from C_API functions returning [_JobType] when an
  /// error has occurred.
  unknown;

  factory _JobType._fromCoreValue(int coreValue) {
    switch (coreValue) {
      case 0:
        return generateGeodatabaseJob;
      case 1:
        return syncGeodatabaseJob;
      case 2:
        return exportTileCacheJob;
      case 3:
        return estimateTileCacheSizeJob;
      case 4:
        return geoprocessingJob;
      case 5:
        return generateOfflineMapJob;
      case 6:
        return exportVectorTilesJob;
      case 7:
        return offlineMapSyncJob;
      case 8:
        return downloadPreplannedOfflineMapJob;
      case 9:
        return utilityNetworkValidationJob;
      case -1:
        return unknown;
      default:
        throw ArgumentError(coreValue, 'Unknown core value');
    }
  }

  @visibleForTesting
  int get coreValue {
    switch (this) {
      case generateGeodatabaseJob:
        return 0;
      case syncGeodatabaseJob:
        return 1;
      case exportTileCacheJob:
        return 2;
      case estimateTileCacheSizeJob:
        return 3;
      case geoprocessingJob:
        return 4;
      case generateOfflineMapJob:
        return 5;
      case exportVectorTilesJob:
        return 6;
      case offlineMapSyncJob:
        return 7;
      case downloadPreplannedOfflineMapJob:
        return 8;
      case utilityNetworkValidationJob:
        return 9;
      case unknown:
        return -1;
    }
  }
}
