//
//  NNRotationViewController.swift
//  NNCoreAnimation_swift
//
//  Created by 刘朋坤 on 2019/1/5.
//  Copyright © 2019 刘朋坤. All rights reserved.
//

import UIKit

class NNRotationViewController: NNBaseViewController {

    // 按钮点击事件
    override func buttonClick(index: NSInteger) {
        switch index {
        case 0:
            rotationAnimationWithKeyPath(KeyPath: "transform.rotation.x")
            break
        case 1:
            rotationAnimationWithKeyPath(KeyPath: "transform.rotation.y")
            break
        case 2:
            rotationAnimationWithKeyPath(KeyPath: "transform.rotation.z")
            break
        case 3:
            groupAnimation()
            break
        default:
            break
        }
    }
    
    // 封装的统一方法
    func rotationAnimationWithKeyPath(KeyPath:String) {
        let anima = CABasicAnimation.init(keyPath: KeyPath)
        anima.toValue = M_PI
        anima.duration = 2
        self.nnView.headerImage.layer.add(anima, forKey: "rotateAnimation")
    }
    
    // 组合动画
    func groupAnimation() {
        let currentTime = CACurrentMediaTime()
        
        // 位移动画
        let animation1 = CAKeyframeAnimation.init(keyPath: "position")
        let value1 = NSValue.init(cgPoint: CGPoint.init(x: 100, y: 100))
        let value2 = NSValue.init(cgPoint: CGPoint.init(x: 200, y: 300))
        let value3 = NSValue.init(cgPoint: CGPoint.init(x: 500, y: 100))
        let value4 = NSValue.init(cgPoint: CGPoint.init(x: 100, y: 500))
        let value5 = NSValue.init(cgPoint: CGPoint.init(x: 300, y: 100))
        animation1.values = [value1, value2, value3, value4, value5]
        animation1.beginTime = currentTime
        animation1.duration = 2
        animation1.fillMode = .forwards
        animation1.isRemovedOnCompletion = false
        self.nnView.headerImage.layer.add(animation1, forKey: "position")
        
        // 缩放动画
        let animation2 = CABasicAnimation.init(keyPath: "transform.scale")
        animation2.fromValue = 0.8
        animation2.toValue = 1.5
        animation2.beginTime = currentTime + 2
        animation2.duration = 1
        animation2.fillMode = .forwards
        animation2.isRemovedOnCompletion = false
        self.nnView.headerImage.layer.add(animation2, forKey: "transform.scale")
        
        // 旋转动画
        let animation3 = CABasicAnimation.init(keyPath: "transform.rotation")
        animation3.toValue = .pi * 4.0
        animation3.beginTime = currentTime + 3
        animation3.duration = 1
        animation3.fillMode = .forwards
        animation3.isRemovedOnCompletion = false
        self.nnView.headerImage.layer.add(animation3, forKey: "transform.rotation")
    }
    
    // 数组元素
    override func buttonTitleArrayMethod() -> NSArray {
        return ["rotation.x", "rotation.y", "rotation.z", "组合"]
    }

}
