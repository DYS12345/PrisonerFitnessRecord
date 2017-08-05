//
//  BaseTarBarViewController.m
//  banmen
//
//  Created by dong on 2017/6/19.
//  Copyright © 2017年 banmen. All rights reserved.
//

#import "BaseTarBarViewController.h"
#import "UIColor+Extension.h"
#import "HomeViewController.h"
#import "PostersViewController.h"
#import "RepositoryViewController.h"
#import "UserViewController.h"
#import "BaseTarBar.h"
#import "BaseNavController.h"
#import "THNToolViewController.h"
#import "LogInViewController.h"
#import "UserModel.h"

@interface BaseTarBarViewController () <UITabBarControllerDelegate>

@end

@implementation BaseTarBarViewController

+ (BaseTarBarViewController *)sharedManager
{
    static BaseTarBarViewController *sharedAccountManagerInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedAccountManagerInstance = [[self alloc] init];
    });
    return sharedAccountManagerInstance;
}

+ (void)initialize
{
    // 通过appearance统一设置所有UITabBarItem的文字属性
    // 后面带有UI_APPEARANCE_SELECTOR的方法, 都可以通过appearance对象来统一设置
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrs[NSForegroundColorAttributeName] = [UIColor colorWithHexString:@"#666666"];
    
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = attrs[NSFontAttributeName];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor colorWithHexString:@"#ff5a5f"];
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 添加子控制器
    [self setupChildVc:[[HomeViewController alloc] init] title:@"首页" image:@"home" selectedImage:@"home_selected"];
    
    [self setupChildVc:[[RepositoryViewController alloc] init] title:@"产品库" image:@"library" selectedImage:@"library_selected"];
    
    [self setupChildVc:[[THNToolViewController alloc] init] title:@"工具" image:@"tool" selectedImage:@"tool_selected"];
    
    [self setupChildVc:[[UserViewController alloc] init] title:@"我的" image:@"main" selectedImage:@"main_selected"];
    
    // 更换tabBar
    [self setValue:[[BaseTarBar alloc] init] forKeyPath:@"tabBar"];
    self.delegate = self;
}

/**
 * 初始化子控制器
 */
- (void)setupChildVc:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 设置文字和图片
    vc.navigationItem.title = title;
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    
    // 包装一个导航控制器, 添加导航控制器为tabbarcontroller的子控制器
    BaseNavController *nav = [[BaseNavController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    if ([viewController.tabBarItem.title isEqualToString:@"我的"]) {
        UserModel *model = [[UserModel findAll] lastObject];
        if (model.isLogin) {
            return YES;
        } else {
            LogInViewController *vc = [[LogInViewController alloc] init];
            BaseNavController *naviVc = [[BaseNavController alloc] initWithRootViewController:vc];
            [self presentViewController:naviVc animated:YES completion:nil];
            return NO;
        }
    }else {
        return YES;
    }
}

@end
