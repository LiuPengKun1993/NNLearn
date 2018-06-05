//
//  AppDelegate.h
//  NNSortDescriptor
//
//  Created by yizhilu on 2018/6/5.
//  Copyright © 2018年 LiuPengKun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

