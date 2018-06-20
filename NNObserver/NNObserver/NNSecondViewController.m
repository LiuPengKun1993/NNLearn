//
//  NNSecondViewController.m
//  NNObserver
//
//  Created by yizhilu on 2018/6/20.
//  Copyright © 2018年 LiuPengKun. All rights reserved.
//

#import "NNSecondViewController.h"

@interface NNSecondViewController ()

@property (nonatomic, strong) UILabel *testLabel;

@end

@implementation NNSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"SecondVC";
    [self.view addSubview:self.testLabel];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationCenter) name:@"NSNotificationCenter" object:nil];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UIViewController *vc = [NSClassFromString(@"NNThirdViewController") new];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    NSLog(@"SecondVC 已释放");
}

#pragma mark - 私有方法
- (void)notificationCenter {
    NSLog(@"SecondVC 通知被触发了...");
    self.testLabel.text = @"通知被触发了...";
}

#pragma mark - 懒加载区域
- (UILabel *)testLabel {
    if (!_testLabel) {
        _testLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 100)];
        _testLabel.center = self.view.center;
        _testLabel.text = @"点击进入 ThirdVC";
        _testLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _testLabel;
}

@end
