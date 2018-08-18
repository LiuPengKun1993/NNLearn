//
//  NNBaseViewController.m
//  NN_UIViewAnimationPractice
//
//  Created by 刘朋坤 on 2018/8/11.
//  Copyright © 2018年 刘朋坤. All rights reserved.
//

#import "NNBaseViewController.h"

@interface NNBaseViewController ()

/** 按钮的数组元素 **/
@property (nonatomic, copy) NSArray *buttonTitleArray;

@end

@implementation NNBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self.view addSubview:self.nnView];
}

- (void)initData {
    _buttonTitleArray = [self buttonTitleArray];
}

#pragma mark - 处理事件区域
- (void)buttonClick:(UIButton *)sender {
    
}

#pragma mark - 懒加载区域
- (NNView *)nnView {
    if (!_nnView) {
        _nnView = [[NNView alloc] initWithFrame:self.view.frame buttonTitleArray:_buttonTitleArray];
        __weak typeof(self) weakSelf = self;
        _nnView.actionBlock = ^(id param) {
            UIButton *sender = param;
            [weakSelf buttonClick:sender];
        };
    }
    return _nnView;
}

@end
