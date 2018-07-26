//
//  NNParentClassView+extension.m
//  NNLoad
//
//  Created by 刘朋坤 on 2018/7/26.
//  Copyright © 2018年 刘朋坤. All rights reserved.
//

#import "NNParentClassView+extension.h"

@implementation NNParentClassView (extension)

+ (void)load {
    NSLog(@"父类分类：%@", NSStringFromClass(self));
}

@end
