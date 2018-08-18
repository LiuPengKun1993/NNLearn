//
//  NNView.h
//  NN_UIViewAnimationPractice
//
//  Created by 刘朋坤 on 2018/8/11.
//  Copyright © 2018年 刘朋坤. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^NNActionBlock)(id param);

@interface NNView : UIView

/** 演示图片 */
@property (nonatomic, strong) UIImageView *headerImage;

/** 按钮点击事件 */
@property (nonatomic, copy) NNActionBlock actionBlock;

- (instancetype)initWithFrame:(CGRect)frame buttonTitleArray:(NSArray *)buttonTitleArray;

@end
