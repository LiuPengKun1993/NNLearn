//
//  NNSubViewController.m
//  NNLoad
//
//  Created by 刘朋坤 on 2018/7/26.
//  Copyright © 2018年 刘朋坤. All rights reserved.
//

#import "NNSubViewController.h"

@interface NNSubViewController ()

@end

@implementation NNSubViewController

+ (void)load {
    NSLog(@"子类：%@", NSStringFromClass([self class]));
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
