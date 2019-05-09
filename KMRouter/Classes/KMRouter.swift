//
//  KMRouter.swift
//  Pods
//
//  Created by Ed on 2018/7/27.
//

import Foundation

public typealias  KMCallBack = (_ result:Any?,  _ error:Error?) ->Void

/// 路由错误信息
///
/// - badURL: URL错误
/// - noNavigation: 没有找到导航栏
public enum KMRouterError:Error, LocalizedError {
    
    case badURL
    case noNavigation
    
    /// 描述发生错误的本地化消息。
    public var errorDescription: String? {
        switch self {
        case .badURL: return "URL 路径错误"
        case .noNavigation: return "没有传入导航控制器"
        }
    }
}


/// 基础协议
@objc public protocol KMRouterProtocol {
    
    @objc optional var callBack:KMCallBack? { get set }
    
    /// 返回数据给调用者
    ///
    /// - Parameter completion: 统一回调
    @objc optional func handle(completion:@escaping KMCallBack)
}



open class KMRouter :NSObject{
    
    
    /// 创建控制器
    ///
    /// - Parameter url: 路由路径
    /// - Returns: 返回控制器
    func viewControllerFromUrl(_ url:URL?) -> UIViewController? {

        if let className = url?.pathComponents.first,
            let obj = NSClassFromString(className),
                let model = obj as? UIViewController.Type {
                    return model.init()
        }
        return nil;
    }
    
    
    /// 导航显示
    ///
    /// - Parameters:
    ///   - url: 路由路径
    ///   - control: 承载控制器
    ///   - completion: 统一回调
    @objc(push:control:completion:)
    public func push(_ url:URL?, _ control: UIViewController,_ completion:KMCallBack? = nil) {
        if let vc = viewControllerFromUrl(url) {
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
    
    /// 模态显示
    ///
    /// - Parameters:
    ///   - url: 路由路径
    ///   - control: 承载控制器
    ///   - completion: 统一回调
    @objc(persent:control:completion:)
    public func persent(_ url:URL?, _ control: UIViewController,_ completion:KMCallBack? = nil) {
        if let vc = viewControllerFromUrl(url) {
            control.present(vc, animated: true, completion: nil)
            if let vc = vc as? KMRouterProtocol, let callback = completion {
                vc.handle?(completion: callback)
            }
        }else{
            completion?(nil,KMRouterError.badURL)
        }
    }

}

