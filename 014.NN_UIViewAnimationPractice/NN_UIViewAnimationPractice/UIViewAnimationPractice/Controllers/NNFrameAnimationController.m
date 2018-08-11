//
//  NNFrameAnimationController.m
//  NN_UIViewAnimationPractice
//
//  Created by 刘朋坤 on 2018/8/11.
//  Copyright © 2018年 刘朋坤. All rights reserved.
//

#import "NNFrameAnimationController.h"

@interface NNFrameAnimationController ()

@end

@implementation NNFrameAnimationController

- (NSArray *)buttonTitleArray {
    return @[@"Frame", @"Bounds", @"Center"];
}

- (void)buttonClick:(UIButton *)sender {
    switch (sender.tag) {
        case 0:
            [self changeFrame];
            break;
        case 1:
            [self changeBounds];
            break;
        case 2:
            [self changeCenter];
            break;
    }
}

- (void)changeFrame {
    CGRect originalFrame = self.nnView.headerImage.frame;
    CGRect changeFrame = CGRectMake(self.nnView.headerImage.frame.origin.x, self.nnView.headerImage.frame.origin.y - 120, 200, 80);
    [self changeOriginalRect:originalFrame changeRect:changeFrame];
}

- (void)changeBounds {
    CGRect originalBounds = self.nnView.headerImage.bounds;
    CGRect changeBounds = CGRectMake(0, 0, self.view.frame.size.width - 100, 100);
    [self changeOriginalRect:originalBounds changeRect:changeBounds];
}

- (void)changeCenter {
    CGPoint originalPoint = self.nnView.headerImage.center;
    CGPoint changePoint = CGPointMake(self.nnView.headerImage.center.x, self.nnView.headerImage.center.y - 160);
    [UIView animateWithDuration:0.5 animations:^{
        self.nnView.headerImage.center = changePoint;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1 animations:^{
            self.nnView.headerImage.center = originalPoint;
        }];
    }];
}

- (void)changeOriginalRect:(CGRect)originalRect changeRect:(CGRect)changeRect {
    [UIView animateWithDuration:0.5 animations:^{
        self.nnView.headerImage.bounds =  changeRect;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1 animations:^{
            self.nnView.headerImage.bounds = originalRect;
        }];
    }];
}

@end
