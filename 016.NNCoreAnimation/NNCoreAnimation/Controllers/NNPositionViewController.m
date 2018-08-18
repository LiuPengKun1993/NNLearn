//
//  NNPositionViewController.m
//  NNCoreAnimation
//
//  Created by 刘朋坤 on 2018/8/13.
//  Copyright © 2018年 刘朋坤. All rights reserved.
//

#import "NNPositionViewController.h"

@interface NNPositionViewController ()<CAAnimationDelegate>

@end

@implementation NNPositionViewController

- (NSArray *)buttonTitleArray {
    return @[@"top", @"bottom", @"left", @"right", @"keyFrame", @"path"];
}

- (void)buttonClick:(UIButton *)sender {
    switch (sender.tag) {
        case 0:
            [self positionAnimationWithToValue:CGPointMake(self.nnView.headerImage.center.x, self.nnView.headerImage.center.y - 100)];
            break;
        case 1:
            [self positionAnimationWithToValue:CGPointMake(self.nnView.headerImage.center.x, self.nnView.headerImage.center.y + 100)];
            break;
        case 2:
            [self positionAnimationWithToValue:CGPointMake(self.nnView.headerImage.center.x-100, self.nnView.headerImage.center.y)];
            break;
        case 3:
            [self positionAnimationWithToValue:CGPointMake(self.nnView.headerImage.center.x+100, self.nnView.headerImage.center.y)];
            break;
        case 4:
            [self keyFrameAnimation];
            break;
        case 5:
            [self pathAnimation];
            break;
            
        default:
            break;
    }
}

- (void)positionAnimationWithToValue:(CGPoint)toValue {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.fromValue = [NSValue valueWithCGPoint:self.nnView.headerImage.center];
    animation.toValue = [NSValue valueWithCGPoint:toValue];
    animation.duration = 1.5;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [self.nnView.headerImage.layer addAnimation:animation forKey:@"positionAnimation"];
}

- (void)keyFrameAnimation {
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(100, 100)];
    NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(200, 300)];
    NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(500, 100)];
    NSValue *value4 = [NSValue valueWithCGPoint:CGPointMake(100, 500)];
    NSValue *value5 = [NSValue valueWithCGPoint:CGPointMake(300, 100)];
    animation.values = [NSArray arrayWithObjects:value1, value2, value3, value4, value2, value5, nil];
    animation.duration = 3.0f;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.delegate = self;
    [self.nnView.headerImage.layer addAnimation:animation forKey:@"keyFrameAnimation"];
}

- (void)pathAnimation {
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(self.nnView.headerImage.center.x-75, self.nnView.headerImage.center.y-75, 150, 150)];
    animation.path = path.CGPath;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.repeatCount = 2;
    animation.duration = 2.0f;
    [self.nnView.headerImage.layer addAnimation:animation forKey:@"pathAnimation"];
}

@end
