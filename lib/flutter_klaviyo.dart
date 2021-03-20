import 'dart:async';

import 'package:flutter/services.dart';

class FlutterKlaviyo {
  static const MethodChannel _channel = const MethodChannel('flutter_klaviyo');

  static void setupWithPublicAPIKey({String apiKey}) {
    final args = <String, dynamic>{
      'apiKey': apiKey,
    };
    _channel.invokeMethod<void>('setupWithPublicAPIKey', args);
  }

  static void initNotification() {
    _channel.invokeMethod<void>('initNotification');
  }

  // TODO: add support for customerProperties and properties parameter
  static void trackEvent({String eventName}) {
    final args = <String, dynamic>{
      'eventName': eventName,
    };
    _channel.invokeMethod<void>('trackEvent', args);
  }

  static void setUpUserEmail({String userEmail}) {
    final args = <String, dynamic>{
      'userEmail': userEmail,
    };
    _channel.invokeMethod<void>('setUpUserEmail', args);
  }
}
