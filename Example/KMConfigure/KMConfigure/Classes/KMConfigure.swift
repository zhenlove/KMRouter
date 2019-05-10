//
//  KMConfigure.swift
//  KMModuleA
//
//  Created by Ed on 2019/5/10.
//

import UIKit

@objc(KMConfigure)
open class KMConfigure: NSObject {
    
}

// MARK: - 配置KMModuleA
extension KMConfigure {
    
    /// KMModuleA
    ///
    /// - Returns: 实例
    @objc public class func getModuleAUrlStr() -> String {
        return "KMModuleA"
    }
}

extension KMConfigure {
    /// KMModuleB
    ///
    /// - Returns: 实例
    @objc public class func getModuleBUrlStr() -> String {
        return "KMModuleB"
    }
}

extension KMConfigure {
    /// KMModuleC
    ///
    /// - Returns: 实例
    @objc public class func getModuleCUrlStr() -> String {
        return "KMModuleC"
    }
}

extension KMConfigure {
    /// KMModuleD
    ///
    /// - Returns: 实例
    @objc public class func getModuleDUrlStr() -> String {
        return "KMModuleD"
    }
}
