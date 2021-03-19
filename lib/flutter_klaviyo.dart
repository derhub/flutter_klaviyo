import 'dart:async';

import 'package:flutter/services.dart';

class FlutterKlaviyo {
  static const MethodChannel _channel = const MethodChannel('flutter_klaviyo');

  static Future<void> setupWithPublicAPIKey({String apiKey}) {
    final args = <String, dynamic>{
      'apiKey': apiKey,
    };
    return _channel.invokeMethod<void>('setupWithPublicAPIKey', args);
  }

  static Future<void> initNotification() {
    return _channel.invokeMethod<void>('initNotification');
  }

  // TODO: add support for customerProperties and properties parameter
  static Future<void> trackEvent({String eventName}) {
    final args = <String, dynamic>{
      'eventName': eventName,
    };
    return _channel.invokeMethod<void>('trackEvent', args);
  }

  static Future<void> setUpUserEmail({String userEmail}) {
    final args = <String, dynamic>{
      'userEmail': userEmail,
    };
    return _channel.invokeMethod<void>('setUpUserEmail', args);
  }
}
