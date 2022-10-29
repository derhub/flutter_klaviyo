import 'dart:async';

import 'package:flutter/services.dart';

class FlutterKlaviyo {
  static const MethodChannel _channel = MethodChannel('flutter_klaviyo');
  static final FlutterKlaviyo _shared = FlutterKlaviyo._internal();

  FlutterKlaviyo._internal();

  static FlutterKlaviyo get shared => _shared;

  factory FlutterKlaviyo() {
    return _shared;
  }

  Future<void> setupWithPublicAPIKey({required String apiKey}) {
    final args = <String, dynamic>{
      'apiKey': apiKey,
    };
    return _channel.invokeMethod<void>('setupWithPublicAPIKey', args);
  }

  Future<void> initNotification() {
    return _channel.invokeMethod<void>('initNotification');
  }

  // TODO: add support for customerProperties and properties parameter
  Future<void> trackEvent({required String eventName}) {
    final args = <String, dynamic>{
      'eventName': eventName,
    };
    return _channel.invokeMethod<void>('trackEvent', args);
  }

  Future<void> setUpUserEmail({required String userEmail}) {
    final args = <String, dynamic>{
      'userEmail': userEmail,
    };
    return _channel.invokeMethod<void>('setUpUserEmail', args);
  }
}
