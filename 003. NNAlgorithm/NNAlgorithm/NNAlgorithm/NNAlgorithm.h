//
//  NNAlgorithm.h
//  NNAlgorithm
//
//  Created by liupengkun on 2018/7/14.
//  Copyright © 2018年 以梦为马. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NNAlgorithm : NSObject

/** 1-n 阶乘之和 */
- (NSInteger)factorialWithNumber:(NSInteger)number;

/** 跳台阶问题 */
- (NSInteger)jumpFloor:(NSInteger)number;

/** 变态跳台阶问题 */
- (NSInteger)jumpFloorII:(NSInteger)number;

@end
