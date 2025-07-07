Pod::Spec.new do |s|
  s.name           = 'ExpoAnyConfetti'
  s.version        = '1.0.0'
  s.summary        = 'A module that displays confetti'
  #indicate that its based on any-distance
  s.description    = 'A module that displays confetti based on any-distance confetti'
  s.author         = 'Julian Gargicevich'
  s.homepage       = 'https://docs.expo.dev/modules/'
  s.platforms      = {
    :ios => '15.1',
    :tvos => '15.1'
  }
  s.source         = { git: '' }
  s.static_framework = true

  s.dependency 'ExpoModulesCore'
  s.dependency 'PureLayout'

  s.pod_target_xcconfig = {
    'DEFINES_MODULE' => 'YES',
  }

  s.source_files = "**/*.{h,m,mm,swift,hpp,cpp}"

  s.resource_bundles = {
    'ExpoAnyConfettiResources' => ['**/*.xcassets', '**/*.png']
  }
end
