//
//  ViewController.m
//  NN_GCDPractice
//
//  Created by 刘朋坤 on 2018/8/8.
//  Copyright © 2018年 刘朋坤. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

/** 定时器(这里不用带 "*"，因为 dispatch_source_t 就是个类，内部已经包含了 "*") */
@property (nonatomic, strong) dispatch_source_t timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
/*********************** dispatch_async(异步函数) **********************/
    
    // 异步函数 + 并发队列
//    [self dispatchAsyncPriorityDefault];
    
    // 异步函数 + 串行队列
//    [self dispatchAsyncSerial];
    
/*********************** dispatch_sync(同步函数) **********************/

    // 同步函数 + 并发队列
//    [self dispatchSyncPriorityDefault];
    
    // 同步函数 + 串行队列
//    [self dispatchSyncSerial];
    
/*********************** 在主队列中的应用 **********************/
    
    // 异步函数 + 主队列
//    [self dispatchAsyncMain];
    
    // 同步函数 + 主队列
//    [self dispatchSyncMain];
    
/*********************** dispatch_group_async **********************/
    
    // 创建队列组
//    [self dispatchGroupAsync];
    
/*********************** dispatch_barrier_async **********************/

    // 栅栏
//    [self dispatchBarrierAsync];
    
/*********************** dispatch_apply **********************/
    
    // 执行某个代码片段10次
//    [self dispatchApply];
    
/*********************** dispatch_once_t **********************/
    
    // 整个应用程序中只会被调用一次的代码块
//    [self dispatchOnce];
//    [self dispatchOnce];
//    [self dispatchOnce];
//    [self dispatchOnce];
//    [self dispatchOnce];
    
/*********************** dispatch_after **********************/

//    [self dispatchAfter];
    
/*********************** dispatch_time_t **********************/
    
//    [self dispatchTime];
    
/*********************** GCD 线程间的通信 **********************/

    [self downloadImage];
}

#pragma mark - dispatch_async(异步函数)
/** 异步函数 + 并发队列 */
// 异步函数 + 并发队列:可以同时开启多条线程,任务是并行的
- (void)dispatchAsyncPriorityDefault {
    // 创建并发队列
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    // 将任务加入队列
    dispatch_async(queue, ^{
        for (NSInteger i = 0 ; i < 5; i ++) {
            NSLog(@"%ld~~~~1~~~~%@", i, [NSThread currentThread]);
        }
    });
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i < 5; i ++) {
            NSLog(@"%ld~~~2~~~%@", i, [NSThread currentThread]);
        }
    });
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i < 5; i ++) {
            NSLog(@"%ld~~~~3~~~~%@", i, [NSThread currentThread]);
        }
    });
}

/** 异步函数 + 串行队列 */
// 异步函数 + 串行队列: 会开启新的线程，但是任务是串行的，执行完一个任务，再执行下一个任务
- (void)dispatchAsyncSerial {
    // 创建串行队列
    dispatch_queue_t queue = dispatch_queue_create("YMWM", DISPATCH_QUEUE_SERIAL);
    // 将任务加入队列
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i < 5 ; i ++) {
            NSLog(@"1~~~%@~~~~~%ld", [NSThread currentThread], i);
        }
    });
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i < 5; i ++) {
            NSLog(@"2~~~%@~~~~~%ld", [NSThread currentThread], i);
        }
    });
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i < 5; i ++) {
            NSLog(@"3~~~%@~~~~~%ld", [NSThread currentThread], i);
        }
    });
}

#pragma mark - dispatch_sync(同步函数)
/** 同步函数 + 并发队列 */
// 同步函数 + 并发队列:不会开启新的线程，任务是串行的，执行完一个任务，再执行下一个任务
- (void)dispatchSyncPriorityDefault {
    // 获得全局的并发队列
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    // 将任务加入队列
    dispatch_sync(queue, ^{
        for (NSInteger i = 0; i < 5; i ++) {
            NSLog(@"1~~~%@~~~~~%ld", [NSThread currentThread], i);
        }
    });
    dispatch_sync(queue, ^{
        for (NSInteger i = 0; i < 5; i ++) {
            NSLog(@"2~~~%@~~~~~%ld", [NSThread currentThread], i);
        }
    });
    dispatch_sync(queue, ^{
        for (NSInteger i = 0; i < 5; i ++) {
            NSLog(@"3~~~%@~~~~~%ld", [NSThread currentThread], i);
        }
    });
}

/** 同步函数 + 串行队列 */
// 同步函数 + 串行队列:不会开启新的线程，任务是串行的，执行完一个任务，再执行下一个任务
- (void)dispatchSyncSerial {
    // 创建串行队列
    dispatch_queue_t queue = dispatch_queue_create("YMWM", DISPATCH_QUEUE_SERIAL);
    // 将任务加入队列
    dispatch_sync(queue, ^{
        for (NSInteger i = 0; i < 5; i ++) {
            NSLog(@"1~~~%@~~~~~%ld", [NSThread currentThread], i);
        }
    });
    dispatch_sync(queue, ^{
        for (NSInteger i = 0; i < 5; i ++) {
            NSLog(@"2~~~%@~~~~~%ld", [NSThread currentThread], i);
        }
    });
    dispatch_sync(queue, ^{
        for (NSInteger i = 0; i < 5; i ++) {
            NSLog(@"3~~~%@~~~~~%ld", [NSThread currentThread], i);
        }
    });
}

