//
//  NNViewController.m
//  MVCDemo
//
//  Created by liupengkun on 2018/7/16.
//  Copyright © 2018年 以梦为马. All rights reserved.
//

#import "NNViewController.h"
#import "NNDataModel.h"
#import "NNView.h"

@interface NNViewController ()<NNViewDelegate>
@property (nonatomic, strong) NNView *nnView;
@property (nonatomic, strong) NNDataModel *nnViewModel;
@end

@implementation NNViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.nnView];
    // 模拟请求数据
    [self requestData];
}

#pragma mark - 网络请求区域
- (void)requestData {
    __weak typeof(self) weakSelf = self;
    [self.nnViewModel requestData:^(id object) {
        [weakSelf.nnView refreshViewWithModel:weakSelf.nnViewModel];
    }];
}

#pragma mark - 代理区域
- (void)nnButtonClicked {
    [self requestData];
}

#pragma mark - 懒加载区域
- (NNDataModel *)nnViewModel {
    if (!_nnViewModel) {
        _nnViewModel = [[NNDataModel alloc] init];
    }
    return _nnViewModel;
}

- (NNView *)nnView {
    if (!_nnView) {
        _nnView = [[NNView alloc] initWithFrame:self.view.frame];
        _nnView.delegate = self;
    }
    return _nnView;
}

@end
