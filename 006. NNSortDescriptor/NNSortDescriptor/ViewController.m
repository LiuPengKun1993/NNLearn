//
//  ViewController.m
//  NNSortDescriptor
//
//  Created by yizhilu on 2018/6/5.
//  Copyright © 2018年 LiuPengKun. All rights reserved.
//

#import "ViewController.h"
#import "NNDevelopers.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // NSSortDescriptor 排序
    [self sortDescriptorTest];
    // NSSortDescriptor + NSSet 排序(过滤重复数据)
    [self setAndSortDescriptorTest];
}

/** NSSortDescriptor 排序 */
- (void)sortDescriptorTest {
    NSArray *namesArray = @[@"张", @"张", @"李", @"赵", @"杨", @"刘", @"白"];
    NSArray *idsArray = @[@"001", @"002", @"003", @"004", @"005", @"006", @"007"];
    NSArray *sexsArray = @[@"0", @"1", @"0", @"1", @"0", @"1", @"0"];
    NSArray *heightsArray = @[@"183", @"187", @"182", @"156", @"173", @"163", @"174"];
    NSArray *agesArray = @[@"23", @"24", @"19", @"18", @"45", @"34", @"32"];
    NSMutableArray *developersArray = [NSMutableArray array];
    [namesArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NNDevelopers *developer = [[NNDevelopers alloc] init];
        developer.name = namesArray[idx];
        developer.ID = [idsArray[idx] integerValue];
        developer.sex = [sexsArray[idx] boolValue];
        developer.height = [heightsArray[idx] doubleValue];
        developer.age = [agesArray[idx] integerValue];
        [developersArray addObject:developer];
    }];
    
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES selector:@selector(localizedStandardCompare:)];
    [developersArray sortUsingDescriptors:@[sort]];
    
    // 输出排序结果
    for (NNDevelopers *developer in developersArray) {
        NSLog(@"姓名:%@, ID:%ld, 性别:%@, 身高:%f, 年龄:%ld", developer.name, (long)developer.ID, developer.sex ? @"男" : @"女", developer.height, developer.age);
    }
}

/** NSSortDescriptor + NSSet 排序(过滤重复数据) */
- (void)setAndSortDescriptorTest {
    NSArray *arr = @[@"183", @"183", @"182", @"156", @"173", @"163", @"174"];
    NSSet *set = [NSSet setWithArray:arr];
    // 输出过滤结果
    NSLog(@"set = %@\n", set);

    NSArray *sort = @[[[NSSortDescriptor alloc] initWithKey:nil ascending:YES]];
    NSArray *sortArray = [set sortedArrayUsingDescriptors:sort];
    // 输出排序结果
    NSLog(@"sortSetArray = %@\n", sortArray);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
