//
//  NNView.h
//  MVCDemo
//
//  Created by liupengkun on 2018/7/16.
//  Copyright © 2018年 以梦为马. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NNDataModel;

@protocol NNViewDelegate <NSObject>
@optional
- (void)nnButtonClicked;
@end

@interface NNView : UIView

@property (nonatomic, weak) id<NNViewDelegate> delegate;

/** 网络请求成功后刷新数据 */
- (void)refreshViewWithModel:(NNDataModel *)dataModel;

@end
