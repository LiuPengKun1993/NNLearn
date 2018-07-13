//
//  ViewController.m
//  NNAlgorithm
//
//  Created by liupengkun on 2018/7/13.
//  Copyright © 2018年 以梦为马. All rights reserved.
//

#import "ViewController.h"
#import "NNAlgorithm.hpp"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // OC 调用 C++
//    LiveClass::SendData(0);
    
    /**
     1-n 阶乘之和
     */
    
    // 1-n 阶乘之和
    [self factorialWithNumber:10];
}

/** 1-n 阶乘之和 */
- (void)factorialWithNumber:(NSInteger)number {
    
    //总和
    NSInteger sum = 0;
    
    //阶乘值，初始化为1
    NSInteger factorial = 1;
    
    for (NSInteger i = 1; i <= number; i++) {
        factorial = factorial * i;
        sum = (int) (sum + factorial);
    }
    
    NSLog(@"1-%ld 阶乘之和-------%ld", number, sum);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
