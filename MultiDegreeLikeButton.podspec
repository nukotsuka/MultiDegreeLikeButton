#
# Be sure to run `pod lib lint MultiDegreeLikeButton.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MultiDegreeLikeButton'
  s.version          = '0.1.0'
  s.summary          = 'A button expanding while tapping.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
MultiDegreeLikeButton is a button which expresses the degree of like by changing the size of the button.
The button gradually expands while the user is tapping.
And if the button is 3D touched, it immediately expands.
                       DESC

  s.homepage         = 'https://github.com/nukotsuka/MultiDegreeLikeButton'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'nukotsuka' => 'nukotsuka@gmail.com' }
  s.source           = { :git => 'https://github.com/nukotsuka/MultiDegreeLikeButton.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/nukotsuka'

  s.ios.deployment_target = '10.0'

  s.source_files = 'MultiDegreeLikeButton/Classes/**/*'
  s.resources = 'MultiDegreeLikeButton/Assets/*.xcassets'
  # s.resource_bundles = {
  #   'MultiDegreeLikeButton' => ['MultiDegreeLikeButton/Assets/*.xcassets']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
