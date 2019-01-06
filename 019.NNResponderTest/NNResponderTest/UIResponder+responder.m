//
//  UIResponder+responder.m
//  NNResponderTest
//
//  Created by 刘朋坤 on 2019/1/5.
//  Copyright © 2019 刘朋坤. All rights reserved.
//

#import "UIResponder+responder.h"

@implementation UIResponder (responder)

- (void)responderWithKey:(NSString *)key value:(id)value {
    [[self nextResponder] responderWithKey:key value:value];
}

@end
