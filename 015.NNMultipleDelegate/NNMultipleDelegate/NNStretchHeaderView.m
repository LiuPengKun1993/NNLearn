//
//  NNStretchHeaderView.m
//  NNMultipleDelegate
//
//  Created by 刘朋坤 on 2018/8/17.
//  Copyright © 2018年 刘朋坤. All rights reserved.
//

#import "NNStretchHeaderView.h"

@interface NNStretchHeaderView()<UIScrollViewDelegate>

/** 头部视图 */
@property (nonatomic, strong) UIImageView *headerImageView;
/** 初始位置 */
@property (nonatomic, assign) CGRect headerImageViewFrame;

@end

@implementation NNStretchHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self creatChildViews];
        _headerImageViewFrame = self.headerImageView.frame;
    }
    return self;
}

#pragma mark - 布局区域
/** 创建子视图 */
- (void)creatChildViews {
    _headerImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dog01"]];
    [self addSubview:_headerImageView];
    _headerImageView.frame = self.frame;
}

#pragma mark - 代理区域
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY >= 0) { // 向上滚动
        self.headerImageView.frame = CGRectMake(_headerImageViewFrame.origin.x, _headerImageViewFrame.origin.y - offsetY, _headerImageViewFrame.size.width, _headerImageViewFrame.size.height);
    } else { // 向下滚动
        CGFloat heigth = _headerImageViewFrame.size.height + ABS(offsetY);
        CGFloat width = heigth * _headerImageViewFrame.size.width / _headerImageViewFrame.size.height;
        CGFloat x = _headerImageViewFrame.origin.x - (width - _headerImageViewFrame.size.width) / 2.0;
        self.headerImageView.frame = CGRectMake( x, _headerImageViewFrame.origin.y, width, heigth);
    }
}

@end
