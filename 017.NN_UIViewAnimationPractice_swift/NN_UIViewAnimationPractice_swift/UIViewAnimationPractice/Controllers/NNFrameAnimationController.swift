//
//  NNFrameAnimationController.swift
//  NN_UIViewAnimationPractice
//
//  Created by 刘朋坤 on 2019/1/5.
//  Copyright © 2019 刘朋坤. All rights reserved.
//

import UIKit

class NNFrameAnimationController: NNBaseViewController {
    
    // 按钮点击事件
    override func buttonClick(index: NSInteger) {
        switch index {
        case 0:
            changeFrame()
            break
        case 1:
            changeBounds()
            break
        case 2:
            changeCenter()
            break
        default:
            break
        }
    }
    
    // 改变Frame
    func changeFrame() {
        let originalFrame = self.nnView.headerImage.frame
        let changeFrame = CGRect(x: self.nnView.headerImage.frame.origin.x, y: self.nnView.headerImage.frame.origin.y - 120, width: 200, height: 80)
        changeOriginalRect(originalFrame: originalFrame, changeFrame: changeFrame)
    }
    
    // 改变Bounds
    func changeBounds() {
        let originalBounds = self.nnView.headerImage.bounds
        let changeBounds = CGRect(x: 0, y: 0, width: self.view.frame.size.width - 100, height: 100)
        changeOriginalRect(originalFrame: originalBounds, changeFrame: changeBounds)
    }
    
    // 改变Center
    func changeCenter() {
        let originalPoint = self.nnView.headerImage.center
        let changePoint = CGPoint(x: self.nnView.headerImage.center.x, y: self.nnView.headerImage.center.y - 160)
        UIView.animate(withDuration: 0.5, animations: {
            self.nnView.headerImage.center = changePoint
        }) { (finished) in
            UIView.animate(withDuration: 1, animations: {
                self.nnView.headerImage.center = originalPoint
            })
        }
    }
    
    // 封装的通用方法
    func changeOriginalRect(originalFrame:CGRect, changeFrame:CGRect) {
        UIView.animate(withDuration: 0.5, animations: {
            self.nnView.headerImage.bounds = changeFrame
        }) { (finished) in
            UIView.animate(withDuration: 1, animations: {
                self.nnView.headerImage.bounds = originalFrame
            })
        }
    }
    
    // 数组元素
    override func buttonTitleArrayMethod() -> NSArray {
        return ["Frame", "Bounds", "Center"]
    }
    
}
