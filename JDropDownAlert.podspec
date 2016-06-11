# Be sure to run `pod lib lint JDropDownAlert.podspec' to ensure this is a


Pod::Spec.new do |s|
  s.name             = 'JDropDownAlert'
  s.version          = '0.2.0'
  s.summary          = 'JDropDownAlert Is Simple Alert View For iOS Application.'

  s.description      = <<-DESC
JDropDownAlert Is Simple Alert View For iOS Application. JDropDownAlert Has a TitleLabel and a MessageLabel. You Can Use Both Or Just TitleLabel. Supports Positions and Animation Directoins
                       DESC

  s.homepage         = 'https://github.com/trilliwon'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Steve Jo' => 'trilliwon@gmail.com' }
  s.source           = { :git => 'https://github.com/trilliwon/JDropDownAlert.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/trilliwon'

  s.ios.deployment_target = '8.0'

  s.source_files = 'JDropDownAlert/Classes/*'

  s.frameworks = 'UIKit'
end
