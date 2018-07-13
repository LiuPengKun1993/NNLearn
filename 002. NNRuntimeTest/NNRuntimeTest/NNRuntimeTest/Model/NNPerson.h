//
//  NNPerson.h
//  NNRuntimeTest
//
//  Created by liupengkun on 2018/6/21.
//  Copyright © 2018年 以梦为马. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NNPerson : NSObject

/** 姓名 **/
@property (nonatomic, copy) NSString *name;
/** 性别 **/
@property (nonatomic, copy) NSString *sex;

- (NSString *)coding;
- (NSString *)eating;
- (NSString *)changeMethod;
@end
