//
//  ViewController.m
//  NNMultipleDelegate
//
//  Created by 刘朋坤 on 2018/8/17.
//  Copyright © 2018年 刘朋坤. All rights reserved.
//

#import "ViewController.h"
#import "NNMultipleDelegateHelper.h"
#import "NNStretchHeaderView.h"
#import "NNLabel.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

/** UITableView */
@property (nonatomic, strong) UITableView *tableView;
/** 头部视图 */
@property (nonatomic, strong) NNStretchHeaderView *headerView;
/** 测试偏移量 */
@property (nonatomic, strong) NNLabel *contentOffsetLabel;
@property (nonatomic, strong) NNMultipleDelegateHelper *delegateHelper;

@end

@implementation ViewController
static NSString *const UITableViewCellID = @"UITableViewCellID";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.headerView];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.contentOffsetLabel];
    [self creatDelegateHelper];
}

- (void)creatDelegateHelper {
    _delegateHelper = [NNMultipleDelegateHelper new];
    _delegateHelper.delegateArray = @[self, self.headerView, self.contentOffsetLabel];
    self.tableView.dataSource = (id<UITableViewDataSource>)_delegateHelper;
    self.tableView.delegate = (id<UITableViewDelegate>)_delegateHelper;
}

#pragma mark - 代理区域
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:UITableViewCellID forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld", indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

#pragma mark - 懒加载区域
- (NNStretchHeaderView *)headerView {
    if (!_headerView) {
        _headerView = [[NNStretchHeaderView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
    }
    return _headerView;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.contentInset = UIEdgeInsetsMake(200, 0, 0, 0);
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.delegate = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:UITableViewCellID];
    }
    return _tableView;
}

- (NNLabel *)contentOffsetLabel {
    if (!_contentOffsetLabel) {
        _contentOffsetLabel = [[NNLabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 2.0 - 50, 300, 100, 21)];
    }
    return _contentOffsetLabel;
}

@end
