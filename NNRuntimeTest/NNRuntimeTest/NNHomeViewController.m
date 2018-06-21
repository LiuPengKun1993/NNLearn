//
//  NNHomeViewController.m
//  NNRuntimeTest
//
//  Created by liupengkun on 2018/6/21.
//  Copyright © 2018年 以梦为马. All rights reserved.
//

#import "NNHomeViewController.h"
#import "NNHomeTableView.h"

@interface NNHomeViewController ()<NNHomeTableViewDelegate>

@property (nonatomic, strong) NNHomeTableView *homeTableView;

@end

@implementation NNHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.homeTableView];
}

#pragma mark - 代理区域
- (void)didSelectRowWithController:(UIViewController *)controller {
     [self.navigationController pushViewController:controller animated:YES];
}

#pragma mark - 懒加载区域
- (NNHomeTableView *)homeTableView {
    if (!_homeTableView) {
        _homeTableView = [[NNHomeTableView alloc] initWithFrame:self.view.frame];
        _homeTableView.homeTableViewDelegate = self;
    }
    return _homeTableView;
}

@end
