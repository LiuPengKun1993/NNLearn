//
//  NNView.m
//  MVCDemo
//
//  Created by liupengkun on 2018/7/16.
//  Copyright © 2018年 以梦为马. All rights reserved.
//

#import "NNView.h"
#import "NNDataModel.h"

@interface NNView()

@property (nonatomic, strong) UIButton *nnButton;

@property (nonatomic, strong) UILabel *nnLabel;

@end

@implementation NNView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.nnLabel];
        [self addSubview:self.nnButton];
    }
    return self;
}

- (void)nnButtonClick {
    if (self.delegate && [self.delegate respondsToSelector:@selector(nnButtonClicked)]) {
        [self.delegate nnButtonClicked];
    }
}

- (void)refreshViewWithModel:(NNDataModel *)dataModel {
    self.nnLabel.text = dataModel.contentString;
}

#pragma mark - 懒加载区域
- (UILabel *)nnLabel {
    if (!_nnLabel) {
        _nnLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 300, self.frame.size.width-60, 30)];
        _nnLabel.textAlignment = NSTextAlignmentCenter;
        _nnLabel.backgroundColor = [UIColor redColor];
    }
    return _nnLabel;
}

- (UIButton *)nnButton {
    if (!_nnButton) {
        _nnButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _nnButton.frame = CGRectMake((self.frame.size.width - 100)/2, 200, 100, 40);
        _nnButton.backgroundColor = [UIColor blueColor];
        [_nnButton setTitle:@"点击刷新" forState:UIControlStateNormal];
        [_nnButton addTarget:self action:@selector(nnButtonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _nnButton;
}

@end
