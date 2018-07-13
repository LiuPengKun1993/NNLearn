//
//  NNCoding.m
//  NNRuntimeTest
//
//  Created by liupengkun on 2018/6/22.
//  Copyright © 2018年 以梦为马. All rights reserved.
//

#import "NNCoding.h"
#import <objc/runtime.h>

@implementation NNCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
    unsigned int count = 0;
    // 获取类中所有属性
    Ivar *ivars = class_copyIvarList(self.class, &count);
    // 遍历属性
    for (int i = 0; i < count; i ++) {
        // 取出 i 位置对应的属性
        Ivar ivar = ivars[i];
        // 查看属性
        const char *name = ivar_getName(ivar);
        NSString *key = [NSString stringWithUTF8String:name];
        // 利用 KVC 进行取值，根据属性名称获取对应的值
        id value = [self valueForKey:key];
        [aCoder encodeObject:value forKey:key];
    }
    free(ivars);
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        unsigned int count = 0;
        // 获取类中所有属性
        Ivar *ivars = class_copyIvarList(self.class, &count);
        // 遍历属性
        for (int i = 0; i < count; i ++) {
            // 取出 i 位置对应的属性
            Ivar ivar = ivars[i];
            // 查看属性
            const char *name = ivar_getName(ivar);
            NSString *key = [NSString stringWithUTF8String:name];
            // 进行解档取值
            id value = [aDecoder decodeObjectForKey:key];
            // 利用 KVC 对属性赋值
            [self setValue:value forKey:key];
        }
    }
    return self;
}

@end
