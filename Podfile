# Uncomment the next line to define a global platform for your project
platform :ios, '13.0'

target 'Gallery' do

# Pods for Gallery
pod 'SwiftLint'
pod 'Swinject'
pod 'PureLayout'

target 'GalleryTests' do
  inherit! :search_paths
  # Pods for testing
end

post_install do |installer|
  installer.pods_project.targets.each do |target|

    target.build_configurations.each do |config|
      # Disable Code Coverage for Pods projects
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
    end
  end
end
end
