//
//  NNNSOperation.m
//  NN_ NSOperationPractice
//
//  Created by 刘朋坤 on 2018/8/9.
//  Copyright © 2018年 刘朋坤. All rights reserved.
//

#import "NNNSOperation.h"

@implementation NNNSOperation

/** 自定义 NSOperation 子类需要重写 - (void)main方法 */
// 非并行
- (void)main {
    // 新建一个自动释放池，如果是异步执行操作，那么将无法访问到主线程的自动释放池
    @autoreleasepool {
        for (NSInteger i = 0; i<100; i++) {
            NSLog(@"1 - %ld - %@", i, [NSThread currentThread]);
        }
        // 检测操作是否被取消,对取消做出响应
        if (self.isCancelled) return;
        
        for (NSInteger i = 0; i<100; i++) {
            NSLog(@"2 - %ld - %@", i, [NSThread currentThread]);
        }
        if (self.isCancelled) return;
        
        for (NSInteger i = 0; i<100; i++) {
            NSLog(@"3 - %ld - %@", i, [NSThread currentThread]);
        }
        if (self.isCancelled) return;
    }
}

/**
 自定义并行的 NSOperation 需要重写以下几个方法：
 
 start: 所有并行的 Operations 都必须重写这个方法，然后在你想要执行的线程中手动调用这个方法
 main: 在 start 方法中调用
 isExecuting: 是否执行中
 isFinished: 是否已完成
 isConcurrent: 该方法现在已经由 isAsynchronous 方法代替
 isAsynchronous: 该方法默认返回 NO ，表示非并发执行。并发执行需要自定义并且返回 YES
 */

@end
