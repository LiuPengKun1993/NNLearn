//
//  NNDevelopers.h
//  NNSortDescriptor
//
//  Created by yizhilu on 2018/6/5.
//  Copyright © 2018年 LiuPengKun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NNDevelopers : NSObject

/** ID */
@property (nonatomic, assign) NSInteger ID;
/** 姓名 */
@property (nonatomic, copy) NSString *name;
/** 性别 */
@property (nonatomic, assign) BOOL sex;
/** 身高 */
@property (nonatomic, assign) double height;
/** 年龄 */
@property (nonatomic, assign) NSInteger age;

@end
