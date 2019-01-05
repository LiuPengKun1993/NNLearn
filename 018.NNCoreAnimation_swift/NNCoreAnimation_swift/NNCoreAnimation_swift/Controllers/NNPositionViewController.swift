//
//  NNPositionViewController.swift
//  NNCoreAnimation_swift
//
//  Created by 刘朋坤 on 2019/1/5.
//  Copyright © 2019 刘朋坤. All rights reserved.
//

import UIKit

class NNPositionViewController: NNBaseViewController {

    // 按钮点击事件
    override func buttonClick(index: NSInteger) {
        switch index {
        case 0:
            positionAnimationWithToValue(toValue: CGPoint.init(x: self.nnView.headerImage.center.x, y: self.nnView.headerImage.center.y - 100))
            break
        case 1:
            positionAnimationWithToValue(toValue: CGPoint.init(x: self.nnView.headerImage.center.x, y: self.nnView.headerImage.center.y + 100))
            break
        case 2:
            positionAnimationWithToValue(toValue: CGPoint.init(x: self.nnView.headerImage.center.x-100, y: self.nnView.headerImage.center.y))
            break
        case 3:
            positionAnimationWithToValue(toValue: CGPoint.init(x: self.nnView.headerImage.center.x+100, y: self.nnView.headerImage.center.y))
            break
        case 4:
            keyFrameAnimation()
            break
        case 5:
            pathAnimation()
            break
        default:
            break
        }
    }
    
    func positionAnimationWithToValue(toValue: CGPoint) {
        let animation = CABasicAnimation.init(keyPath: "position")
        animation.fromValue = NSValue.init(cgPoint: self.nnView.headerImage.center)
        animation.toValue = NSValue.init(cgPoint: toValue)
        animation.duration = 1.5
        animation.timingFunction = CAMediaTimingFunction.init(name: .easeInEaseOut)
        self.nnView.headerImage.layer.add(animation, forKey: "positionAnimation")
    }
    
    func keyFrameAnimation() {
        let animation = CAKeyframeAnimation.init(keyPath: "position")
        let value1 = NSValue.init(cgPoint: CGPoint.init(x: 100, y: 100))
        let value2 = NSValue.init(cgPoint: CGPoint.init(x: 200, y: 300))
        let value3 = NSValue.init(cgPoint: CGPoint.init(x: 500, y: 100))
        let value4 = NSValue.init(cgPoint: CGPoint.init(x: 100, y: 500))
        let value5 = NSValue.init(cgPoint: CGPoint.init(x: 300, y: 100))
        animation.values = [value1, value2, value3, value4, value5]
        animation.duration = 3
        animation.timingFunction = CAMediaTimingFunction.init(name: .easeInEaseOut)
        self.nnView.headerImage.layer.add(animation, forKey: "keyFrameAnimation")
    }
    
    func pathAnimation() {
        let animation = CAKeyframeAnimation.init(keyPath: "position")
        let path = UIBezierPath.init(rect: CGRect.init(x: self.nnView.headerImage.center.x-75, y: self.nnView.headerImage.center.y-75, width: 150, height: 150))
        animation.path = path.cgPath
        animation.timingFunction = CAMediaTimingFunction.init(name: .easeInEaseOut)
        animation.repeatCount = 2
        animation.duration = 2
        self.nnView.headerImage.layer.add(animation, forKey: "pathAnimation")
    }
    
    // 数组元素
    override func buttonTitleArrayMethod() -> NSArray {
        return ["top", "bottom", "left", "right", "keyFrame", "path"]
    }

}
