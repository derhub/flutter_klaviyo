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

  test('test shared instace', () {
    FlutterKlaviyo instance1 = FlutterKlaviyo();
    FlutterKlaviyo instance2 = FlutterKlaviyo();

    expect(identical(instance1, instance2), true);
    expect(identical(FlutterKlaviyo.shared, FlutterKlaviyo.shared), true);
  });

  test('setupWithPublicAPIKey', () async {
    await FlutterKlaviyo.shared.setupWithPublicAPIKey(apiKey: 'test');
    expect(methodCall,
        isMethodCall('setupWithPublicAPIKey', arguments: {'apiKey': 'test'}));
  });

  test('initNotification', () async {
    await FlutterKlaviyo.shared.initNotification();
    expect(methodCall, isMethodCall('initNotification', arguments: null));
  });

  test('trackEvent', () async {
    await FlutterKlaviyo.shared.trackEvent(eventName: 'test');
    expect(
      methodCall,
      isMethodCall('trackEvent', arguments: {'eventName': 'test'}),
    );
  });

  test('setUpUserEmail', () async {
    await FlutterKlaviyo.shared.setUpUserEmail(userEmail: 'test');
    expect(
      methodCall,
      isMethodCall('setUpUserEmail', arguments: {'userEmail': 'test'}),
    );
  });
}
