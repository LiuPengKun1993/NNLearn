//
//  NNOthersViewController.swift
//  NNCoreAnimation_swift
//
//  Created by 刘朋坤 on 2019/1/5.
//  Copyright © 2019 刘朋坤. All rights reserved.
//

import UIKit

class NNOthersViewController: NNBaseViewController {

    // 按钮点击事件
    override func buttonClick(index: NSInteger) {
        switch index {
        case 0:
            // 透明度
            opacityAniamtion()
            break
        case 1:
            // 抖动
            shakeAnimation()
            break
        case 2:
            // 背景色
            backgroundAnimation()
            break
        case 3:
            // 边框
            borderWidth()
            break
        default:
            break
        }
    }
    
    // 透明度
    func opacityAniamtion() {
        let animation = CABasicAnimation.init(keyPath: "opacity")
        animation.fromValue = 1
        animation.toValue = 0.2;
        animation.duration = 1.0
        self.nnView.headerImage.layer.add(animation, forKey: "opacityAniamtion")
    }
    
    // 抖动
    func shakeAnimation() {
        let animation = CAKeyframeAnimation.init(keyPath: "transform.rotation")
        let value1 = -.pi / 100.0
        let value2 = .pi / 100.0
        let value3 = -.pi / 100.0
        animation.values = [value1, value2, value3]
        animation.repeatCount = 3
        self.nnView.headerImage.layer.add(animation, forKey: "shakeAnimation")
    }
    
    // 背景色
    func backgroundAnimation() {
        let animation = CABasicAnimation.init(keyPath: "backgroundColor")
        animation.toValue = UIColor.red.cgColor
        animation.duration = 2.0
        self.nnView.layer.add(animation, forKey: "backgroundAnimation")
    }
    
    // 边框
    func borderWidth() {
        let animation = CABasicAnimation.init(keyPath: "borderWidth")
        animation.toValue = 20;
        animation.duration = 1
        self.nnView.headerImage.layer.add(animation, forKey: "borderWidth")
    }
    
    // 数组元素
    override func buttonTitleArrayMethod() -> NSArray {
        return ["透明度", "抖动", "背景色", "边框"]
    }

}
