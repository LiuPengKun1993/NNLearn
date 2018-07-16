//
//  NNViewController.m
//  MVVMDemo
//
//  Created by liupengkun on 2018/7/16.
//  Copyright © 2018年 以梦为马. All rights reserved.
//

#import "NNViewController.h"
#import "NNViewModel.h"
#import "NNView.h"


@interface NNViewController ()

@property (nonatomic, strong) NNView *nnView;
@property (nonatomic, strong) NNViewModel *nnViewModel;

@end

@implementation NNViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.nnView];
    // 模拟请求数据
    [self.nnViewModel requestData];
}

#pragma mark - 懒加载区域
- (NNViewModel *)nnViewModel {
    if (!_nnViewModel) {
        _nnViewModel = [[NNViewModel alloc] init];
    }
    return _nnViewModel;
}

- (NNView *)nnView {
    if (!_nnView) {
        _nnView = [[NNView alloc] initWithFrame:self.view.frame viewModel:self.nnViewModel];
    }
    return _nnView;
}

@end
