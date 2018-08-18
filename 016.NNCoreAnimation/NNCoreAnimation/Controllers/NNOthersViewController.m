//
//  NNOthersViewController.m
//  NNCoreAnimation
//
//  Created by 刘朋坤 on 2018/8/18.
//  Copyright © 2018年 刘朋坤. All rights reserved.
//

#import "NNOthersViewController.h"

@interface NNOthersViewController ()

@end

@implementation NNOthersViewController

- (NSArray *)buttonTitleArray {
    return @[@"透明度", @"抖动", @"背景色", @"边框"];
}

- (void)buttonClick:(UIButton *)sender {
    switch (sender.tag) {
        case 0:
            // 透明度
            [self opacityAniamtion];
            break;
        case 1:
            // 抖动
            [self shakeAnimation];
            break;
        case 2:
            // 背景色
            [self backgroundAnimation];
            break;
        case 3:
            // 边框
            [self borderWidth];
            break;
    }
}

/** 透明度 */
- (void)opacityAniamtion {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    animation.fromValue = [NSNumber numberWithFloat:1.0f];
    animation.toValue = [NSNumber numberWithFloat:0.2f];
//    animation.fillMode = kCAFillModeForwards;
//    animation.removedOnCompletion = NO;
    animation.duration = 1.0f;
    [self.nnView.headerImage.layer addAnimation:animation forKey:@"opacityAniamtion"];
}

/** 抖动 */
- (void)shakeAnimation {
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];
    NSValue *value1 = [NSNumber numberWithFloat:- M_PI / 100];
    NSValue *value2 = [NSNumber numberWithFloat:M_PI / 100];
    NSValue *value3 = [NSNumber numberWithFloat:- M_PI / 100];
    animation.values = @[value1, value2, value3];
    animation.repeatCount = 3;
    [self.nnView.headerImage.layer addAnimation:animation forKey:@"shakeAnimation"];
}

/** 背景色 */
- (void)backgroundAnimation {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    animation.toValue = (__bridge id _Nullable)([UIColor redColor].CGColor);
    animation.duration = 2.0f;
//    animation.fillMode = kCAFillModeForwards;
//    animation.removedOnCompletion = NO;
    [self.nnView.layer addAnimation:animation forKey:@"backgroundAnimation"];
}

/** 边框 */
- (void)borderWidth {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"borderWidth"];
    animation.toValue = [NSNumber numberWithFloat:20.0f];
    animation.duration = 1.0f;
//    animation.fillMode = kCAFillModeForwards;
//    animation.removedOnCompletion = NO;
    [self.nnView.headerImage.layer addAnimation:animation forKey:@"borderWidth"];
}

@end
