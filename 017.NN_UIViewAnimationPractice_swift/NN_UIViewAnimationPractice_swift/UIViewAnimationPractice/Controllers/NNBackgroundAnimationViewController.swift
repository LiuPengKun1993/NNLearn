//
//  NNBackgroundAnimationViewController.swift
//  NN_UIViewAnimationPractice
//
//  Created by 刘朋坤 on 2019/1/5.
//  Copyright © 2019 刘朋坤. All rights reserved.
//

import UIKit

class NNBackgroundAnimationViewController: NNBaseViewController {

    override func buttonClick(index: NSInteger) {
        
        // 按钮点击事件
        UIView.animateKeyframes(withDuration: 10.0, delay: 0, options: UIView.KeyframeAnimationOptions.calculationModeLinear, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1.0 / 5.0, animations: {
                self.nnView.backgroundColor = UIColor.blue
            })
            UIView.addKeyframe(withRelativeStartTime: 1.0/5.0, relativeDuration: 1.0/5.0, animations: {
                self.nnView.backgroundColor = UIColor.yellow
            })
            UIView.addKeyframe(withRelativeStartTime: 2.0/5.0, relativeDuration: 1.0/5.0, animations: {
                self.nnView.backgroundColor = UIColor.red
            })
            UIView.addKeyframe(withRelativeStartTime: 3.0/5.0, relativeDuration: 1.0/5.0, animations: {
                self.nnView.backgroundColor = UIColor.orange
            })
            UIView.addKeyframe(withRelativeStartTime: 4.0/5.0, relativeDuration: 1.0/5.0, animations: {
                self.nnView.backgroundColor = UIColor.white
            })
            
        }) { (finished) in
            self.nnView.backgroundColor = UIColor.cyan
        }
    }

    // 数组元素
    override func buttonTitleArrayMethod() -> NSArray {
        return ["BackgroundColor"]
    }
    
}
