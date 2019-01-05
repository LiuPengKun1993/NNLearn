//
//  NNBottomView.swift
//  NN_UIViewAnimationPractice
//
//  Created by 刘朋坤 on 2019/1/5.
//  Copyright © 2019 刘朋坤. All rights reserved.
//

import UIKit

protocol NNBottomViewProtocol: NSObjectProtocol {
    func clickAction(index: NSInteger)
}

class NNBottomView: UIView {
    var buttonTitleArray : NSArray = []
    weak var delegate:NNBottomViewProtocol?

    // 初始化
    init(frame: CGRect, buttonTitleArray: NSArray) {
        super.init(frame: frame)
        self.buttonTitleArray = buttonTitleArray
        initView()
    }
    
    // 添加子控件
    func initView() {
        for (index, _) in buttonTitleArray.enumerated() {
            let button = UIButton.init(type: .custom)
            addSubview(button)
            button.frame = rectForBtnAtIndex(index: index, totleNum: buttonTitleArray.count)
            let string = buttonTitleArray[index]
            button.setTitle(string as? String, for: .normal)
            button.tag = index
            button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
            button.backgroundColor = UIColor.red
            button.addTarget(self, action: #selector(titlesClick), for: .touchUpInside)
        }
    }
    
    // 按钮点击事件
    @objc func titlesClick(button: UIButton) {
        if (delegate != nil) {
            delegate?.clickAction(index: button.tag)
            UIView.animate(withDuration: 0.2, animations: {
                button.transform = CGAffineTransform.init(scaleX: 0.8, y: 0.8)
                button.alpha = 0.8
            }) { (finished) in
                UIView.animate(withDuration: 0.2, animations: {
                    button.transform = CGAffineTransform.identity
                    button.alpha = 1
                })
            }
        }
    }
    
    // 布局计算
    func rectForBtnAtIndex(index: NSInteger, totleNum: NSInteger) -> CGRect {
        let maxColumnNum = 4
        let columnMargin = CGFloat(20.0)
        let rowMargin = CGFloat(20.0)
        let tempTotleNum = totleNum >= 4 ? 4 : totleNum
        let width = (self.frame.size.width - columnMargin * CGFloat((tempTotleNum + 1))) / CGFloat(tempTotleNum)
        let height = CGFloat(30.0)
        let offsetX = CGFloat(columnMargin)+CGFloat((index % maxColumnNum)) * CGFloat((width + columnMargin))
        let offsetY = self.center.y - self.frame.origin.y - CGFloat(50.0) + CGFloat((index / maxColumnNum)) * CGFloat((height + rowMargin))
        return CGRect.init(x: offsetX, y: offsetY, width: width, height: height)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
