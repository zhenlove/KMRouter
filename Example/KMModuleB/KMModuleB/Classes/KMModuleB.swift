//
//  KMModuleB.swift
//  KMRouter-Example
//
//  Created by Ed on 2019/5/7.
//  Copyright © 2019 KM. All rights reserved.
//

import KMRouter
import UIKit

@objc(KMModuleB)
class KMModuleB: UIViewController {

    @objc var titleSB: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.green
        title = titleSB
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        KMRouter.push(KMConfigure.getModuleCUrlStr(), self) { result, error in
//            if let result = result {
//                print("成功:\(String(describing: result))")
//            }
//
//            if let error = error {
//                print("失败:\(String(describing: error))")
//            }
//        }
//        KMRouters.path(urlStr: KMConfigure.getModuleCUrlStr(), control: self.navigationController!)
        KMRouter.path(urlStr: "KMModuleC")
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "ChangeBackgroundColor"), object: nil, userInfo: nil)
    }
}
