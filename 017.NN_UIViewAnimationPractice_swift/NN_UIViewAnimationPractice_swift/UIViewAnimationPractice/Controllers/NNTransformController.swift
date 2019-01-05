//
//  NNTransformController.swift
//  NN_UIViewAnimationPractice
//
//  Created by 刘朋坤 on 2019/1/5.
//  Copyright © 2019 刘朋坤. All rights reserved.
//

import UIKit

class NNTransformController: NNBaseViewController {

    // 按钮点击事件
    override func buttonClick(index: NSInteger) {
        changeTransform(index: index)
    }
    
    // 封装的通用方法
    func changeTransform(index: NSInteger) {
        UIView.animate(withDuration: 1, animations: {
            switch index {
            case 0:
                self.nnView.headerImage.transform = CGAffineTransform.init(rotationAngle: CGFloat(.pi*1.2))
                break
            case 1:
                self.nnView.headerImage.transform = CGAffineTransform.init(translationX: 50, y: -100)
                break
            case 2:
                self.nnView.headerImage.transform = CGAffineTransform.init(scaleX: 0.3, y: 0.3)
                break
            case 3:
                self.nnView.headerImage.transform = CGAffineTransform.init(a: 0.2, b: 0.3, c: 0.4, d: 0.5, tx: 0.4, ty: 0.3)
                break
            case 4:
                var trans = CATransform3DIdentity
                trans = CATransform3DMakeRotation(.pi, 17, 15, 18)
                self.nnView.headerImage.transform = CATransform3DGetAffineTransform(trans)
                break
            default:
                break
            }
        }) { (finished) in
            UIView.animate(withDuration: 1, animations: {
                self.nnView.headerImage.transform = CGAffineTransform.identity
            })
        }
    }
    
    // 数组元素
    override func buttonTitleArrayMethod() -> NSArray {
        return ["Rotation", "Translation", "Scale", "2D", "3D"]
    }
    
}
