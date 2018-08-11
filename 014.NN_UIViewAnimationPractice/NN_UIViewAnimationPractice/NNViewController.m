//
//  NNViewController.m
//  NN_UIViewAnimationPractice
//
//  Created by 刘朋坤 on 2018/8/11.
//  Copyright © 2018年 刘朋坤. All rights reserved.
//

#import "NNViewController.h"

@interface NNViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
/** 数据源 */
@property (nonatomic, copy) NSArray *titleArray;
/** 控制器数组 */
@property (nonatomic, copy) NSArray *controllerArray;

@end

@implementation NNViewController

static NSString *cellID = @"cellID";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
}

#pragma mark - 代理区域
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.transform = CGAffineTransformMakeScale(1.2, 0.8);
    cell.textLabel.text = self.titleArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.navigationController pushViewController:[NSClassFromString(self.controllerArray[indexPath.row]) new] animated:YES];
}

#pragma mark - 懒加载区域
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc] init];
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    }
    return _tableView;
}

- (NSArray *)titleArray {
    if (!_titleArray) {
        _titleArray = @[@"Frame Bounds Center", @"Transform", @"Transition", @"SpringAnimation", @"Alpha", @"Background"];
    }
    return _titleArray;
}

- (NSArray *)controllerArray {
    if (!_controllerArray) {
        _controllerArray = @[@"NNFrameAnimationController", @"NNTransformController", @"NNTransitionAnimationController", @"NNSpringAnimationController", @"NNAlphaAnimationViewController", @"NNBackgroundAnimationViewController"];
    }
    return _controllerArray;
}

@end
