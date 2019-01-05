//
//  NNSpringAnimationController.swift
//  NN_UIViewAnimationPractice
//
//  Created by 刘朋坤 on 2019/1/5.
//  Copyright © 2019 刘朋坤. All rights reserved.
//

import UIKit

class NNSpringAnimationController: NNBaseViewController {

    // 按钮点击事件
    override func buttonClick(index: NSInteger) {
        switch index {
        case 0:
            springAnimation1()
            break
        case 1:
            springAnimation2()
            break
        default:
            break
        }
    }
    
    func springAnimation1() {
        let originalRect = self.nnView.headerImage.frame
        let changeRect = CGRect(x: self.nnView.headerImage.center.x-50, y: self.nnView.headerImage.center.y - 200, width: 100, height: 100)
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 4, options: UIView.AnimationOptions.curveLinear, animations: {
            self.nnView.headerImage.frame = changeRect
        }) { (finished) in
            self.nnView.headerImage.frame = originalRect
        }
    }
    
    func springAnimation2() {
        let originalRect = self.nnView.headerImage.frame
        let changeRect = CGRect(x: self.nnView.headerImage.center.x-50, y: self.nnView.headerImage.center.y - 200, width: 100, height: 100)
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 4, options: UIView.AnimationOptions.curveLinear, animations: {
            self.nnView.headerImage.frame = changeRect
        }) { (finished) in
            UIView .animate(withDuration: 1, delay: 0.3, usingSpringWithDamping: 0.3, initialSpringVelocity: 4, options: UIView.AnimationOptions.curveLinear, animations: {
                self.nnView.headerImage.frame = originalRect
            }, completion: nil)
        }
    }

    // 数组元素
    override func buttonTitleArrayMethod() -> NSArray {
        return ["spring", "组合"]
    }

}
