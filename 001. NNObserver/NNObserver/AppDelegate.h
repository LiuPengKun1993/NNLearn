//
//  AppDelegate.h
//  NNObserver
//
//  Created by yizhilu on 2018/6/20.
//  Copyright © 2018年 LiuPengKun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

