//
//  ViewController.swift
//  KMRouter-Example
//
//  Created by Ed on 2019/5/6.
//  Copyright © 2019 KM. All rights reserved.
//

import KMConfigure
import KMRouter
import UIKit
class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        

//        KMRouter.push("\(url)?titleName=张三", self) { result, error in
//            if let result = result {
//                print("失败:\(String(describing: result))")
//            }
//
//            if let error = error {
//                print("失败:\(String(describing: error))")
//            }
//        }
        
//        KMRouter.createViewController("KMModuleA" + "?titleName=张三") { [weak self] result in
//            switch result {
//            case .success(let vc):
//                self?.navigationController?.pushViewController(vc, animated: true)
//            case .failure(let error):
//                print("失败：\(error.localizedDescription)")
//            }
//        }
        
//        KMRouter.action("KMModuleA",["titleName":"张三ssss"]) { [weak self] result in
//            switch result {
//            case .success(let vc):
//                self?.navigationController?.pushViewController(vc, animated: true)
//            case .failure(let error):
//                print("失败：\(error.localizedDescription)")
//            }
//        }
//        KMRouters.path(urlStr: "/KMModuleA?titleName=张三", control: self, { control in
//            control.modalPresentationStyle = .fullScreen
//        })
        KMRouter.path(urlStr: "/KMModuleA.KMModuleA?titleName=张三") { control in
            control.handler = { funcMsg,result in
                
            }
        }
    }
}
