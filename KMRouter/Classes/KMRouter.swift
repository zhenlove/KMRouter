//
//  KMRouter.swift
//  Pods
//
//  Created by Ed on 2018/7/27.
//

import Foundation

open class Router: NSObject {
    
    open func interfaceForProtocol(_ proto: Protocol) -> AnyObject? {
        let nameArr = NSStringFromProtocol(proto).components(separatedBy: ".")
        let name = nameArr.first!  + "." + "KM" + nameArr.last!
        let model = NSClassFromString(name) as! NSObject.Type;
        return model.init()
    }
    
    public func interfaceForURL(_ url:NSURL) -> Void {
        
    }
}
