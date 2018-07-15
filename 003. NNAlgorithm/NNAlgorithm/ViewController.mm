//
//  ViewController.m
//  NNAlgorithm
//
//  Created by liupengkun on 2018/7/13.
//  Copyright © 2018年 以梦为马. All rights reserved.
//

#import "ViewController.h"
#import "NNAlgorithm.hpp"
#import "NNAlgorithm.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // OC 调用 C++
    LiveClass::SendData(0);
    
    NNAlgorithm *algorithm = [[NNAlgorithm alloc] init];
    
    // 1-n 阶乘之和
    NSInteger factorialSum = [algorithm factorialWithNumber:10];
    NSLog(@"1-n 阶乘之和: factorialSum = %ld", factorialSum);
    
    // 青蛙跳台阶问题
    NSInteger jump = [algorithm jumpFloor:10];
    NSLog(@"青蛙跳台阶问题: jump = %ld", jump);
    
    // 青蛙变态跳台阶问题
    NSInteger jumpII = [algorithm jumpFloorII:4];
    NSLog(@"青蛙变态跳台阶问题: jumpII = %ld", jumpII);

    // 求1+2+3+...+n
    NSInteger solution = [algorithm sum_Solution:10];
    NSLog(@"1+2+3+...+n: solution = %ld", solution);
    
    // 不用加减乘除做加法
    NSInteger sum = [algorithm sumA:23 b:13];
    NSLog(@"不用加减乘除做加法: sum = %ld", sum);
    
    // 圆圈中最后剩下的数
    NSInteger lastSolution = [algorithm lastRemaining_Solution:10 m:23];
    NSLog(@"lastSolution = %ld", lastSolution);
    
    // 从 1 到 n 整数中 1 出现的次数
    NSInteger solution1 = [algorithm numberOf1Between1AndN:18];
    NSLog(@"solution1 = %ld", solution1);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
