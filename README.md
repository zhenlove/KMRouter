# KMRouter

[![Build Status](https://travis-ci.com/zhenlove/KMRouter.svg?branch=master)](https://travis-ci.com/zhenlove/KMRouter)
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


### 仅用于模块之间解耦合

## 1.加载Swift类
- 1.方法一
```Swift
@objc(ModuleA)
class ModuleA{

}
KMRouter.path(urlStr: "KMModuleA?titleName=张三")
```
- 2.方法二
```Swift
// 报名.类名
KMRouter.path(urlStr: "KMModuleA.KMModuleA?titleName=张三")
```
## 模块间通信
* 采用通知模式返回数据
```Swift
// 添加通知
NotificationCenter.default.addObserver(self, selector: #selector(self.notificationAction(_:)), name: Notification.Name(rawValue: "ChangeBackgroundColor"), object: nil)
// 移除通知
NotificationCenter.default.removeObserver(self)
// 发送通知
NotificationCenter.default.post(name: NSNotification.Name(rawValue: "ChangeBackgroundColor"), object: nil, userInfo: nil)
```
