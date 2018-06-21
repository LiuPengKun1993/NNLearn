//
//  NNThirdViewController.m
//  NNRuntimeTest
//
//  Created by liupengkun on 2018/6/21.
//  Copyright © 2018年 以梦为马. All rights reserved.
//

#import "NNThirdViewController.h"
#import "NNPerson.h"

@interface NNThirdViewController ()

@property (nonatomic, strong) NNPerson *person;

@end

@implementation NNThirdViewController

- (void)initView {
    [super initView];
    _person = [NNPerson new];
}

- (void)buttonClick:(UIButton *)sender {
    /*
     动态添加 coding 方法
     (IMP)codingOC 意思是 codingOC 的地址指针;
     "v@:" 意思是，v 代表无返回值 void，如果是 i 则代表 int；@代表 id sel; : 代表 SEL _cmd;
     “v@:@@” 意思是，两个参数的没有返回值。
     */
    class_addMethod([_person class], @selector(coding), (IMP)codingOC, "v@:");
    // 调用 coding 方法响应事件
    if ([_person respondsToSelector:@selector(coding)]) {
        [_person performSelector:@selector(coding)];
        self.testLabelText = @"添加方法成功";
    } else {
        self.testLabelText = @"添加方法失败";
    }
}

// 编写 codingOC 的实现
void codingOC(id self,SEL _cmd) {
    NSLog(@"添加方法成功");
}

@end
