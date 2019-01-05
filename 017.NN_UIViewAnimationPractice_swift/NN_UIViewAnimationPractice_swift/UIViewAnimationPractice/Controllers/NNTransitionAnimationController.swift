//
//  NNTransitionAnimationController.swift
//  NN_UIViewAnimationPractice
//
//  Created by 刘朋坤 on 2019/1/5.
//  Copyright © 2019 刘朋坤. All rights reserved.
//

import UIKit

class NNTransitionAnimationController: NNBaseViewController {

    // 按钮点击事件
    override func buttonClick(index: NSInteger) {
        switch index {
        case 0:
            transitionAnimation(option: UIView.AnimationOptions.transitionFlipFromLeft)
            break
        case 1:
            transitionAnimation(option: UIView.AnimationOptions.transitionFlipFromRight)
            break
        case 2:
            transitionAnimation(option: UIView.AnimationOptions.transitionFlipFromTop)
            break
        case 3:
            transitionAnimation(option: UIView.AnimationOptions.transitionFlipFromBottom)
            break
        case 4:
            transitionAnimation(option: UIView.AnimationOptions.transitionCurlUp)
            break
        case 5:
            transitionAnimation(option: UIView.AnimationOptions.transitionCurlDown)
            break
        case 6:
            transitionAnimationWithFrontOption(frontOption: UIView.AnimationOptions.transitionCurlUp, backOption: UIView.AnimationOptions.transitionCurlDown)
            break
        case 7:
            transitionAnimationWithFrontOption(frontOption: UIView.AnimationOptions.transitionFlipFromTop, backOption: UIView.AnimationOptions.transitionFlipFromBottom)
            break
        case 8:
            transitionAnimation()
            break
        default:
            break
        }
    }
    
    // 封装的通用方法
    func transitionAnimation(option: UIView.AnimationOptions) {
        UIView.transition(with: self.nnView.headerImage, duration: 0.8, options: option, animations: {
            
        }, completion: nil)
    }
    
    // 组合1 组合2 封装的通用方法
    func transitionAnimationWithFrontOption(frontOption:UIView.AnimationOptions, backOption:UIView.AnimationOptions) {
        UIView.transition(with: self.nnView.headerImage, duration: 0.8, options: frontOption, animations: {
            self.nnView.headerImage.alpha = 0.3
        }) { (finished) in
            UIView.transition(with: self.nnView.headerImage, duration: 0.8, options: backOption, animations: {
                self.nnView.headerImage.alpha = 1
            }, completion: nil)
        }
    }
    
    // 组合3 封装的通用方法
    func transitionAnimation() {
        UIView.transition(with: self.nnView, duration: 1, options: UIView.AnimationOptions.transitionFlipFromLeft, animations: {
            self.nnView.backgroundColor = UIColor.blue
        }) { (finished) in
            UIView.transition(with: self.nnView, duration: 1, options: UIView.AnimationOptions.transitionFlipFromRight, animations: {
                self.nnView.backgroundColor = UIColor.cyan
            }, completion: nil)
        }
    }

    // 数组元素
    override func buttonTitleArrayMethod() -> NSArray {
        return ["Left", "Right", "Top", "Bottom", "CurlUp", "CurlDown", "组合1", "组合2", "组合2"]
    }
    
}
