//
//  ViewController.m
//  NN_ NSOperationPractice
//
//  Created by 刘朋坤 on 2018/8/9.
//  Copyright © 2018年 刘朋坤. All rights reserved.
//

#import "ViewController.h"
#import "NNNSOperation.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
/************************ 创建线程 ***********************/
    
    // 方式一：NSInvocationOperation
//    [self creatInvocationOperation];
    
    // 方式二：NSBlockOperation
//    [self creatBlockOperation];
    
    // 方式三：自定义 NSOperation 子类
//    [self creatCustomOperation];
    
/******************* NSOperationQueue 创建 ******************/
    
    // 方式一：NSOperationQueue 创建
//    [self creatOperationQueue1];
    
    // 方式二：NSOperationQueue 创建
//    [self creatOperationQueue2];
    
/******************* NSOperation 操作依赖 ******************/

    // 添加操作依赖
//    [self addOperationDependency];
    
/******************* 线程间的通信 ******************/
    
    [self downloadImage];
}

#pragma mark - 创建线程
/** 方式一：NSInvocationOperation */
// 只有将 NSOperation 放到一个 NSOperationQueue 中,才会异步执行操作.
- (void)creatInvocationOperation {
    // 创建 NSInvocationOperation 对象
    NSInvocationOperation *operation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(run) object:nil];
    
    // 开始执行操作
    // 默认情况下,调用了 start 方法后并不会开一条新线程去执行操作,只有将 NSOperation 放到一个 NSOperationQueue 中,才会异步执行操作.
    [operation start];
}

- (void)run {
    NSLog(@"当前的线程为 -- %@", [NSThread currentThread]);
}

/** 方式二：NSBlockOperation */
// 会异步执行操作
- (void)creatBlockOperation {
    NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
        // 主线程
        NSLog(@"1---%@", [NSThread currentThread]);
    }];
    // 添加任务(在子线程执行)
    [operation addExecutionBlock:^{
        NSLog(@"2---%@", [NSThread currentThread]);
    }];
    [operation addExecutionBlock:^{
        NSLog(@"3---%@", [NSThread currentThread]);
    }];
    // 开启执行操作
    [operation start];
}

/** 方式三：自定义 NSOperation 子类 */
// 非并行，且执行的操作与调用 start 是在同一线程中
- (void)creatCustomOperation {
    NNNSOperation *operation = [[NNNSOperation alloc] init];
    NSLog(@"start before");
    [operation start];
    NSLog(@"start after");
}

#pragma mark - NSOperationQueue 创建
/** 方式一：NSOperationQueue 创建 */
// 并行，开启了新线程
- (void)creatOperationQueue1 {
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    // 创建NSInvocationOperation对象
    NSInvocationOperation *operation1 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(run1) object:nil];
    NSInvocationOperation *operation2 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(run2) object:nil];
    
    // 创建NSBlockOperation对象
    NSBlockOperation *operation3 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"1 --- %@", [NSThread currentThread]);
    }];
    [operation3 addExecutionBlock:^{
        NSLog(@"2 --- %@", [NSThread currentThread]);
    }];
    NSBlockOperation *operation4 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"3 --- %@", [NSThread currentThread]);
    }];
    // 添加任务到队列中
    [queue addOperation:operation1];
    [queue addOperation:operation2];
    [queue addOperation:operation3];
    [queue addOperation:operation4];
}

- (void)run1 {
    NSLog(@"当前的线程为 -- %@", [NSThread currentThread]);
}

- (void)run2 {
    NSLog(@"当前的线程为 -- %@", [NSThread currentThread]);
}

/** 方式二：NSOperationQueue 创建 */
// 并行，开启了新线程
- (void)creatOperationQueue2 {
    // 创建 NSOperationQueue 队列
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue addOperationWithBlock:^{
        NSLog(@"1 --- %@", [NSThread currentThread]);
    }];
    [queue addOperationWithBlock:^{
        NSLog(@"2 --- %@", [NSThread currentThread]);
    }];
}

#pragma mark - NSOperation 操作依赖
/** 依赖操作调整执行顺序 */
// NSOperation 之间可以设置依赖来保证执行顺序,比如一定要让操作A执行完后,才能执行操作B,可以这么写`[operationB addDependency:operationA];` (操作B依赖于操作operationA), 另外,通过removeDependency方法可以删除依赖对象.
- (void)addOperationDependency {
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    NSBlockOperation *operation1 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"~~1~~%@", [NSThread currentThread]);
    }];
    NSBlockOperation *operation2 = [NSBlockOperation blockOperationWithBlock:^{
        for (int i = 0; i < 50; i ++) {
            NSLog(@"~~2~~%@~~%d~~", [NSThread currentThread], i);
        }
    }];
    NSBlockOperation *operation3 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"~~3~~%@", [NSThread currentThread]);
    }];
    [operation2 addExecutionBlock:^{
        NSLog(@"~~2E~~%@", [NSThread currentThread]);
    }];
    operation3.completionBlock = ^{
        NSLog(@"~~3C~~%@", [NSThread currentThread]);
    };
    // 设置依赖
    [operation1 addDependency:operation2];
    [operation2 addDependency:operation3];
    [queue addOperation:operation1];
    [queue addOperation:operation2];
    [queue addOperation:operation3];
    
    // 取消单个操作
//    [operation1 cancel];
    // 会阻塞当前线程，等到某个operation执行完毕
//    [operation2 waitUntilFinished];
    
    // 取消queue中所有的操作
//    [queue cancelAllOperations];
    // 设置队列的最大并发操作数量
//    queue.maxConcurrentOperationCount = 1;
    // 暂停 queue YES代表暂停队列,NO代表恢复队列
//    [queue setSuspended:YES];
    // 阻塞当前线程，等待queue的所有操作执行完毕
//    [queue waitUntilAllOperationsAreFinished];
}

#pragma mark - NSOperation 实现线程间的通信
- (void)downloadImage {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    imageView.center = self.view.center;
    [self.view addSubview:imageView];
    NSLog(@"1---%@", [NSThread currentThread]);
    [[[NSOperationQueue alloc] init] addOperationWithBlock:^{
        NSLog(@"2---%@", [NSThread currentThread]);
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1533750637718&di=95005b38780092651b451164ac0e4288&imgtype=0&src=http%3A%2F%2Fimg5.duitang.com%2Fuploads%2Fitem%2F201412%2F12%2F20141212185006_vcMns.jpeg"]];
        UIImage *image = [UIImage imageWithData:data];
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            NSLog(@"3---%@", [NSThread currentThread]);
            imageView.image = image;
        }];
    }];
}

@end
