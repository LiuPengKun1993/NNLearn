//
//  NNDataModel.h
//  MVCDemo
//
//  Created by liupengkun on 2018/7/16.
//  Copyright © 2018年 以梦为马. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NNDataModel : NSObject

- (void)requestData:(void (^)(id object))complete;

@property (nonatomic, copy) NSString *contentString;

@end
