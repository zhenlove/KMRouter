//
//  KMModuleA.swift
//  KMRouter_Example
//
//  Created by Ed on 2018/7/27.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

@objc  protocol ModuleA : NSObjectProtocol {
    func serverBody() -> UIViewController
}


class KMModuleA: NSObject,ModuleA {
    func serverBody() -> UIViewController {
        print("动态路由创建视图")
        let moduleA = UIViewController()
        moduleA.title = "动态路由创建视图";
        moduleA.view.backgroundColor = UIColor.green
        return moduleA
    }
}
