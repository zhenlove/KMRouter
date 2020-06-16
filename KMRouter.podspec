Pod::Spec.new do |s|
  s.name             = 'KMRouter'
  s.version          = '0.1.6'
  s.summary          = '组件化开发beta'
  s.description      = <<-DESC
  1.全新组件化基础库，支持Swift、Objective-C。
  2.采用URL方式加载。
  3.使用教程'https://github.com/zhenlove/KMRouter.git'
    DESC

  s.homepage         = 'https://github.com/zhenlove/KMRouter.git'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'zhenlove' => '********@****.com' }
  s.source           = { :git => 'https://github.com/zhenlove/KMRouter.git', :tag => s.version.to_s }
  s.ios.deployment_target = '9.0'
  s.swift_version = '5.0'
  s.source_files = 'KMRouter/Classes/*.swift'
  s.dependency 'KMTools'
end
