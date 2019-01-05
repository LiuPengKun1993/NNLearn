//
//  NNView.swift
//  NN_UIViewAnimationPractice
//
//  Created by 刘朋坤 on 2019/1/5.
//  Copyright © 2019 刘朋坤. All rights reserved.
//

import UIKit

protocol NNViewProtocol: NSObjectProtocol {
    func clickAction(index: NSInteger)
}

class NNView: UIView {
    
    var buttonTitleArray : NSArray = []
    weak var delegate:NNViewProtocol?

    init(frame: CGRect, buttonTitleArray: NSArray) {
        super.init(frame: frame)
        self.buttonTitleArray = buttonTitleArray
        addSubview(headerImage)
        addSubview(bottomView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 懒加载区域
    lazy var headerImage : UIImageView = {
        let tempHeaderImage = UIImageView.init(image: UIImage.init(named: "header"))
        tempHeaderImage.frame = CGRect(x: 100, y: 100, width: 200, height: 200)
        tempHeaderImage.center = self.center
        return tempHeaderImage
    }()
    
    lazy var bottomView : NNBottomView = {
        let tempBottomView = NNBottomView.init(frame: CGRect.init(x: 0, y: self.frame.size.height - 200, width: self.frame.size.width, height: 200), buttonTitleArray: buttonTitleArray as NSArray)
        tempBottomView.delegate = self
        return tempBottomView
    }()
    
}

/** 代理区域 - NNBottomViewProtocol */
extension NNView : NNBottomViewProtocol {
    func clickAction(index: NSInteger) {
        if (delegate != nil) {
            delegate?.clickAction(index: index)
        }
    }
}

