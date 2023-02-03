platform :ios, '13.0'
use_frameworks!
inhibit_all_warnings!

def testing_pods
  pod 'Quick'
  pod 'Nimble'
  pod 'RxNimble'
  pod 'RxSwift'
end

target 'iOSTemplates' do
  # UI
  pod 'SDWebImage'
  pod 'SkeletonView'

  # Rx
  pod 'RxAlamofire'
  pod 'RxCocoa'
  pod 'RxDataSources'
  pod 'RxSwift'
  pod 'RxBiBinding'
  pod 'RxSwiftExt'

  # Local Storage
  pod 'KeychainAccess'

  # Tools
  pod 'Firebase/Crashlytics'
  pod 'IQKeyboardManagerSwift'
  pod 'R.swift'

  # Development
  pod 'SwiftLint'

  target 'iOSTemplatesTests' do
    inherit! :search_paths
    testing_pods
  end

  target 'iOSTemplatesUITests' do
    testing_pods
  end
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings.delete 'IPHONEOS_DEPLOYMENT_TARGET'
      config.build_settings['ENABLE_BITCODE'] = 'NO'
      # Fix some pods creating bundle, asking for signing
      if target.respond_to?(:product_type)
        target.build_configurations.each do |config|
            config.build_settings['CODE_SIGNING_ALLOWED'] = 'NO'
        end
      end
    end
  end
end
