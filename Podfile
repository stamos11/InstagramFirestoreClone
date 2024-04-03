# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'InstagramFirestoreClone' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for InstagramFirestoreClone
pod 'Firebase/Core'
pod 'Firebase/Database'
pod 'Firebase/Firestore'
pod 'Firebase/Storage'
pod 'Firebase/Messaging'
pod 'Firebase/Auth'
pod 'ActiveLabel'
pod 'SDWebImage', '~> 4.4.2'
pod 'JGProgressHUD', '~> 2.0.3'
pod 'YPImagePicker'

post_install do |installer|
    installer.generated_projects.each do |project|
        project.targets.each do |target|
            target.build_configurations.each do |config|
                config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
            end
        end
    end
end



end
