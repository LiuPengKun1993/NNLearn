//
//  NNBaseViewController.h
//  NN_UIViewAnimationPractice
//
//  Created by 刘朋坤 on 2018/8/11.
//  Copyright © 2018年 刘朋坤. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NNView.h"
#define NNScreenWidth [UIScreen mainScreen].bounds.size.width
#define NNScreenHeight [UIScreen mainScreen].bounds.size.height

@interface NNBaseViewController : UIViewController

@property (nonatomic, strong) NNView *nnView;

- (void)buttonClick:(UIButton *)sender;

- (NSArray *)buttonTitleArray;

@end
