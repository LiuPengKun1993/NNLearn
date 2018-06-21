//
//  NNHomeTableView.h
//  NNRuntimeTest
//
//  Created by liupengkun on 2018/6/21.
//  Copyright © 2018年 以梦为马. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NNHomeTableViewDelegate<NSObject>
@optional
- (void)didSelectRowWithController:(UIViewController *)controller;

@end

@interface NNHomeTableView : UITableView

@property (nonatomic, weak) id<NNHomeTableViewDelegate> homeTableViewDelegate;

@end
