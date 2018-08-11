//
//  NNAlphaAnimationViewController.m
//  NN_UIViewAnimationPractice
//
//  Created by 刘朋坤 on 2018/8/11.
//  Copyright © 2018年 刘朋坤. All rights reserved.
//

#import "NNAlphaAnimationViewController.h"

@interface NNAlphaAnimationViewController ()

@end

@implementation NNAlphaAnimationViewController

- (NSArray *)buttonTitleArray {
    return @[@"Alpha"];
}

#pragma mark - 处理事件区域
- (void)buttonClick:(UIButton *)sender {
    [self changeAlpha];
}

- (void)changeAlpha {
    [UIView animateWithDuration:1.5 animations:^{
        self.nnView.headerImage.alpha = 0.2;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.5 animations:^{
            self.nnView.headerImage.alpha = 1;
        }];
    }];
}

@end
