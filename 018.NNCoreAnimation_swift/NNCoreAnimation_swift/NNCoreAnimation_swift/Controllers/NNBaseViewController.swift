//
//  NNBaseViewController.swift
//  NN_UIViewAnimationPractice
//
//  Created by 刘朋坤 on 2019/1/5.
//  Copyright © 2019 刘朋坤. All rights reserved.
//

import UIKit

class NNBaseViewController: UIViewController {
    
    var buttonTitleArray : NSArray = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.buttonTitleArray = self.buttonTitleArrayMethod()
        self.view.addSubview(nnView)
    }
    
    // 根据数组创建按钮，交给子类继承
    func buttonTitleArrayMethod() -> NSArray {
        return []
    }
    
    // 通过代理传出来的按钮点击事件，交给子类继承
    func buttonClick(index: NSInteger) {
        
    }
    
    lazy var nnView : NNView = {
        let tempView = NNView.init(frame: self.view.frame, buttonTitleArray: buttonTitleArray)
        tempView.delegate = self
        return tempView
    }()
    
}

extension NNBaseViewController : NNViewProtocol {
    func clickAction(index: NSInteger) {
        buttonClick(index: index)
    }
}
