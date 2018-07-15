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

/** 不用加减乘除做加法 */
- (NSInteger)sumA:(NSInteger)a b:(NSInteger)b {
    return b == 0 ? a : [self sumA:(a ^ b) b:((a & b) << 1)];
}

/** 圆圈中最后剩下的数 */
- (NSInteger)lastRemaining_Solution:(NSInteger)n m:(NSInteger)m {
    // 特殊输入的处理
    if (n == 0)
        return -1;
    if (n == 1)
        return 0;
    return ([self lastRemaining_Solution:n-1 m:m] + m) % n;
}

/** 从 1 到 n 整数中 1 出现的次数 */
- (NSInteger)numberOf1Between1AndN:(NSInteger)n {
    NSInteger number = 0;
    for (NSInteger m = 1; m <= n; m *= 10) {
        NSInteger a = n / m, b = n % m;
        number += (a + 8) / 10 * m + (a % 10 == 1 ? b + 1 : 0);
    }
    return number;
}

@end
