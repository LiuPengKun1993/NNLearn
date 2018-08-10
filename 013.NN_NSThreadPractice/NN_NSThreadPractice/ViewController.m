//
//  ViewController.m
//  NN_NSThreadPractice
//
//  Created by 刘朋坤 on 2018/8/10.
//  Copyright © 2018年 刘朋坤. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
/*********************** 创建线程 ********************/
    // 动态方法
//    [self creatThread1];
    
    // 静态方法
//    [self creatThread2];
    
    // 隐式创建线程
//    [self creatThread3];
    
/*********************** 线程之间的通信 ********************/

    [self downloadImageOnSubThread];
}

#pragma mark - 创建线程
/** 动态方法 */
- (void)creatThread1 {
    // 初始化线程
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(run)object:nil];
    // 线程名字
    thread.name = @"MYThread";
    // 启动线程
    [thread start];
}

- (void)run {
    NSLog(@"---%@---", [NSThread currentThread]);
}

/** 静态方法 */
- (void)creatThread2 {
    [NSThread detachNewThreadSelector:@selector(run) toTarget:self withObject:nil];
}

/** 隐式创建线程 */
- (void)creatThread3 {
    [self performSelectorInBackground:@selector(run) withObject:nil];
}

#pragma mark - 线程之间的通信
/** 创建一个线程下载图片 */
- (void)downloadImageOnSubThread {
    /**
     // 在主线程上执行操作
     [self performSelectorOnMainThread:@selector(run) withObject:nil waitUntilDone:YES];
     // 在当前线程执行操作
     [self performSelector:@selector(run) withObject:nil];
     // 在指定线程上执行操作
     [self performSelector:@selector(run) onThread:thread withObject:nil waitUntilDone:YES];
     */
    NSLog(@"1 -- %@ --", [NSThread currentThread]);
    // 在创建的子线程中调用 downloadImage 下载图片
    [NSThread detachNewThreadSelector:@selector(downloadImage) toTarget:self withObject:nil];
}

/** 下载图片，下载完之后回到主线程进行 UI 刷新 */
- (void)downloadImage {
    NSLog(@"2 -- %@ --", [NSThread currentThread]);

    NSURL *imageUrl = [NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1533750637718&di=95005b38780092651b451164ac0e4288&imgtype=0&src=http%3A%2F%2Fimg5.duitang.com%2Fuploads%2Fitem%2F201412%2F12%2F20141212185006_vcMns.jpeg"];

    NSData *imageData = [NSData dataWithContentsOfURL:imageUrl];
    UIImage *image = [UIImage imageWithData:imageData];
    
    // 回到主线程进行图片赋值和界面刷新
    [self performSelectorOnMainThread:@selector(refreshOnMainThread:) withObject:image waitUntilDone:YES];
}

/** 回到主线程进行图片赋值和界面刷新 */
- (void)refreshOnMainThread:(UIImage *)image {
    
    NSLog(@"3 -- %@ --", [NSThread currentThread]);
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    imageView.center = self.view.center;
    [self.view addSubview:imageView];
    imageView.image = image;
}

#pragma mark - 一些方法
- (void)someMethods {
/**
    // 获得主线程
    + (NSThread *)mainThread;
    
    // 判断是否为主线程
    - (BOOL)isMainThread;
    + (BOOL)isMainThread;
 
    // 获得当前线程
    NSThread *current = [NSThread currentThread];
    
    // 线程的名字
    - (void)setName:(NSString *)name;
    - (NSString *)name;
 
    // 线程进入就绪状态 -> 运行状态
    - (void)start;
 
    // 睡眠，相当于暂停
    + (void)sleepUntilDate:(NSDate *)date;
    + (void)sleepForTimeInterval:(NSTimeInterval)ti;
 
    // 线程销毁
    + (void)exit;
*/
}

@end
