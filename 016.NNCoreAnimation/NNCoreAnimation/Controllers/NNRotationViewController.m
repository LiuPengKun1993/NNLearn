//
//  NNRotationViewController.m
//  NNCoreAnimation
//
//  Created by 刘朋坤 on 2018/8/13.
//  Copyright © 2018年 刘朋坤. All rights reserved.
//

#import "NNRotationViewController.h"

@interface NNRotationViewController ()

@end

@implementation NNRotationViewController

- (NSArray *)buttonTitleArray {
    return @[@"rotation.x", @"rotation.y", @"rotation.z", @"组合"];
}

- (void)buttonClick:(UIButton *)sender {
    switch (sender.tag) {
        case 0:
            [self rotationAnimationWithKeyPath:@"transform.rotation.x"];
            break;
        case 1:
            [self rotationAnimationWithKeyPath:@"transform.rotation.y"];
            break;
        case 2:
            [self rotationAnimationWithKeyPath:@"transform.rotation.z"];
            break;
        case 3:
            [self groupAnimation];
            break;
        default:
            break;
    }
}

- (void)rotationAnimationWithKeyPath:(NSString *)KeyPath {
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:KeyPath];
    anima.toValue = [NSNumber numberWithFloat:M_PI];
    anima.duration = 2.0f;
    [self.nnView.headerImage.layer addAnimation:anima forKey:@"rotateAnimation"];
}

- (void)groupAnimation {
    CFTimeInterval currentTime = CACurrentMediaTime();
    // 位移动画
    CAKeyframeAnimation *animation1 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    NSValue *value0 = [NSValue valueWithCGPoint:CGPointMake(100, 100)];
    NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(200, 300)];
    NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(500, 100)];
    NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(100, 500)];
    NSValue *value4 = [NSValue valueWithCGPoint:CGPointMake(300, 300)];
    animation1.values = [NSArray arrayWithObjects:value0, value1, value2, value3, value4, nil];
    animation1.beginTime = currentTime;
    animation1.duration = 2.0f;
    animation1.fillMode = kCAFillModeForwards;
    animation1.removedOnCompletion = NO;
    [self.nnView.headerImage.layer addAnimation:animation1 forKey:@"position"];
    
    // 缩放动画
    CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation2.fromValue = [NSNumber numberWithFloat:0.8f];
    animation2.toValue = [NSNumber numberWithFloat:1.5f];
    animation2.beginTime = currentTime + 2.0f;
    animation2.duration = 1.0f;
    animation2.fillMode = kCAFillModeForwards;
    animation2.removedOnCompletion = NO;
    [self.nnView.headerImage.layer addAnimation:animation2 forKey:@"transform.scale"];
    
    // 旋转动画
    CABasicAnimation *animation3 = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    animation3.toValue = [NSNumber numberWithFloat:M_PI * 4];
    animation3.beginTime = currentTime + 3.0f;
    animation3.duration = 1.0f;
    animation3.fillMode = kCAFillModeForwards;
    animation3.removedOnCompletion = NO;
    [self.nnView.headerImage.layer addAnimation:animation3 forKey:@"transform.rotation"];
}

@end
