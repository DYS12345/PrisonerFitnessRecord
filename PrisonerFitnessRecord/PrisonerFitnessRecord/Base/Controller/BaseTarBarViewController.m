//
//  BaseTarBarViewController.m
//  banmen
//
//  Created by dong on 2017/6/19.
//  Copyright © 2017年 banmen. All rights reserved.
//

#import "BaseTarBarViewController.h"
#import "UIColor+Extension.h"
#import "UnfinishiedViewController.h"
#import "FinishiedViewController.h"
#import "BaseTarBar.h"
#import "BaseNavController.h"
#import "UserModel.h"
#import "OtherMacro.h"
#import "InstructionsViewController.h"

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
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor colorWithHexString:BLUE_COLOR];
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 添加子控制器
    [self setupChildVc:[[UnfinishiedViewController alloc] init] title:@"目标集" image:@"home" selectedImage:@"homeSelected"];
    
    [self setupChildVc:[[InstructionsViewController alloc] init] title:@"说明" image:@"finished" selectedImage:@"finishedSelected"];
    
    [self setupChildVc:[[FinishiedViewController alloc] init] title:@"档案" image:@"finished" selectedImage:@"finishedSelected"];
    
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
    return YES;
}

@end
