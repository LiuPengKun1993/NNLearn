//
//  NNViewController.m
//  NNSwiftOCProgram
//
//  Created by 刘朋坤 on 2019/1/7.
//  Copyright © 2019 刘朋坤. All rights reserved.
//

#import "NNViewController.h"
#import "NNSwiftOCProgram-Swift.h"

@interface NNViewController ()<NNViewProtocol>

@end

@implementation NNViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    self.navigationItem.title = @"OC 调用 Swift";
    NNView *nnView = [[NNView alloc] initWithFrame:CGRectMake(200, 200, 100, 100)];
    [self.view addSubview:nnView];
    nnView.delegate = self;
}

- (void)clickAction {
    ViewController *controller = [[ViewController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}


@end
