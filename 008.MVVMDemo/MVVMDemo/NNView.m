//
//  NNView.m
//  MVVMDemo
//
//  Created by liupengkun on 2018/7/16.
//  Copyright © 2018年 以梦为马. All rights reserved.
//

#import "NNView.h"
#import "NNViewModel.h"

@interface NNView()

@property (nonatomic, strong) UIButton *nnButton;
@property (nonatomic, strong) UILabel *nnLabel;
@property (nonatomic, strong) NNViewModel *viewModel;

@end

@implementation NNView

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (instancetype)initWithFrame:(CGRect)frame viewModel:(NNViewModel *)viewModel {
    if (self = [super initWithFrame:frame]) {
        self.viewModel = viewModel;
        [self addSubview:self.nnLabel];
        [self addSubview:self.nnButton];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshView) name:@"requestNNModel" object:nil];
    }
    return self;
}

#pragma mark - 私有方法区域
- (void)refreshView {
    self.nnLabel.text = self.viewModel.contentString;
}

- (void)nnButtonClick {
    [self.viewModel requestData];
}

#pragma mark - 懒加载区域
- (UILabel *)nnLabel {
    if (!_nnLabel) {
        _nnLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 300, self.frame.size.width-60, 30)];
        _nnLabel.textAlignment = NSTextAlignmentCenter;
        _nnLabel.backgroundColor = [UIColor redColor];
    }
    return _nnLabel;
}

- (UIButton *)nnButton {
    if (!_nnButton) {
        _nnButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _nnButton.frame = CGRectMake((self.frame.size.width - 100)/2, 200, 100, 40);
        _nnButton.backgroundColor = [UIColor blueColor];
        [_nnButton setTitle:@"点击刷新" forState:UIControlStateNormal];
        [_nnButton addTarget:self action:@selector(nnButtonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _nnButton;
}

@end
