//
//  NNSixthViewController.m
//  NNRuntimeTest
//
//  Created by liupengkun on 2018/6/21.
//  Copyright © 2018年 以梦为马. All rights reserved.
//

#import "NNSixthViewController.h"
#import "NNCountButton.h"

@interface NNSixthViewController ()

@property (nonatomic, strong) NNCountButton *testButton;

@end

@implementation NNSixthViewController

- (void)initView {
    [super initView];
    [self.view addSubview:self.testButton];
}

- (NSArray *)buttonTitleArray{
    return @[@"这", @"几", @"个", @"按", @"钮", @"不", @"统", @"计"];
}

- (void)buttonClick:(UIButton *)sender {
    self.testLabelText = @"此按钮不统计点击次数";
}

- (void)countButtonClick:(UIButton *)sender {
    self.testLabelText = [NSString stringWithFormat:@"点击 %ld 次了", self.testButton.count];
}

#pragma mark - 懒加载
- (NNCountButton *)testButton {
    if (!_testButton) {
        _testButton = [NNCountButton buttonWithType:UIButtonTypeCustom];
        [_testButton addTarget:self action:@selector(countButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [_testButton setTitle:@"统计此按钮的点击数量" forState:UIControlStateNormal];
        _testButton.frame = CGRectMake(20, self.view.center.y + 100, [UIScreen mainScreen].bounds.size.width - 40, 30);
        _testButton.backgroundColor = [UIColor redColor];
    }
    return _testButton;
}

@end
