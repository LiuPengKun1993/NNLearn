//
//  NNFourthViewController.m
//  NNRuntimeTest
//
//  Created by liupengkun on 2018/6/21.
//  Copyright © 2018年 以梦为马. All rights reserved.
//

#import "NNFourthViewController.h"
#import "NNPerson.h"

@interface NNFourthViewController ()

@property (nonatomic, strong) NNPerson *person;

@end

@implementation NNFourthViewController

- (void)initView {
    [super initView];
    _person = [NNPerson new];
    NSLog(@"%@",_person.coding);
    NSLog(@"%@",_person.eating);
    Method oriMethod = class_getInstanceMethod(_person.class, @selector(coding));
    Method curMethod = class_getInstanceMethod(_person.class, @selector(eating));
    method_exchangeImplementations(oriMethod, curMethod);
}

- (NSArray *)buttonTitleArray {
    return @[@"coding", @"eating"];
}

- (void)buttonClick:(UIButton *)sender {
    if (sender.tag == 0) {
        self.testLabelText = [_person coding];
    } else {
        self.testLabelText = [_person eating];
    }
}

@end
