//
//  NSObject+NNAddAttribute.m
//  NNRuntimeTest
//
//  Created by liupengkun on 2018/6/21.
//  Copyright © 2018年 以梦为马. All rights reserved.
//

#import "NSObject+NNAddAttribute.h"
#import <objc/message.h>

@implementation NSObject (NNAddAttribute)

- (void)setName:(NSString *)name {
    objc_setAssociatedObject(self, @"name", name, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)name {
    return objc_getAssociatedObject(self, @"name");
}

@end
