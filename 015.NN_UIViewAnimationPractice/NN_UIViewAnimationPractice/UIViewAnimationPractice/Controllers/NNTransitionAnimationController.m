//
//  NNTransformAnimationController.m
//  NN_UIViewAnimationPractice
//
//  Created by 刘朋坤 on 2018/8/11.
//  Copyright © 2018年 刘朋坤. All rights reserved.
//

#import "NNTransitionAnimationController.h"

@interface NNTransitionAnimationController ()

@end

@implementation NNTransitionAnimationController

- (NSArray *)buttonTitleArray {
    return @[@"Left", @"Right", @"Top", @"Bottom", @"CurlUp", @"CurlDown", @"组合1", @"组合2", @"组合2"];
}

- (void)buttonClick:(UIButton *)sender {
    switch (sender.tag) {
        case 0:
            [self transitionAnimation:UIViewAnimationOptionTransitionFlipFromLeft];
            break;
        case 1:
            [self transitionAnimation:UIViewAnimationOptionTransitionFlipFromRight];
            break;
        case 2:
            [self transitionAnimation:UIViewAnimationOptionTransitionFlipFromTop];
            break;
        case 3:
            [self transitionAnimation:UIViewAnimationOptionTransitionFlipFromBottom];
            break;
        case 4:
            [self transitionAnimation:UIViewAnimationOptionTransitionCurlUp];
            break;
        case 5:
            [self transitionAnimation:UIViewAnimationOptionTransitionCurlDown];
            break;
        case 6:
            [self transitionAnimationWithFrontOption:UIViewAnimationOptionTransitionCurlUp backOption:UIViewAnimationOptionTransitionCurlDown];
            break;
        case 7:
            [self transitionAnimationWithFrontOption:UIViewAnimationOptionTransitionFlipFromTop backOption:UIViewAnimationOptionTransitionFlipFromBottom];
            break;
        case 8:
            [self transitionAnimation];
            break;
            
        default:
            break;
    }
}

- (void)transitionAnimation:(UIViewAnimationOptions)option {
    [UIView transitionWithView:self.nnView.headerImage duration:0.8 options:option animations:^{
    } completion:nil];
}

/** 组合1 组合2 */
- (void)transitionAnimationWithFrontOption:(UIViewAnimationOptions)frontOption backOption:(UIViewAnimationOptions)backOption  {
    [UIView transitionWithView:self.nnView.headerImage duration:0.8 options:frontOption animations:^{
        self.nnView.headerImage.alpha = 0.3;
    } completion:^(BOOL finished) {
        [UIView transitionWithView:self.nnView.headerImage duration:0.8 options:backOption animations:^{
            self.nnView.headerImage.alpha = 1;
        } completion:nil];
    }];
}

/** 组合3 */
- (void)transitionAnimation {
    [UIView transitionWithView:self.nnView duration:1 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
        self.nnView.backgroundColor = [UIColor blueColor];
    } completion:^(BOOL finished) {
        [UIView transitionWithView:self.nnView duration:1 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
            self.nnView.backgroundColor = [UIColor cyanColor];
        } completion:nil];
    }];
}

@end
