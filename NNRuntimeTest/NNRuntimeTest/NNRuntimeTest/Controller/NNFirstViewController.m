//
//  NNFirstViewController.m
//  NNRuntimeTest
//
//  Created by liupengkun on 2018/6/21.
//  Copyright © 2018年 以梦为马. All rights reserved.
//

#import "NNFirstViewController.h"
#import "NNPerson.h"

@interface NNFirstViewController ()

@property (nonatomic, strong) NNPerson *person;

@end

@implementation NNFirstViewController

- (void)initView {
    [super initView];
    _person = [NNPerson new];
}

- (void)buttonClick:(UIButton *)sender {
    unsigned int count = 0;
    // 动态获取类中的所有属性(包括私有)
    Ivar *ivar = class_copyIvarList(_person.class, &count);
    // 遍历属性找到对应字段
    for (int i = 0; i < count; i ++) {
        Ivar tempIvar = ivar[i];
        const char *varChar = ivar_getName(tempIvar);
        NSString *varString = [NSString stringWithUTF8String:varChar];
        if ([varString isEqualToString:@"_name"]) {
            // 修改对应的字段值
            object_setIvar(_person, tempIvar, @"更改属性值成功");
            break;
        }
    }
    self.testLabelText = _person.name.length ? _person.name : @"更改属性值失败";
}

@end
