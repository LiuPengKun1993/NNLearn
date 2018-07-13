//
//  NNBaseViewController.h
//  NNRuntimeTest
//
//  Created by liupengkun on 2018/6/21.
//  Copyright © 2018年 以梦为马. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@interface NNBaseViewController : UIViewController
/**
 *  初始化View
 */
- (void)initView;

/**
 *  按钮的数组元素
 *
 *  @return 数组
 */
- (NSArray *)buttonTitleArray;

/**
 *  按钮的点击事件
 */
- (void)buttonClick:(UIButton *)sender;

/**
 *  标签的显示文本
 */
@property (nonatomic, copy) NSString *testLabelText;

@end
