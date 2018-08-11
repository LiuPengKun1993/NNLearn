//
//  NNSpringAnimationController.m
//  NN_UIViewAnimationPractice
//
//  Created by 刘朋坤 on 2018/8/11.
//  Copyright © 2018年 刘朋坤. All rights reserved.
//

#import "NNSpringAnimationController.h"

@interface NNSpringAnimationController ()

@end

@implementation NNSpringAnimationController

- (NSArray *)buttonTitleArray {
    return @[@"spring", @"组合"];
}

- (void)buttonClick:(UIButton *)sender {
    switch (sender.tag) {
        case 0:
            [self springAnimation1];
            break;
        case 1:
            [self springAnimation2];
            break;
    }
}

- (void)springAnimation1 {
    CGRect originalRect = self.nnView.headerImage.frame;
    CGRect changeRect = CGRectMake(self.nnView.headerImage.center.x-50, self.nnView.headerImage.center.y - 200, 100, 100);
    [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.3 initialSpringVelocity:4 options:UIViewAnimationOptionCurveLinear animations:^{
        self.nnView.headerImage.frame = changeRect;
    } completion:^(BOOL finished) {
        self.nnView.headerImage.frame = originalRect;
    }];
}

- (void)springAnimation2 {
    CGRect originalRect = self.nnView.headerImage.frame;
    CGRect changeRect = CGRectMake(self.nnView.headerImage.center.x-50, self.nnView.headerImage.center.y - 200, 100, 100);
    [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.3 initialSpringVelocity:4 options:UIViewAnimationOptionCurveLinear animations:^{
        self.nnView.headerImage.frame = changeRect;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1 delay:0.3 usingSpringWithDamping:0.3 initialSpringVelocity:4 options:UIViewAnimationOptionCurveLinear animations:^{
            self.nnView.headerImage.frame = originalRect;
        } completion:nil];
    }];
}

@end