#pragma mark - 两者在主队列中的应用
/** 异步函数 + 主队列 */
// 异步函数 + 主队列：只在主线程中执行任务，任务是串行的，执行完一个任务，再执行下一个任务
- (void)dispatchAsyncMain {
    dispatch_queue_t queue = dispatch_get_main_queue();
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i < 5; i ++) {
            NSLog(@"1~~~%@~~~~~%ld", [NSThread currentThread], i);
        }
    });
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i < 5; i ++) {
            NSLog(@"2~~~%@~~~~~%ld", [NSThread currentThread], i);
        }
    });
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i < 5; i ++) {
            NSLog(@"3~~~%@~~~~~%ld", [NSThread currentThread], i);
        }
    });
}

/** 同步函数 + 主队列 */
// 同步函数 + 主队列：死循环
- (void)dispatchSyncMain {
    dispatch_queue_t queue = dispatch_get_main_queue();
    dispatch_sync(queue, ^{
        for (NSInteger i = 0; i < 5; i ++) {
            NSLog(@"1~~~%@~~~~~%ld", [NSThread currentThread], i);
        }
    });
    dispatch_sync(queue, ^{
        for (NSInteger i = 0; i < 5; i ++) {
            NSLog(@"2~~~%@~~~~~%ld", [NSThread currentThread], i);
        }
    });
    dispatch_sync(queue, ^{
        for (NSInteger i = 0; i < 5; i ++) {
            NSLog(@"3~~~%@~~~~~%ld", [NSThread currentThread], i);
        }
    });
}

#pragma mark - dispatch_group_async 的使用
/** 创建队列组 */
// dispatch_group_async 各个队列的顺序执行不定，待所有队列执行完毕后，回到主线程
- (void)dispatchGroupAsync {
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    // 创建一个队列组
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_async(group, queue, ^{
        // 添加操作...
        [NSThread sleepForTimeInterval:1];
        NSLog(@"1%@", [NSThread currentThread]);
    });
    dispatch_group_async(group, queue, ^{
        // 添加操作...
        [NSThread sleepForTimeInterval:1];
        NSLog(@"2%@", [NSThread currentThread]);
    });
    dispatch_group_async(group, queue, ^{
        // 添加操作...
        [NSThread sleepForTimeInterval:1];
        NSLog(@"3%@", [NSThread currentThread]);
    });
    // 回到主线程
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"回到主线程刷新UI");
    });
}

#pragma mark - dispatch_barrier_async 的使用
/** 栅栏的使用 */
// 先执行 dispatch_barrier_async 之前的任务，后执行 dispatch_barrier_async 之后的任务
- (void)dispatchBarrierAsync {
    dispatch_queue_t queue = dispatch_queue_create("YMWM", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        [NSThread sleepForTimeInterval:.5];
        NSLog(@"1%@", [NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        [NSThread sleepForTimeInterval:.5];
        NSLog(@"2%@", [NSThread currentThread]);
    });
    dispatch_barrier_async(queue, ^{
        NSLog(@"barrier --- %@", [NSThread currentThread]);
        [NSThread sleepForTimeInterval:.5];
    });
    dispatch_async(queue, ^{
        NSLog(@"3%@", [NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"4%@", [NSThread currentThread]);
    });
}

#pragma mark - dispatch_apply 的使用
/** 重复执行某处代码 */
// 以下代码片段执行 10 次
- (void)dispatchApply {
    // 执行某个代码片段10次
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_apply(10, queue, ^(size_t index) {
        NSLog(@"%@", [NSThread currentThread]);
    });
}

#pragma mark - dispatch_once_t 的使用
/** 单例 */
// 整个应用程序中只会被调用一次的代码块
- (void)dispatchOnce {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSLog(@"%@", [NSThread currentThread]);
    });
}

#pragma mark - dispatch_after 的使用
/** 延迟执行 */
// 延迟执行，较为精确
- (void)dispatchAfter {
    NSLog(@"我先执行");
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"我 2 秒后执行");
    });
}

#pragma mark - GCD 定时器
- (void)dispatchTime {
    // 获得队列
    dispatch_queue_t queue = dispatch_get_main_queue();
    
    // 创建一个定时器(dispatch_source_t本质还是个OC对象)
    self.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    // GCD的时间参数一般是纳秒（1秒 == 10的9次方纳秒）
    dispatch_time_t start = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC));
    uint64_t interval = (uint64_t)(1.0 * NSEC_PER_SEC);
    dispatch_source_set_timer(self.timer, start, interval, 0);
    
    // 设置回调
    dispatch_source_set_event_handler(self.timer, ^{
        NSLog(@"------%@-------", [NSThread currentThread]);
    });
    
    // 启动定时器
    dispatch_resume(self.timer);
}

#pragma mark - GCD 线程间的通信
- (void)downloadImage {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    imageView.center = self.view.center;
    [self.view addSubview:imageView];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // 图片的网络路径
        NSURL *url = [NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1533750637718&di=95005b38780092651b451164ac0e4288&imgtype=0&src=http%3A%2F%2Fimg5.duitang.com%2Fuploads%2Fitem%2F201412%2F12%2F20141212185006_vcMns.jpeg"];
        // 加载图片
        NSData *data = [NSData dataWithContentsOfURL:url];
        // 生成图片
        UIImage *image = [UIImage imageWithData:data];
        // 回到主线程显示图片
        dispatch_async(dispatch_get_main_queue(), ^{
            imageView.image = image;
        });
    });
}

@end
