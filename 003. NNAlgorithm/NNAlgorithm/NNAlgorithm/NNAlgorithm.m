//
//  NNAlgorithm.m
//  NNAlgorithm
//
//  Created by liupengkun on 2018/7/14.
//  Copyright © 2018年 以梦为马. All rights reserved.
//

#import "NNAlgorithm.h"

@implementation NNAlgorithm

/** 1-n 阶乘之和 */
- (NSInteger)factorialWithNumber:(NSInteger)number {
    // 总和
    NSInteger sum = 0;
    // 阶乘值, 初始化为1
    NSInteger factorial = 1;
    for (NSInteger i = 1; i <= number; i++) {
        factorial = factorial * i;
        sum = (int) (sum + factorial);
    }
    return sum;
}

/** 跳台阶问题 */
- (NSInteger)jumpFloor:(NSInteger)number {
    if(number < 1)
        return 0;
    if(number == 1)
        return 1;
    if(number == 2)
        return 2;
    return [self jumpFloor:(number-1)] + [self jumpFloor:(number-2)];
}

/** 变态跳台阶问题 */
- (NSInteger)jumpFloorII:(NSInteger)number {
    if(number < 1)
        return 0;
    if(number == 1)
        return 1;
    return 2*[self jumpFloorII:(number-1)];
}

/** 求1+2+3+...+n */
- (NSInteger)sum_Solution:(NSInteger)number {
    number && (number += [self sum_Solution:(number-1)]);
    return number;
}

@end
