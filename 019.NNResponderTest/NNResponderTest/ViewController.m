//
//  ViewController.m
//  NNResponderTest
//
//  Created by 刘朋坤 on 2019/1/5.
//  Copyright © 2019 刘朋坤. All rights reserved.
//

#import "ViewController.h"
#import "NNTableView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NNTableView *tableView = [[NNTableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    [self.view addSubview:tableView];
}

#pragma mark - 通过 UIResponder 传递事件
- (void)responderWithKey:(NSString *)key value:(id)value {
    NSLog(@"%@", value);
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"UIResponder 传递事件" message:value preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"我知道了" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
}


@end
