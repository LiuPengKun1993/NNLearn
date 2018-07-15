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

/** 求1+2+3+...+n */
- (NSInteger)sum_Solution:(NSInteger)number;

/** 不用加减乘除做加法 */
- (NSInteger)sumA:(NSInteger)a b:(NSInteger)b;

/** 圆圈中最后剩下的数 */
- (NSInteger)lastRemaining_Solution:(NSInteger)n m:(NSInteger)m;

/** 从 1 到 n 整数中 1 出现的次数 */
- (NSInteger)numberOf1Between1AndN:(NSInteger)n;

@end
