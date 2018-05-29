//
//  ViewController.m
//  NNLayerTest
//
//  Created by yizhilu on 2018/5/29.
//  Copyright © 2018年 LiuPengKun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatView];
    [self creatImage];
}

/** 用 CALayer 代替 UIView */
- (void)creatView {
    CALayer *layer = [[CALayer alloc] init];
    layer.frame = CGRectMake(100, 100, 50, 50);
    layer.backgroundColor = [UIColor blueColor].CGColor;
    [self.view.layer addSublayer:layer];
}

/** 用 CALayer 代替 UIImageView */
- (void)creatImage {
    CALayer *layer = [[CALayer alloc] init];
    layer.frame = CGRectMake(100, 200, 50, 50);
    UIImage *image = [UIImage imageNamed:@"header"];
    layer.contents = CFBridgingRelease(image.CGImage);
    [self.view.layer addSublayer:layer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
