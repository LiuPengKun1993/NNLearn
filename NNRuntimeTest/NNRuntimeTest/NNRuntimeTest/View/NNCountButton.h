//
//  NNCountButton.h
//  NNRuntimeTest
//
//  Created by liupengkun on 2018/6/21.
//  Copyright © 2018年 以梦为马. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NNCountButton : UIButton

@property (nonatomic, assign) NSInteger count;

@end


@interface NNClickCount : NSObject

+ (instancetype)sharedInstance;

- (NSInteger)clickCount;

@end
