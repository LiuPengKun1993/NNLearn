//
//  NNSeventhViewController.m
//  NNRuntimeTest
//
//  Created by liupengkun on 2018/6/21.
//  Copyright © 2018年 以梦为马. All rights reserved.
//

#import "NNSeventhViewController.h"
#import "NNCoding.h"

@interface NNSeventhViewController ()

@end

@implementation NNSeventhViewController

- (void)initView {
    [super initView];
    NNCoding *coding = [NNCoding new];
    coding.coderID = @"100";
    coding.nickName = @"以梦为马";
    coding.phoneNumber = @"110";
    
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
    path = [path stringByAppendingPathComponent:@"123"];
    [NSKeyedArchiver archiveRootObject:coding toFile:path];
    self.testLabelText = @"归档成功, 点击按钮取出模型中对应的值";
}

- (void)buttonClick:(UIButton *)sender {
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
    path = [path stringByAppendingPathComponent:@"123"];
    NNCoding *coding = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    if (sender.tag == 0) {
        self.testLabelText = coding.coderID;
    } else if (sender.tag == 1) {
        self.testLabelText = coding.nickName;
    } else {
        self.testLabelText = coding.phoneNumber;
    }
}

- (NSArray *)buttonTitleArray {
    return @[@"ID", @"昵称", @"手机号"];
}

@end
