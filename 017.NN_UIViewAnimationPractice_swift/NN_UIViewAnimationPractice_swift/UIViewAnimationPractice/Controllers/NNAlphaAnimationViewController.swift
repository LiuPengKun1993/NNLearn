//
//  NNAlphaAnimationViewController.swift
//  NN_UIViewAnimationPractice
//
//  Created by 刘朋坤 on 2019/1/5.
//  Copyright © 2019 刘朋坤. All rights reserved.
//

import UIKit

class NNAlphaAnimationViewController: NNBaseViewController {

    // 按钮点击事件
    override func buttonClick(index: NSInteger) {
        UIView.animate(withDuration: 1.5, animations: {
            self.nnView.headerImage.alpha = 0.2
        }) { (finished) in
            self.nnView.headerImage.alpha = 1
        }
    }

    // 数组元素
    override func buttonTitleArrayMethod() -> NSArray {
        return ["Alpha"]
    }
    
}
