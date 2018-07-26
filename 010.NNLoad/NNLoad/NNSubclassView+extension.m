//
//  NNSubclassView+extension.m
//  NNLoad
//
//  Created by 刘朋坤 on 2018/7/26.
//  Copyright © 2018年 刘朋坤. All rights reserved.
//

#import "NNSubclassView+extension.h"

@implementation NNSubclassView (extension)

+ (void)load {
    NSLog(@"子类分类：%@", NSStringFromClass(self));
}

@end
