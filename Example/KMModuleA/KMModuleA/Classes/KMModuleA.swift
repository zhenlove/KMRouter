//
//  KMModuleA.swift
//  KMRouter-Example
//
//  Created by Ed on 2019/5/7.
//  Copyright © 2019 KM. All rights reserved.
//

import KMRouter
import UIKit

@objc(KMModuleA)
class KMModuleA: UIViewController {
    
    @objc var titleName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.red
        title = titleName
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        KMRouters.path(urlStr: "KMModuleB.KMModuleB?titleSB=李四")
    }
}
