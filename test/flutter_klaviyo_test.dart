import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_klaviyo/flutter_klaviyo.dart';

void main() {
  const MethodChannel channel = MethodChannel('flutter_klaviyo');
  MethodCall methodCall;
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall m) async {
      methodCall = m;
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
    methodCall = null;
  });

  test('setupWithPublicAPIKey', () async {
    await FlutterKlaviyo.setupWithPublicAPIKey(apiKey: 'test');
    expect(methodCall,
        isMethodCall('setupWithPublicAPIKey', arguments: {'apiKey': 'test'}));
  });

  test('initNotification', () async {
    await FlutterKlaviyo.initNotification();
    expect(methodCall, isMethodCall('initNotification', arguments: null));
  });

  test('trackEvent', () async {
    await FlutterKlaviyo.trackEvent(eventName: 'test');
    expect(
      methodCall,
      isMethodCall('trackEvent', arguments: {'eventName': 'test'}),
    );
  });

  test('setUpUserEmail', () async {
    await FlutterKlaviyo.setUpUserEmail(userEmail: 'test');
    expect(
      methodCall,
      isMethodCall('setUpUserEmail', arguments: {'userEmail': 'test'}),
    );
  });
}
