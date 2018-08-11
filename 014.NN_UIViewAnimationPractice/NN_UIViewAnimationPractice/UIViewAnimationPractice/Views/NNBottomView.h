//
//  NNBottomView.h
//  NN_UIViewAnimationPractice
//
//  Created by 刘朋坤 on 2018/8/11.
//  Copyright © 2018年 刘朋坤. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^NNActionBlock)(id param);

@interface NNBottomView : UIView

- (instancetype)initWithFrame:(CGRect)frame buttonTitleArray:(NSArray *)buttonTitleArray;

/** 按钮点击事件 */
@property (nonatomic, copy) NNActionBlock actionBlock;

@end
