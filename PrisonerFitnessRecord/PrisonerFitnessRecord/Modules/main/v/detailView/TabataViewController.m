//
//  TabataViewController.m
//  PrisonerFitnessRecord
//
//  Created by dong on 2018/3/28.
//  Copyright © 2018年 董永胜. All rights reserved.
//

#import "TabataViewController.h"
#import "UIImage+GIF.h"
#import "OtherMacro.h"
#import "UIView+FSExtension.h"
#import "WCCycleScrollView.h"
#import "Masonry.h"

@interface TabataViewController () <WCCycleScrollViewDelegate>


@end

@implementation TabataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    WCCycleScrollView *cycleView = [WCCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 100, width, 200) delegate:self placeholderImage:[UIImage imageNamed:@""]];
    cycleView.delegate = self;
    cycleView.imageURLStringGroup = @[@"g",@"b",@"j",@"d"];
    cycleView.titleGroup = @[@"高抬腿",@"波比跳",@"箭步蹲跳",@"登山跑"];
    [self.view addSubview:cycleView];
    [cycleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top).mas_offset(200);
        make.width.mas_equalTo(width);
        make.height.mas_equalTo(200);
    }];
}

- (void)cycleScrollView:(WCCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"%ld",(long)index);
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor brownColor];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
