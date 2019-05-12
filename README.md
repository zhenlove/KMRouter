# KMRouter

[![CI Status](https://img.shields.io/travis/zhenlove/KMRouter.svg?style=flat)](https://travis-ci.org/zhenlove/KMRouter)
[![Version](https://img.shields.io/cocoapods/v/KMRouter.svg?style=flat)](https://cocoapods.org/pods/KMRouter)
[![License](https://img.shields.io/cocoapods/l/KMRouter.svg?style=flat)](https://cocoapods.org/pods/KMRouter)
[![Platform](https://img.shields.io/cocoapods/p/KMRouter.svg?style=flat)](https://cocoapods.org/pods/KMRouter)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

KMRouter is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'KMRouter'
```

## Author

zhenlove, ************@******.com

## License

KMRouter is available under the MIT license. See the LICENSE file for more info. 

## Note

- 1.加载Swift时
```Swift
@objc(ModuleA)
class ModuleA{

}
```
- 2.给Swift对象赋值时,属性前要加@objc
```Swift
@objc var titleName: String?
```

- 3.当需要返回数据时需要遵循
```Objc
<KMRouterProtocol>
```
- 4.当需要持有KMCallBack时
    
 obcj
```Objc
@implementation KMModuleD
@synthesize callBack;
```
swift
```Swift
var callBack: KMCallBack?
```