//
//  NNBaseViewController.m
//  NNRuntimeTest
//
//  Created by liupengkun on 2018/6/21.
//  Copyright © 2018年 以梦为马. All rights reserved.
//

#import "NNBaseViewController.h"

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)

@interface NNBaseViewController ()

/** 通用标签 **/
@property (nonatomic, strong) UILabel *testLabel;

@property (nonatomic, copy) NSArray *buttonTitleArray;

@end

@implementation NNBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initData];
    [self initView];
}

- (void)initData {
    _buttonTitleArray = [self buttonTitleArray];
}

- (void)initView {
    __weak typeof(self) weakSelf = self;
    [_buttonTitleArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *testButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [weakSelf.view addSubview:testButton];
        testButton.frame = [weakSelf rectForBtnAtIndex:idx totalNum:weakSelf.buttonTitleArray.count];
        [testButton setTitle:weakSelf.buttonTitleArray[idx] forState:UIControlStateNormal];
        testButton.backgroundColor = [UIColor redColor];
        testButton.tag = idx;
        [testButton addTarget:weakSelf action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    }];
    
    _testLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.view.center.y + 50, SCREEN_WIDTH, 30)];
    [self.view addSubview:_testLabel];
    _testLabel.textAlignment = NSTextAlignmentCenter;
    _testLabel.text = @"默认文本";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setTestLabelText:(NSString *)testLabelText {
    _testLabel.text = testLabelText;
}

- (CGRect)rectForBtnAtIndex:(NSUInteger)index totalNum:(NSUInteger)totleNum {
    // 每一行最多显示4个
    NSUInteger maxColumnNum = 4;
    // 每个按钮的列间距
    CGFloat columnMargin = 20;
    // 每个按钮的行间距
    CGFloat rowMargin = 20;
    // 每个按钮的宽度
    NSInteger tempTotleNum = totleNum >= 4 ? 4 : totleNum;
    CGFloat width = (SCREEN_WIDTH - columnMargin * (tempTotleNum + 1)) / tempTotleNum;
    // 每个按钮的高度
    CGFloat height = 30;
    CGFloat offsetX = columnMargin+(index % maxColumnNum) * (width + columnMargin);
    CGFloat offsetY = self.view.center.y - 50 + (index / maxColumnNum) * (height + rowMargin);
    return CGRectMake(offsetX, offsetY, width, height);
}

- (void)buttonClick:(UIButton *)sender {
    
}

- (NSArray *)buttonTitleArray {
    return @[@"点击"];
}

@end
