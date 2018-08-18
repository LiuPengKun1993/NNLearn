//
//  NNMultipleDelegateHelper.m
//  NNMultipleDelegate
//
//  Created by 刘朋坤 on 2018/8/17.
//  Copyright © 2018年 刘朋坤. All rights reserved.
//

#import "NNMultipleDelegateHelper.h"

@interface NNMultipleDelegateHelper ()

/** 存储 delegate 的数组结构 */
@property (nonatomic, strong, nonnull) NSPointerArray *pointerArray;

@end

@implementation NNMultipleDelegateHelper

- (void)setDelegateArray:(NSArray *)delegateArray {
    for (id delegate in delegateArray) {
        [self.pointerArray addPointer:(__bridge void * _Nullable)(delegate)];
    }
}

- (BOOL)respondsToSelector:(SEL)aSelector {
    if ([super respondsToSelector:aSelector]) {
        return YES;
    }
    for (id target in self.pointerArray) {
        if ([target respondsToSelector:aSelector]) {
            return YES;
        }
    }
    return NO;
}

/** 函数符号制造器 */
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    // 创建一个函数签名
    NSMethodSignature *signature = [super methodSignatureForSelector:aSelector];
    if (!signature) {
        for (id target in self.pointerArray) {
            if ((signature = [target methodSignatureForSelector:aSelector])) {
                break;
            }
        }
    }
    return signature;
}

/** 函数执行器 */
- (void)forwardInvocation:(NSInvocation *)anInvocation {
    for (id target in self.pointerArray) {
        if ([target respondsToSelector:anInvocation.selector]) {
            // 消息调用
            [anInvocation invokeWithTarget:target];
        }
    }
}

#pragma mark - 懒加载区域
/** 存储 delegate 的数组结构 */
- (NSPointerArray *)pointerArray {
    if (!_pointerArray) {
        _pointerArray = [NSPointerArray weakObjectsPointerArray];
    }
    return _pointerArray;
}

@end
