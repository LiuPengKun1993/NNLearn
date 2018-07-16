//
//  NNViewModel.h
//  MVVMDemo
//
//  Created by liupengkun on 2018/7/16.
//  Copyright © 2018年 以梦为马. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NNViewModel : NSObject

- (void)requestData;

@property (nonatomic, copy) NSString *contentString;

@end
