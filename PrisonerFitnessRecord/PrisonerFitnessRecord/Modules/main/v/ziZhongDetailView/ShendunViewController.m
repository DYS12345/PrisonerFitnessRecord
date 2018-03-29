//
//  ShendunViewController.m
//  PrisonerFitnessRecord
//
//  Created by 董永胜 on 2018/3/29.
//  Copyright © 2018年 董永胜. All rights reserved.
//

#import "ShendunViewController.h"
#import "WCCycleScrollView.h"
#import "Masonry.h"

@interface ShendunViewController ()

@end

@implementation ShendunViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    WCCycleScrollView *cycleView = [WCCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 100, width, 200) delegate:self placeholderImage:[UIImage imageNamed:@""]];
    cycleView.imageURLStringGroup = @[@"zs1", @"zs2",@"zs3"];
    cycleView.isGif = NO;
    cycleView.titleGroup = @[@"标准深蹲",@"窄距深蹲",@"偏重深蹲"];
    [self.view addSubview:cycleView];
    [cycleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top).mas_offset(85);
        make.width.mas_equalTo(width);
        make.height.mas_equalTo(500);
    }];
}

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
