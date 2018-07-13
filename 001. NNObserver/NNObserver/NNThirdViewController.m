//
//  NNThirdViewController.m
//  NNObserver
//
//  Created by yizhilu on 2018/6/20.
//  Copyright © 2018年 LiuPengKun. All rights reserved.
//

#import "NNThirdViewController.h"

@interface NNThirdViewController ()

/** 触发通知的按钮 **/
@property (nonatomic, strong) UIButton *noticeButton;
/** 触发观察者的文本框 **/
@property (nonatomic, strong) UITextView *textView;

@end

@implementation NNThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"ThirdVC";
    [self.view addSubview:self.noticeButton];
    [self.view addSubview:self.textView];
    [self.textView addObserver:self forKeyPath:@"contentSize" options:NSKeyValueObservingOptionNew context:nil];
}

#pragma mark - 键值观察
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    UITextView *textView = (UITextView *)object;
    if ([keyPath isEqualToString:@"contentSize"]) {
        NSLog(@"Observer 被触发了");
        CGFloat height = textView.contentSize.height;
        if (height > 100) {
            height = 100;
        } else if (height < 40) {
            height = 40;
        }
        CGRect textViewFrame = self.textView.frame;
        textViewFrame.size.height = height;
        self.textView.frame = textViewFrame;
    }
}

- (void)dealloc {
    [self.textView removeObserver:self forKeyPath:@"contentSize"];
    NSLog(@"ThirdVC 已释放");
}

#pragma mark - 私有方法
- (void)testButtonClick:(UIButton *)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"NSNotificationCenter" object:nil];
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 懒加载区域
- (UIButton *)noticeButton {
    if (!_noticeButton) {
        _noticeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _noticeButton.frame = CGRectMake(10, 0, 130, 30);
        _noticeButton.center = self.view.center;
        [_noticeButton setTitle:@"触发通知" forState:UIControlStateNormal];
        _noticeButton.backgroundColor = [UIColor redColor];
        [_noticeButton addTarget:self action:@selector(testButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _noticeButton;
}

- (UITextView *)textView {
    if (!_textView) {
        _textView = [[UITextView alloc] initWithFrame:CGRectMake(10, 100, [UIScreen mainScreen].bounds.size.width - 20, 40)];
        _textView.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1];
        _textView.font = [UIFont systemFontOfSize:16];
        UILabel *placeHolderLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 7, 200, 21)];
        placeHolderLabel.textColor = [UIColor lightGrayColor];
        placeHolderLabel.font = [UIFont systemFontOfSize:16];
        placeHolderLabel.text = @"输入文本触发观察者";
        [_textView addSubview:placeHolderLabel];
        [_textView setValue:placeHolderLabel forKey:@"_placeholderLabel"];
    }
    return _textView;
}

@end
