//
//  ViewController.swift
//  NNSwiftOCProgram
//
//  Created by 刘朋坤 on 2019/1/7.
//  Copyright © 2019 刘朋坤. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(nnView)
        view.backgroundColor = UIColor.white
    }
    
    lazy var nnView:NNView = {
        let tempView = NNView.init(frame: CGRect.init(x: 100, y: 100, width: 100, height: 100))
        tempView.delegate = self
        return tempView
    }()
    
}

extension ViewController : NNViewProtocol {
    func clickAction() {
        self.navigationController?.pushViewController(NNViewController.init(), animated: true)
    }
}
