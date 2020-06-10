//
//  KMModuleA.swift
//  KMRouter-Example
//
//  Created by Ed on 2019/5/7.
//  Copyright © 2019 KM. All rights reserved.
//

import KMRouter
import UIKit

//@objc(KMModuleA)
class KMModuleA: UIViewController {
    
    @objc var titleName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.red
        title = titleName
        NotificationCenter.default.addObserver(self, selector: #selector(self.notificationAction(_:)), name: Notification.Name(rawValue: "ChangeBackgroundColor"), object: nil)
        
    }
    
    @objc func notificationAction(_ notification:Notification) {

    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        handler?(#function,"eeee")
        KMRouter.path(urlStr: "/KMModuleB.KMModuleB?titleSB=李四")
//        KMRouters.path(urlStr: "/KMModuleA.KMModuleA?titleName=张三")
    }
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

