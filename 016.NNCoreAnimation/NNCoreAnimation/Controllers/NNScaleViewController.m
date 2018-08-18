//
//  NNScaleViewController.m
//  NNCoreAnimation
//
//  Created by 刘朋坤 on 2018/8/13.
//  Copyright © 2018年 刘朋坤. All rights reserved.
//

#import "NNScaleViewController.h"

@interface NNScaleViewController ()

@end

@implementation NNScaleViewController

- (NSArray *)buttonTitleArray {
    return @[@"scale", @"scale.x", @"scale.y"];
}

- (void)buttonClick:(UIButton *)sender {
    switch (sender.tag) {
        case 0:
            [self scaleAnimationWithKeyPath:@"transform.scale" key:@"scaleAnimation"];
            break;
        case 1:
            [self scaleAnimationWithKeyPath:@"transform.scale.x" key:@"scaleAnimationX"];
            break;
        case 2:
            [self scaleAnimationWithKeyPath:@"transform.scale.y" key:@"scaleAnimationY"];
            break;
        default:
            break;
    }
}

- (void)scaleAnimationWithKeyPath:(NSString *)keyPath key:(NSString *)key {
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:keyPath];
    anima.toValue = [NSNumber numberWithFloat:0.3];
    anima.duration = 1.0f;
    [self.nnView.headerImage.layer addAnimation:anima forKey:key];
}

@end
