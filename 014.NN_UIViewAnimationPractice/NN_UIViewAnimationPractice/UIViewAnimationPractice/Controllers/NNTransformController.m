//
//  NNTransformController.m
//  NN_UIViewAnimationPractice
//
//  Created by 刘朋坤 on 2018/8/11.
//  Copyright © 2018年 刘朋坤. All rights reserved.
//

#import "NNTransformController.h"

@interface NNTransformController ()

@end

@implementation NNTransformController

- (NSArray *)buttonTitleArray {
    return @[@"Rotation", @"Translation", @"Scale", @"组合1", @"组合2"];
}

- (void)buttonClick:(UIButton *)sender {
    [self changeTransform:sender.tag];
}

- (void)changeTransform:(NSInteger)integer {
    [UIView animateWithDuration:1 animations:^{
        switch (integer) {
            case 0:
                self.nnView.headerImage.transform = CGAffineTransformMakeRotation(M_PI*1.2);
                break;
            case 1:
                self.nnView.headerImage.transform = CGAffineTransformMakeTranslation(50, -100);
                break;
            case 2:
                self.nnView.headerImage.transform = CGAffineTransformMakeScale(0.3, 0.3);
                break;
            case 3: {
                CGAffineTransform transform = CGAffineTransformMakeRotation(M_PI*1.2);
                self.nnView.headerImage.transform = CGAffineTransformScale(transform, 1.8, 1);
            }
                break;
            case 4: {
                CGAffineTransform transform = CGAffineTransformMakeTranslation(0, -100);
                self.nnView.headerImage.transform = CGAffineTransformScale(transform, 1.8, 1);
            }
                break;
        }
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1 animations:^{
            self.nnView.headerImage.transform = CGAffineTransformIdentity;
        }];
    }];
}

@end
