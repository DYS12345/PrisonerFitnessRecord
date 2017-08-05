//
//  BaseNavController.m
//  banmen
//
//  Created by dong on 2017/6/19.
//  Copyright © 2017年 banmen. All rights reserved.
//

#import "BaseNavController.h"

@interface BaseNavController () <UIGestureRecognizerDelegate>

@end

@implementation BaseNavController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.interactivePopGestureRecognizer.enabled = NO;
//    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self.interactivePopGestureRecognizer.delegate action:@selector(handleNavigationTransition:)];
    
//    pan.delegate = self;
    
//    [self.view addGestureRecognizer:pan];
}

+(void)initialize{
    UINavigationBar *bar = [UINavigationBar appearance];
    bar.translucent = NO;
}

#pragma mark - 手势代理方法
// 是否开始触发手势
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    // 判断下当前控制器是否是跟控制器
    
    return (self.topViewController != [self.viewControllers firstObject]);
}

/**
 * 可以在这个方法中拦截所有push进来的控制器
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count > 0) { // 如果push进来的不是第一个控制器
        self.backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        //        [button setTitle:@"返回" forState:UIControlStateNormal];
        [self.backBtn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        //        [button setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
        //        button.size = CGSizeMake(70, 30);
        // 让按钮内部的所有内容左对齐
        //        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [self.backBtn sizeToFit];
        // 让按钮的内容往左边偏移10
        //        button.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
        //        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        //        [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [self.backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        
        // 修改导航栏左边的item
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.backBtn];
        
        // 隐藏tabbar
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    // 这句super的push要放在后面, 让viewController可以覆盖上面设置的leftBarButtonItem
    [super pushViewController:viewController animated:animated];
    
}

-(UIViewController *)popViewControllerAnimated:(BOOL)animated{
    return [super popViewControllerAnimated:animated];
}

- (void)back
{
    [self popViewControllerAnimated:YES];
}

@end
