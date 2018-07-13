//
//  NSObject+NNKeyValues.h
//  NNRuntimeTest
//
//  Created by liupengkun on 2018/6/22.
//  Copyright © 2018年 以梦为马. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ModelDelegate <NSObject>
@optional
// 用在三级数组转换
+ (NSDictionary *)arrayContainModelClass;

@end

@interface NSObject (NNKeyValues)

/** 字典转模型 **/
+ (instancetype)modelWithDict:(NSDictionary *)dict;

@end
