//
//  NNEighthViewController.m
//  NNRuntimeTest
//
//  Created by liupengkun on 2018/6/21.
//  Copyright © 2018年 以梦为马. All rights reserved.
//

#import "NNEighthViewController.h"
#import "NNCoding.h"

@interface NNEighthViewController ()

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation NNEighthViewController

- (void)initView {
    [super initView];
    NSDictionary *person = @{@"name":@"******",
                             @"sex": @"男"};
    NSDictionary *dict = @{@"coderID":@"100",
                           @"nickName": @"以梦为马",
                           @"phoneNumber": @"110",
                           @"person" : person};
    NSArray *addarr = @[dict ,dict, dict];
    NSMutableDictionary *mudict = [NSMutableDictionary dictionaryWithDictionary:dict];
    [mudict setObject:person forKey:@"person"];
    
    for (NSDictionary *item in addarr) {
        NNCoding *coding = [NNCoding modelWithDict:item];
        [self.dataArray addObject:coding];
    }
    if (self.dataArray.count) {
        self.testLabelText = @"字典转模型成功, 点击查看对应的值";
    }
}

- (void)buttonClick:(UIButton *)sender {
    NNCoding *coding = self.dataArray.firstObject;
    switch (sender.tag) {
        case 0:
            self.testLabelText = coding.coderID;
            break;
        case 1:
            self.testLabelText = coding.nickName;
            break;
        case 2:
            self.testLabelText = coding.phoneNumber;
            break;
        case 3:
            self.testLabelText = coding.person.name;
            break;
        case 4:
            self.testLabelText = coding.person.sex;
            break;
        default:
            break;
    }
}

- (NSArray *)buttonTitleArray {
    return @[@"ID", @"昵称", @"手机号", @"姓名", @"性别"];
}


- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

@end
