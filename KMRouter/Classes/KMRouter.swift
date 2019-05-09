//
//  KMRouter.swift
//  Pods
//
//  Created by Ed on 2018/7/27.
//

import Foundation

public typealias  KMCallBack = (_ result:Any?,  _ error:Error?) ->Void

/// 路由错误信息
public enum KMRouterError:Error, LocalizedError {
    
    /// URL错误
    case badURL
    
    /// 没有找到导航栏
    case noNavigation
    
    /// 自定义错误可惜
    case customError(String)
    
    /// 描述发生错误的本地化消息。
    public var errorDescription: String? {
        switch self {
        case .badURL: return "URL 解析失败"
        case .noNavigation: return "没有传入导航控制器"
        case .customError(let str): return str
        }
    }
}


/// 基础协议
@objc public protocol KMRouterProtocol {
    
    /// 方便持有block
    @objc optional var callBack:KMCallBack? { get set }
    
    /// 返回数据给调用者
    ///
    /// - Parameter completion: 统一回调
    @objc optional func handle(completion:@escaping KMCallBack)
}



open class KMRouter :NSObject{
    
    
    /// 创建URL组件
    ///
    /// - Parameter urlStr: 路由地址
    /// - Returns: URL组件
    func createComponents(_ urlStr:String?) -> URLComponents? {
        if let urlStr = urlStr?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
            return URLComponents.init(string: urlStr)
        }
        return nil
    }
    
    /// 创建类名
    ///
    /// - Parameter components: URL组件
    /// - Returns: 类名
    func createClassType(_ components:URLComponents) -> UIViewController.Type? {
        if let className = components.url?.lastPathComponent {
            return NSClassFromString(className) as? UIViewController.Type
        }
        return nil
    }
    
    /// 创建实例
    ///
    /// - Parameters:
    ///   - mocelClass: 类名
    ///   - components: URL组件
    /// - Returns: 实例
    func createObject(_ mocelClass:UIViewController.Type, _ components:URLComponents) -> UIViewController {
        let obj = mocelClass.init()
        if let parmt = components.queryItems {
            for item in parmt {
                obj.setValue(item.value, forKey: item.name)
            }
        }
        return obj
    }
    
    /// 创建控制器
    ///
    /// - Parameter urlStr: 路由地址
    /// - Returns: 返回控制器
    func viewControllerFromUrl(_ urlStr:String?) -> UIViewController? {
        if let components = createComponents(urlStr),
            let modelClass = createClassType(components){
                return createObject(modelClass, components)
        }
        return nil
    }
    
    
    /// 导航显示控制器
    ///
    /// - Parameters:
    ///   - urlStr: 路由地址
    ///   - control: 承载控制器
    ///   - completion: 统一回调
    @objc(push:control:completion:)
    public func push(_ urlStr:String?, _ control: UIViewController,_ completion:KMCallBack? = nil) {
        if let vc = viewControllerFromUrl(urlStr) {
            if let nav = control.navigationController {
                nav.pushViewController(vc, animated: true)
            }else{
                completion?(nil,KMRouterError.noNavigation)
            }
            if let vc = vc as? KMRouterProtocol, let callback = completion {
                vc.handle?(completion: callback)
            }
        }else{
            completion?(nil,KMRouterError.badURL)
        }
    }
    
    /// 模态显示控制器
    ///
    /// - Parameters:
    ///   - urlStr: 路由地址
    ///   - control: 承载控制器
    ///   - completion: 统一回调
    @objc(persent:control:completion:)
    public func persent(_ urlStr:String?, _ control: UIViewController,_ completion:KMCallBack? = nil) {
        if let vc = viewControllerFromUrl(urlStr) {
            control.present(vc, animated: true, completion: nil)
            if let vc = vc as? KMRouterProtocol, let callback = completion {
                vc.handle?(completion: callback)
            }
        }else{
            completion?(nil,KMRouterError.badURL)
        }
    }

}

