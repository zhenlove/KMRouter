//
//  ViewController.swift
//  KMRouter-Example
//
//  Created by Ed on 2019/5/6.
//  Copyright © 2019 KM. All rights reserved.
//

import UIKit
import KMRouter
import KMConfigure
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let url = KMConfigure.getModuleAUrlStr()
       
        KMRouter.push(url, self) { (result, error) in
            if let result = result {
                print("失败:\(String(describing: result))")
            }
            
            if let error = error {
                print("失败:\(String(describing: error))")
            }
            
        }
    }

}

