#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint flutter_klaviyo.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'flutter_klaviyo'
  s.version          = '0.1.0'
  s.summary          = 'Klaviyo flutter plugin'
  s.description      = <<-DESC
Unofficial Klaviyo flutter plugin
                       DESC
  s.homepage         = 'https://github.com/derhub/flutter_klaviyo'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'EB' => 'derhubby@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.dependency 'KlaviyoSwift', '~> 1.5.0'
  s.platform = :ios, '11.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
