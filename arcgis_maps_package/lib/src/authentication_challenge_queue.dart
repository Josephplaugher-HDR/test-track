//
// COPYRIGHT © 2024 Esri
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

part of '../arcgis_maps.dart';

class _AuthenticationChallengeQueue {
  final AuthenticationManager _authenticationManager;
  final _challenges = <ArcGISAuthenticationChallenge>[];
  var _challengeInProgress = false;

  // Internal stream of queue length changes (for testing).
  final _queueLengthStreamController = StreamController<int>.broadcast();
  Stream<int> get _onQueueLengthChanged => _queueLengthStreamController.stream;

  /// Listens to authentication challenges from core and queues them up. Challenges
  /// are released one at a time through the arcGISAuthenticationChallengeHandler
  /// to the client code. When a challenge is resolved, matching challenges
  /// are processed out of the queue, and the next challenge is released. If the
  /// client has not set a challenge handler, challenges are immediately failed.
  _AuthenticationChallengeQueue(this._authenticationManager) {
    _authenticationManager._onArcGISAuthenticationChallengeIssued
        .listen(_intake);
  }

  /// Add challenge to the queue and make sure one is in process.
  void _intake(ArcGISAuthenticationChallenge challenge) {
    challenge._queue = WeakReference(this);
    _challenges.add(challenge);
    _queueLengthStreamController.add(_challenges.length);
    _processNext();
  }

  /// Process the next challenge in the queue.
  void _processNext() {
    if (_challengeInProgress || _challenges.isEmpty) return;

    final challenge = _challenges.removeAt(0);
    _queueLengthStreamController.add(_challenges.length);
    _challengeInProgress = true;
    final handler =
        _authenticationManager.arcGISAuthenticationChallengeHandler ??
            _failChallengeHandler;

    try {
      handler.handleArcGISAuthenticationChallenge(challenge);
    } catch (e) {
      final wrappedException = e is Exception ? e : Exception(e.toString());
      final platformApiError =
          _ClientReferenceManager.generateClientReferenceFromDartObject(
              wrappedException);
      challenge._continueAndFailWithPlatformApiError(
          platformApiError: platformApiError);
    }
  }

  /// The in-process challenge was resolved with cancel.
  void _cancel(ArcGISAuthenticationChallenge challenge) {
    _finalize(
      challenge,
      applyToMatches: (c) => c._cancel(),
    );
  }

  /// The in-process challenge was resolved with continueAndFail.
  void _continueAndFail(ArcGISAuthenticationChallenge challenge) {
    _finalize(
      challenge,
      applyToMatches: (c) => c._continueAndFail(),
    );
  }

  /// The in-process challenge was resolved with continueWithCredential.
  void _continueWithCredential(
      ArcGISAuthenticationChallenge challenge, ArcGISCredential credential) {
    _finalize(
      challenge,
      applyToMatches: (c) => c._continueWithCredential(credential),
    );
  }

  /// Apply the operation to any matching challenges and remove them from the queue.
  void _finalize(
    ArcGISAuthenticationChallenge challenge, {
    required void Function(ArcGISAuthenticationChallenge c) applyToMatches,
  }) {
    int beforeQueueLength = _challenges.length;
    _challenges.removeWhere((c) {
      if (c._isMatch(challenge)) {
        applyToMatches(c);
        return true;
      }
      return false;
    });
    if (beforeQueueLength != _challenges.length) {
      _queueLengthStreamController.add(_challenges.length);
    }

    _challengeCompleted();
  }

  /// The in-process challenge was resolved, so release the next challenge.
  void _challengeCompleted() {
    _challengeInProgress = false;
    _processNext();
  }

  static final _failChallengeHandler = _FailChallengeHandler();
}

/// A challenge handler that fails all challenges.
class _FailChallengeHandler implements ArcGISAuthenticationChallengeHandler {
  @override
  void handleArcGISAuthenticationChallenge(
      ArcGISAuthenticationChallenge challenge) {
    const doc =
        'https://developers.arcgis.com/documentation/mapping-apis-and-services/security/';
    logger.w(
        'An ArcGIS authentication error occurred when accessing "${challenge.requestUri.host}". An API key or credential may be required. For more information see ($doc).');

    challenge.continueAndFail();
  }
}
