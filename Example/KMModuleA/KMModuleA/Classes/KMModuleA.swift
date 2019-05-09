//
//  KMModuleA.swift
//  KMRouter-Example
//
//  Created by Ed on 2019/5/7.
//  Copyright © 2019 KM. All rights reserved.
//

import UIKit
import KMRouter
@objc(KMModuleA)
class KMModuleA: UIViewController,KMRouterProtocol {
    
    var callBack: KMCallBack?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.red
    }
    
    func handle(completion: @escaping KMCallBack) {
        callBack = completion
    }
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        callBack?(nil,KMRouterError.badURL)

        KMRouter().push(URL(string: "KMModuleB"), self) { (result, error) in
            if let result = result {
                print("失败:\(String(describing: result))")
            }
            
            if let error = error {
                print("失败:\(String(describing: error))")
            }
        }
        
    }

}
