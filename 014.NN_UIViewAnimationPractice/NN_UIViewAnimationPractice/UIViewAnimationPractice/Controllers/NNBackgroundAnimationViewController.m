//
//  NNBackgroundAnimationViewController.m
//  NN_UIViewAnimationPractice
//
//  Created by 刘朋坤 on 2018/8/11.
//  Copyright © 2018年 刘朋坤. All rights reserved.
//

#import "NNBackgroundAnimationViewController.h"

@interface NNBackgroundAnimationViewController ()

@end

@implementation NNBackgroundAnimationViewController

- (NSArray *)buttonTitleArray {
    return @[@"Alpha"];
}

#pragma mark - 处理事件区域
- (void)buttonClick:(UIButton *)sender {
    [self changeBackground];
}

/**
 *  relativeStartTime 动画在什么时候开始
 *  relativeDuration 动画所持续的时间
 */
- (void)changeBackground {
    [UIView animateKeyframesWithDuration:10.0 delay:0.f options:UIViewKeyframeAnimationOptionCalculationModeLinear animations:^{
        [UIView addKeyframeWithRelativeStartTime:0.f relativeDuration:1 / 5.0 animations:^{
            self.nnView.backgroundColor = [UIColor blueColor];
        }];
        [UIView addKeyframeWithRelativeStartTime:1 / 5.0 relativeDuration:1 / 5.0 animations:^{
            self.nnView.backgroundColor = [UIColor yellowColor];
        }];
        [UIView addKeyframeWithRelativeStartTime:2 / 5.0 relativeDuration:1 / 5.0 animations:^{
            self.nnView.backgroundColor = [UIColor redColor];
        }];
        [UIView addKeyframeWithRelativeStartTime:3 / 5.0 relativeDuration:1 / 5.0 animations:^{
            self.nnView.backgroundColor = [UIColor orangeColor];
        }];
        [UIView addKeyframeWithRelativeStartTime:4 / 5.0 relativeDuration:1 / 5.0 animations:^{
            self.nnView.backgroundColor = [UIColor whiteColor];
        }];
    } completion:^(BOOL finished) {
        self.nnView.backgroundColor = [UIColor cyanColor];
        NSLog(@"动画结束");
    }];
}

@end
