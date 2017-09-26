#
# Be sure to run `pod lib lint NetworkingBlocks.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "NetworkingBlocks"
  s.version          = "0.0.1"
  s.summary          = "NetworkingBlocks is a networking library for iOS and Mac OS X."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!
  s.description      = "It's built on top of the Foundation URL Loading System, extending the powerful high-level networking
                        abstractions built into Cocoa. It has a modular architecture with well-designed,
                        feature-rich APIs that are a joy to use. Design by SOLID princep."

  s.homepage         = "https://github.com/tayphoon-ios/NetworkingBlocks"
  s.license          = 'MIT'
  s.author           = { "Tayphoon and iOS Team" => "tayphoon.company@gmail.com" }
  s.source           = { :git => "https://github.com/tayphoon-ios/NetworkingBlocks.git", :tag => s.version }

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.9'
  s.requires_arc = true

  s.default_subspecs = 'OperationBuilders'

  s.subspec 'Operations' do |operations|
    operations.public_header_files = 'NetworkingBlocks/TCNetworkingBlocks.h', 'NetworkingBlocks/Operations/**/*.{h}'
    operations.source_files = 'NetworkingBlocks/Operations/**/*.{h,m}'

    operations.dependency 'NetworkingBlocks/CoreComponents'
    operations.dependency 'NetworkingBlocks/Protocols'
    operations.dependency 'libextobjc', '~> 0.4'
  end

  s.subspec 'OperationBuilders' do |obilder|
    obilder.public_header_files = 'NetworkingBlocks/OperationBuilders/**/*.{h}'
    obilder.source_files = 'NetworkingBlocks/OperationBuilders/**/*.{h,m}'

    obilder.dependency 'NetworkingBlocks/Operations'
  end

  s.subspec 'CoreComponents' do |ccomponents|
    ccomponents.public_header_files = 'NetworkingBlocks/CoreComponents/**/*.{h}'
    ccomponents.source_files = 'NetworkingBlocks/CoreComponents/**/*.{h,m}'
  end

  s.subspec 'Protocols' do |protocols|
    protocols.public_header_files = 'NetworkingBlocks/Protocols/**/*.{h}'
    protocols.source_files = 'NetworkingBlocks/Protocols/**/*.{h,m}'
  end

  s.subspec 'AFNetworking' do |afnetworking|
    afnetworking.public_header_files = 'AFNetworking/CoreComponents/**/*.{h}'
    afnetworking.source_files = 'AFNetworking/CoreComponents/**/*.{h,m}'
    afnetworking.dependency 'NetworkingBlocks/CoreComponents'
    afnetworking.dependency 'AFNetworking', '~> 3.1.0'
  end

end
