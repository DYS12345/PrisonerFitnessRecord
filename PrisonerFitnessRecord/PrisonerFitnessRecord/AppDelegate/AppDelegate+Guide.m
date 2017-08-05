//
//  AppDelegate+Guide.m
//  banmen
//
//  Created by dong on 2017/6/19.
//  Copyright © 2017年 banmen. All rights reserved.
//

#import "AppDelegate+Guide.h"
#import "BaseTarBarViewController.h"

@implementation AppDelegate (Guide)

-(void)windowShow{
    // 创建窗口
    self.window = [[UIWindow alloc] init];
    self.window.frame = [UIScreen mainScreen].bounds;
    NSString *key = @"CFBundleShortVersionString";
    
    // 获得当前软件的版本号
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[key];
    // 获得沙盒中存储的版本号
    NSString *sanboxVersion = [[NSUserDefaults standardUserDefaults] stringForKey:key];
    
    NSArray *arr = [NSArray arrayWithObjects:@"guide_one",@"guide_two",@"guide_three", nil];
    
    //    if (![currentVersion isEqualToString:sanboxVersion]) {
    //
    //        self.window.rootViewController = [[GuidePageViewController alloc] initWithPicArr:arr andRootVC:[[FSTabBarController alloc] init]];
    //
    //        // 存储版本号
    //        [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:key];
    //        [[NSUserDefaults standardUserDefaults] synchronize];
    //    }else{
    self.window.rootViewController = [BaseTarBarViewController sharedManager];
    //    }
    [self.window makeKeyAndVisible];
}

@end
