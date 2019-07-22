source 'https://github.com/CocoaPods/Specs.git'

# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'
use_frameworks!

target 'InspetorDemo' do
  # Comment the next line if you don't want to use dynamic frameworks
  pod 'Inspetor'
  # Pods for InspetorIntegration

end

post_install do |installer_representation|
  # NOTE: If you are using a CocoaPods version prior to 0.38, replace `pods_project` with `project` on the below line
  installer_representation.pods_project.targets.each do |target|
    if target.name.end_with? "INTULocationManager"
      target.build_configurations.each do |config|
        config.build_settings['GCC_PREPROCESSOR_DEFINITIONS'] = ['$(inherited)', 'INTU_ENABLE_LOGGING=0']
      end
    end
  end
end
