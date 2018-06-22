//
//  NNCoding.h
//  NNRuntimeTest
//
//  Created by liupengkun on 2018/6/22.
//  Copyright © 2018年 以梦为马. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+NNKeyValues.h"
#import "NNPerson.h"

@interface NNCoding : NSObject<NSCoding>

@property (nonatomic, strong) NNPerson *person;

@property (nonatomic, copy) NSString *coderID;
@property (nonatomic, copy) NSString *nickName;
@property (nonatomic, copy) NSString *phoneNumber;

@end
