//
//  NNScaleViewController.swift
//  NNCoreAnimation_swift
//
//  Created by 刘朋坤 on 2019/1/5.
//  Copyright © 2019 刘朋坤. All rights reserved.
//

import UIKit

class NNScaleViewController: NNBaseViewController {

    // 按钮点击事件
    override func buttonClick(index: NSInteger) {
        switch index {
        case 0:
            scaleAnimationWithKeyPath(keyPath: "transform.scale", key: "scaleAnimation")
            break
        case 1:
            scaleAnimationWithKeyPath(keyPath: "transform.scale.x", key: "scaleAnimationX")
            break
        case 2:
            scaleAnimationWithKeyPath(keyPath: "transform.scale.y", key: "scaleAnimationY")
            break
        default:
            break
        }
    }
    
    // 封装的统一方法
    func scaleAnimationWithKeyPath(keyPath:String, key:String) {
        let anima = CABasicAnimation.init(keyPath: keyPath)
        anima.toValue = 0.3
        anima.duration = 1
        self.nnView.headerImage.layer.add(anima, forKey: key)
    }
    
    // 数组元素
    override func buttonTitleArrayMethod() -> NSArray {
        return ["scale", "scale.x", "scale.y"]
    }

}
