//
//  NNFifthViewController.m
//  NNRuntimeTest
//
//  Created by liupengkun on 2018/6/21.
//  Copyright © 2018年 以梦为马. All rights reserved.
//

#import "NNFifthViewController.h"
#import "NNPerson.h"
#import "NNLibrary.h"

@interface NNFifthViewController ()

@property (nonatomic, strong) NNPerson *person;

@property (nonatomic, strong) NNLibrary *library;

@end

@implementation NNFifthViewController

- (void)initView {
    [super initView];
    _person = [NNPerson new];
    _library = [NNLibrary new];
    self.testLabelText = [_library libraryMethod];
    Method oriMethod = class_getInstanceMethod(_person.class, @selector(changeMethod));
    Method curMethod = class_getInstanceMethod(_library.class, @selector(libraryMethod));
    method_exchangeImplementations(oriMethod, curMethod);
}

- (void)buttonClick:(UIButton *)sender {
    self.testLabelText = [_library libraryMethod];
}

@end
