//
//  NNView.swift
//  NNSwiftOCProgram
//
//  Created by 刘朋坤 on 2019/1/7.
//  Copyright © 2019 刘朋坤. All rights reserved.
//

import UIKit

@objc protocol NNViewProtocol: NSObjectProtocol {
    @objc func clickAction()
}

class NNView: UIView {
    
    @objc weak var delegate:NNViewProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.red
        addSubview(button)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func buttonClick() {
        if (delegate != nil) {
            delegate?.clickAction()
        }
    }
    
    lazy var button:UIButton = {
        let tempButton = UIButton.init(frame: CGRect.init(x: 10, y: 35, width: 80, height: 30))
        tempButton.backgroundColor = UIColor.gray
        tempButton.setTitle("跳转", for: .normal)
        tempButton.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
        return tempButton
    }()
    
}
