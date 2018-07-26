//
//  ViewController.m
//  NNLoad
//
//  Created by 刘朋坤 on 2018/7/26.
//  Copyright © 2018年 刘朋坤. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

+ (void)load {
    NSLog(@"父类：%@", NSStringFromClass([self class]));
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
