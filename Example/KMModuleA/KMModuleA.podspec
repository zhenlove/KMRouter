Pod::Spec.new do |s|
  s.name             = 'KMModuleA'
  s.version          = '0.0.1'
  s.summary          = '组件化开发beta'
  s.description      = <<-DESC
  TODO: Add long description of the pod here.
    DESC

  s.homepage         = 'https://git.coding.net/zhenlove/KMRouter.git'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'zhenlove' => '121910347@qq.com' }
  s.source           = { :git => 'https://github.com/zhenlove/KMRouter.git', :tag => s.version.to_s }
  s.ios.deployment_target = '9.0'
  s.source_files = 'KMModuleA/Classes/*.swift'
  s.dependency 'KMRouter'
  s.dependency 'KMConfigure'
end
