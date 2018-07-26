//
//  NNSubclassView.m
//  NNLoad
//
//  Created by 刘朋坤 on 2018/7/26.
//  Copyright © 2018年 刘朋坤. All rights reserved.
//

#import "NNSubclassView.h"

@implementation NNSubclassView

+ (void)load {
    NSLog(@"子类：%@", NSStringFromClass(self));
}

@end
