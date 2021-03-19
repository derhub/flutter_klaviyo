# flutter_klaviyo

Unofficial Flutter plugin for [klaviyo ios](https://github.com/klaviyo/klaviyo-swift-sdk)

# Setup

### Setup public key
read more here https://github.com/klaviyo/klaviyo-swift-sdk

```dart
FlutterKlaviyo.setupWithPublicAPIKey(apiKey: 'YOUR_KLAVIYO_PUBLIC_API_KEY');
```

### Setup user email

```dart
FlutterKlaviyo.setUpUserEmail(userEmail: "yes@example.com");
```

### Track Event

note: It only support name only event

```dart
Klaviyo.sharedInstance.trackEvent(eventName: "User login")
```

### Setup with push notification

note: this is usually run after ` FlutterKlaviyo.setUpUserEmail(...`

```dart
FlutterKlaviyo.setUpUserEmail(userEmail: "yes@example.com");
FlutterKlaviyo.initNotification();
```

# Links
- [klaviyo-swift-sdk](https://github.com/klaviyo/klaviyo-swift-sdk)
- [klaviyo-android-sdk](https://github.com/klaviyo/klaviyo-android-sdk)
