import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_klaviyo/flutter_klaviyo.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterKlaviyo.shared
      .setupWithPublicAPIKey(apiKey: 'YOUR_KLAVIYO_PUBLIC_API_KEY');
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    FlutterKlaviyo.shared.setUpUserEmail(userEmail: "yes@example.com");
    FlutterKlaviyo.shared.initNotification();
  }

  Future<void> initPlatformState() async {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: TextButton(
            onPressed: () {
              FlutterKlaviyo.shared
                  .trackEvent(eventName: 'Test Flutter Plugin');
            },
            child: Text('send test eventName: Test Flutter Plugin'),
          ),
        ),
      ),
    );
  }
}
