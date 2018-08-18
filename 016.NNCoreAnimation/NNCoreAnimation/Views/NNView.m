//
//  NNView.m
//  NN_UIViewAnimationPractice
//
//  Created by 刘朋坤 on 2018/8/11.
//  Copyright © 2018年 刘朋坤. All rights reserved.
//

#import "NNView.h"
#import "NNBottomView.h"

@interface NNView()

/** 底部按钮视图 */
@property (nonatomic, strong) NNBottomView *bottomView;
/** 按钮的数组元素 **/
@property (nonatomic, copy) NSArray *buttonTitleArray;

@end

@implementation NNView

- (instancetype)initWithFrame:(CGRect)frame buttonTitleArray:(NSArray *)buttonTitleArray {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor cyanColor];
        _buttonTitleArray = buttonTitleArray;
        [self creatViews];
    }
    return self;
}

#pragma mark - 布局区域
- (void)creatViews {
    [self addSubview:self.headerImage];
    [self addSubview:self.bottomView];
}

#pragma mark - 懒加载区域
- (UIImageView *)headerImage {
    if (!_headerImage) {
        _headerImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"header"]];
        _headerImage.frame = CGRectMake(100, 100, 200, 200);
        _headerImage.center = self.center;
    }
    return _headerImage;
}

- (NNBottomView *)bottomView {
    if (!_bottomView) {
        _bottomView = [[NNBottomView alloc] initWithFrame:CGRectMake(0, self.frame.size.height - 200, self.frame.size.width, 200) buttonTitleArray:self.buttonTitleArray];
        __weak typeof(self) weakSelf = self;
        _bottomView.actionBlock = ^(id param) {
            if (weakSelf.actionBlock) {
                weakSelf.actionBlock(param);
            }
        };
    }
    return _bottomView;
}


@end
