//
//  KMModuleA.swift
//  KMRouter-Example
//
//  Created by Ed on 2019/5/7.
//  Copyright © 2019 KM. All rights reserved.
//

import KMConfigure
import KMRouter
import UIKit
@objc(KMModuleA)
class KMModuleA: UIViewController, KMRouterProtocol {
    var callBack: KMCallBack?
    
    @objc var titleName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.red
        title = titleName
    }
    
    func handle(completion: @escaping KMCallBack) {
        callBack = completion
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        callBack?(nil,KMRouterError.badURL)
        
        callBack?(nil, KMRouterError.customError("我错了"))
        
        KMRouter.push("\(KMConfigure.getModuleBUrlStr())?titleSB=李四", self) { result, error in
            if let result = result {
                print("失败:\(String(describing: result))")
            }
            
            if let error = error {
                print("失败:\(String(describing: error))")
            }
        }
    }
}
