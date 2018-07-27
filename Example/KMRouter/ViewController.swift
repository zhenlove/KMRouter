//
//  ViewController.swift
//  KMRouter
//
//  Created by zhenlove on 07/27/2018.
//  Copyright (c) 2018 zhenlove. All rights reserved.
//

import UIKit
import KMRouter.Swift
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let obj : ModuleA = Router.init().interfaceForProtocol(ModuleA.self) as! ModuleA
        self.present(obj.serverBody(), animated: true, completion: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

