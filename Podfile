source 'https://github.com/CocoaPods/Specs.git'

use_frameworks!

# ignore all warnings from all pods
inhibit_all_warnings!

def shared_pods
    pod 'libextobjc', '~> 0.4'
end

target 'NetworkingBlocks iOS' do
    platform :ios, '8.0'
    shared_pods
end

target 'NetworkingBlocks macOS' do
    platform :osx, '10.9'
    shared_pods
end

target 'NetworkingBlocksTests' do
    platform :ios, '8.0'
    pod 'Expecta'
    pod 'OCMock'
end
