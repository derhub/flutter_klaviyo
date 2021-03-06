import Flutter
import KlaviyoSwift
import UIKit
import UserNotifications

public class SwiftFlutterKlaviyoPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_klaviyo", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterKlaviyoPlugin()

    registrar.addApplicationDelegate(instance)
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  // APPDELIGATE ------------------
  public func application(_: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
    Klaviyo.sharedInstance.addPushDeviceToken(deviceToken: deviceToken as Data)
  }

  func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any]) {
    Klaviyo.sharedInstance.handlePush(userInfo: userInfo as NSDictionary)
  }

  public func application(_: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
    if error._code == 3010 {
      print("push notifications are not supported in the iOS simulator")
    } else {
      print("application:didFailToRegisterForRemoteNotificationsWithError: \(error)")
    }
  }

  // APPDELIGATE END ------------------

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "initNotification":
      handleInit(call, result: result)
    case "setupWithPublicAPIKey":
      handleSetupWithPublicAPIKey(call, result: result)
    case "setUpUserEmail":
      handleSetUpUserEmail(call, result: result)
    case "trackEvent":
      handleTrackEvent(call, result: result)
    default:
      result(FlutterMethodNotImplemented)
    }
  }

  private func handleInit(_: FlutterMethodCall, result: @escaping FlutterResult) {
    if #available(iOS 10, *) {
      var options: UNAuthorizationOptions = [.alert, .sound, .badge]
      if #available(iOS 12.0, *) {
        options = UNAuthorizationOptions(rawValue: options.rawValue | UNAuthorizationOptions.provisional.rawValue)
      }
      UNUserNotificationCenter.current().requestAuthorization(options: options) { _, _ in
        // Enable / disable features based on response
      }
      UIApplication.shared.registerForRemoteNotifications()
    } else {
      let types: UIUserNotificationType = [.alert, .badge, .sound]
      let setting = UIUserNotificationSettings(types: types, categories: nil)
      UIApplication.shared.registerUserNotificationSettings(setting)
      UIApplication.shared.registerForRemoteNotifications()
    }
    result(nil)
  }

  private func handleSetupWithPublicAPIKey(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    let args = call.arguments as? [String: Any] ?? [String: Any]()
    let apiKey = args["apiKey"] as! String
    Klaviyo.setupWithPublicAPIKey(apiKey: apiKey)
    result(nil)
  }

  private func handleSetUpUserEmail(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    let args = call.arguments as? [String: Any] ?? [String: Any]()
    let userEmail = args["userEmail"] as! String
    Klaviyo.sharedInstance.setUpUserEmail(userEmail: userEmail)
    result(nil)
  }

  private func handleTrackEvent(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    let args = call.arguments as? [String: Any] ?? [String: Any]()
    let eventName = args["eventName"] as! String
    // TODO: add support for customerProperties and properties parameter

    Klaviyo.sharedInstance.trackEvent(eventName: eventName)
    result(nil)
  }
}
