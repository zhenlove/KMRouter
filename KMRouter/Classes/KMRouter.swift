//
//  KMRouter.swift
//  Pods
//
//  Created by Ed on 2020/6/9.
//

import Foundation
import KMTools
public typealias ConfigCallBack = (_ control: UIViewController) -> Void
public typealias Handler = (_ funcMsg:String?,_ result:Any?) -> Void
extension URLComponents {
     fileprivate var queryParameters: [String: Any]? {
        
        if let queryDic = self.queryItems {
            var items: [String: Any] = [:]
            for queryItem in queryDic {
                items[queryItem.name] = queryItem.value
            }
            return items
        }else{
            return nil
        }
    }
}

fileprivate var handlerKey:Void?

extension UIViewController {
   public var handler:Handler?{
        get{
            return objc_getAssociatedObject(self, &handlerKey) as? Handler
        }
        set{
            objc_setAssociatedObject(self, &handlerKey, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }
}

public class KMRouter: NSObject {
    
    private override init() {
        
    }

    /// 获取属性名
    /// - Parameter cls: Class
    /// - Returns: 属性名
    private class func getProperties(cls: AnyClass) -> [String]? {
        var count = UInt32()
        guard let properties = class_copyPropertyList(cls, &count) else { return nil }
        var types: [String] = []
        for i in 0..<Int(count) {
            let property: objc_property_t = properties[i]
            /// 获取属性名
            let name = String(cString: property_getName(property))
            types.append(name)
        }
        free(properties)
        return types
    }
    
    /// 设置属性
    /// - Parameters:
    ///   - obj: 设置对象
    ///   - attributeName: 属性名列表
    ///   - parmt: 属性值列表
    private class func setProperties( _ obj:NSObject, _ parmt:[String : Any]?) -> Void {

        if let parmts = parmt,
           let arrs = getProperties(cls: type(of: obj)) {
            for (key,value) in parmts {
                if arrs.contains(key) {
                    obj.setValue(value, forKey: key)
                } else {
                    print("\(NSStringFromClass(type(of: obj)))类=>不存在属性:\(key)")
                }
            }
        }
    }
    
    private static func createViewController(_ className:String) -> UIViewController? {
        guard let theClass = NSClassFromString(className) else {
            print("\(className)不存在")
            return nil
        }
        guard let cls = theClass as? UIViewController.Type else {
            print("对象类型不匹配")
            return nil
        }
        return cls.init()
    }
    
    /// 导航加载控制器
    /// - Parameters:
    ///   - className: 类名
    ///   - param: 参数
    @objc public static func push(className:String, param:[String : Any]?, callback:ConfigCallBack? = nil) {
        guard let vc = createViewController(className) else {
            return
        }
        callback?(vc)
        setProperties(vc, param)
        KMTools.currentNavigationController()?.pushViewController(vc, animated: true)
    }
    
    /// 模态加载控制器
    /// - Parameters:
    ///   - className: 类名
    ///   - param: 参数
    ///   - callback: 配置回调
    @objc public static func persent(className:String, param:[String : Any]?, callback:ConfigCallBack? = nil) {
        guard let vc = createViewController(className) else {
            return
        }
        callback?(vc)
        setProperties(vc, param)
        KMTools.currentViewController()?.present(vc, animated: true, completion: nil)
    }
    
    /// 根据URL路径加载控制器
    /// - Parameters:
    ///   - urlStr: URL路径
    ///   - isPush: 是否采用导航控制器加载
    ///   - callback: 配置回调
    @objc public static func path(urlStr:String,isPush:Bool = true,callback:ConfigCallBack? = nil) {
        if let urlStr = urlStr.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
            let components = URLComponents(string: urlStr) {
            
            guard let className = components.url?.lastPathComponent else {
                return
            }
            if isPush {
                KMRouter.push(className: className, param: components.queryParameters, callback: callback)
            }else{
                KMRouter.persent(className: className, param: components.queryParameters, callback: callback)
            }
        }
    }
    
}
