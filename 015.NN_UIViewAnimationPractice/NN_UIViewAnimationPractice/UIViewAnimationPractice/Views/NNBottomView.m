//
//  NNBottomView.m
//  NN_UIViewAnimationPractice
//
//  Created by 刘朋坤 on 2018/8/11.
//  Copyright © 2018年 刘朋坤. All rights reserved.
//

#import "NNBottomView.h"

@interface NNBottomView()

/** 按钮的数组元素 **/
@property (nonatomic, copy) NSArray *buttonTitleArray;

@end

@implementation NNBottomView

- (instancetype)initWithFrame:(CGRect)frame buttonTitleArray:(NSArray *)buttonTitleArray {
    if (self = [super initWithFrame:frame]) {
        self.buttonTitleArray = buttonTitleArray;
        [self initView];
    }
    return self;
}

#pragma mark - UI 布局区域
/** 遍历创建底部按钮 */
- (void)initView {
    __weak typeof(self) weakSelf = self;
    [_buttonTitleArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *testButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [weakSelf addSubview:testButton];
        testButton.frame = [weakSelf rectForBtnAtIndex:idx totalNum:weakSelf.buttonTitleArray.count];
        [testButton setTitle:weakSelf.buttonTitleArray[idx] forState:UIControlStateNormal];
        testButton.titleLabel.font = [UIFont systemFontOfSize:13];
        testButton.backgroundColor = [UIColor redColor];
        testButton.tag = idx;
        [testButton addTarget:weakSelf action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    }];
}

/** frame 布局 */
- (CGRect)rectForBtnAtIndex:(NSUInteger)index totalNum:(NSUInteger)totleNum {
    // 每一行最多显示4个
    NSUInteger maxColumnNum = 4;
    // 每个按钮的列间距
    CGFloat columnMargin = 20;
    // 每个按钮的行间距
    CGFloat rowMargin = 20;
    // 每个按钮的宽度
    NSInteger tempTotleNum = totleNum >= 4 ? 4 : totleNum;
    CGFloat width = (self.frame.size.width - columnMargin * (tempTotleNum + 1)) / tempTotleNum;
    // 每个按钮的高度
    CGFloat height = 30;
    CGFloat offsetX = columnMargin+(index % maxColumnNum) * (width + columnMargin);
    CGFloat offsetY = self.center.y - self.frame.origin.y - 50 + (index / maxColumnNum) * (height + rowMargin);
    return CGRectMake(offsetX, offsetY, width, height);
}

#pragma mark - 点击事件区域
- (void)buttonClick:(UIButton *)sender {
    if (self.actionBlock) {
        [UIView animateWithDuration:0.2 animations:^{
            sender.transform = CGAffineTransformMakeScale(0.8, 0.8);
            sender.alpha = 0.8;
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.2 animations:^{
                sender.transform = CGAffineTransformIdentity;
                sender.alpha = 1;
            }];
        }];
        self.actionBlock(sender);
    }
}

@end
