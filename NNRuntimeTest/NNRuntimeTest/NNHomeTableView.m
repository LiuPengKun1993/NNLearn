//
//  NNHomeTableView.m
//  NNRuntimeTest
//
//  Created by liupengkun on 2018/6/21.
//  Copyright © 2018年 以梦为马. All rights reserved.
//

#import "NNHomeTableView.h"

@interface NNHomeTableView()<UITableViewDelegate, UITableViewDataSource>

/** 存储 cell 名字 **/
@property (nonatomic, copy) NSArray *titleArray;
/** 存储控制器名字 **/
@property (nonatomic, copy) NSArray *controllerArray;

@end

@implementation NNHomeTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        self.tableFooterView = [[UIView alloc] init];
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
        [self registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellID"];
    }
    return self;
}

#pragma mark - 代理区域
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath];
    cell.textLabel.text = self.titleArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIViewController *controller = [NSClassFromString(self.controllerArray[indexPath.row]) new];
    controller.navigationItem.title = self.titleArray[indexPath.row];
    if (self.homeTableViewDelegate && [self.homeTableViewDelegate respondsToSelector:@selector(didSelectRowWithController:)]) {
        [self.homeTableViewDelegate didSelectRowWithController:controller];
    }
}

#pragma mark - 懒加载区域
- (NSArray *)titleArray {
    if (!_titleArray) {
        _titleArray = @[@"更改属性值",
                        @"动态添加属性",
                        @"动态添加方法",
                        @"交换方法的实现",
                        @"拦截并替换方法",
                        @"在方法上增加额外功能",
                        @"归档解档",
                        @"字典转模型"];
    }
    return _titleArray;
}

- (NSArray *)controllerArray {
    if (!_controllerArray) {
        _controllerArray = @[@"NNFirstViewController",
                             @"NNSecondViewController",
                             @"NNThirdViewController",
                             @"NNFourthViewController",
                             @"NNFifthViewController",
                             @"NNSixthViewController",
                             @"NNSeventhViewController",
                             @"NNEighthViewController"];
    }
    return _controllerArray;
}

@end
