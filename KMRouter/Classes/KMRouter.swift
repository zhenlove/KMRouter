//
//  KMRouter.swift
//  Pods
//
//  Created by Ed on 2018/7/27.
//

import Foundation

//模块
//1.返回自定义短连接。
//2.自动注册短连接。
//3.定义回调函数。Result
//Router
//-加载方式
//1.push //使用导航控制器加载
//2.present //使用模态视图加载
//3.open //使用Webview加载
//4.handle //定义统一回调函数Result
//-传入参数
//使用URL 参数拼接方式

public protocol KMRouterProtocol:NSObjectProtocol {
    
    func handle<T>(completion:Result< T , Error >) -> Void
}

//@objcMembers
open class KMRouter: NSObject {
    
    open func interfaceForProtocol(_ proto: Protocol) -> AnyObject? {
        let nameArr = NSStringFromProtocol(proto).components(separatedBy: ".")
        if nameArr.count == 1 {
            let name = "KM" + nameArr.last!
            let model = NSClassFromString(name) as! NSObject.Type;
            return model.init()
        }else{
            let name = nameArr.first!  + "." + "KM" + nameArr.last!
            let model = NSClassFromString(name) as! NSObject.Type;
            return model.init()
        }
    }
    
    public func interfaceForURL(_ url:NSURL) -> Void {
        
    }
    
    public func push(_ url:URL, _ ViewController: UIViewController) -> KMRouterProtocol? {
        return nil
    }
    public func persent(_ url:URL, _ ViewController: UIViewController) -> KMRouterProtocol? {
        return nil
    }
    public func open(_ url:URL, _ ViewController: UIViewController) -> KMRouterProtocol? {
        return nil
    }
}
