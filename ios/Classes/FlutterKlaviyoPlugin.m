#import "FlutterKlaviyoPlugin.h"
#if __has_include(<flutter_klaviyo/flutter_klaviyo-Swift.h>)
#import <flutter_klaviyo/flutter_klaviyo-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_klaviyo-Swift.h"
#endif

@implementation FlutterKlaviyoPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterKlaviyoPlugin registerWithRegistrar:registrar];
}
@end
