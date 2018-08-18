//
//  NNLabel.m
//  NNMultipleDelegate
//
//  Created by 刘朋坤 on 2018/8/17.
//  Copyright © 2018年 刘朋坤. All rights reserved.
//

#import "NNLabel.h"
@interface NNLabel()<UIScrollViewDelegate>

@end

@implementation NNLabel

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor redColor];
        self.textAlignment = NSTextAlignmentCenter;
        self.text = 0;
    }
    return self;
}

#pragma mark - 代理区域
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    self.text = [NSString stringWithFormat:@"%.2f", scrollView.contentOffset.y];
}

@end
