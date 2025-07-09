Pod::Spec.new do |s|
  s.name             = 'CloudXCore'
  s.version          = '1.1.19'
  s.summary          = 'CloudX Core Framework'
  s.description      = 'Core framework for CloudX functionality'
  s.homepage         = 'https://github.com/cloudx-xenoss/CloudXCoreiOS'
  s.license          = { :type => 'Business Source License 1.1', :file => 'LICENSE' }
  s.author           = { 'CloudX' => 'support@cloudx.io' }
  s.source           = { :http => 'https://github.com/cloudx-xenoss/CloudXCoreiOS/releases/download/v1.1.19/CloudXCore.xcframework.zip' }
  s.ios.deployment_target = '14.0'
  s.vendored_frameworks = 'CloudXCore.xcframework'
  s.framework = 'Foundation'
  s.frameworks = 'SafariServices', 'CoreData'
  s.pod_target_xcconfig = {
    'DEFINES_MODULE' => 'YES',
    'CLANG_ENABLE_MODULES' => 'YES',
    'ENABLE_USER_SCRIPT_SANDBOXING' => 'NO'
  }
  s.user_target_xcconfig = {
    'ENABLE_USER_SCRIPT_SANDBOXING' => 'NO'
  }
end 
