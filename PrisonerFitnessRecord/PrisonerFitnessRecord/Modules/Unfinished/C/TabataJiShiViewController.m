//
//  TabataJiShiViewController.m
//  PrisonerFitnessRecord
//
//  Created by dong on 2018/1/15.
//  Copyright © 2018年 董永胜. All rights reserved.
//

#import "TabataJiShiViewController.h"
#import "ZRMultipleWaveLoadingView.h"
#import "Masonry.h"

@interface TabataJiShiViewController ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation TabataJiShiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ZRMultipleWaveLoadingView *loadingView = [[ZRMultipleWaveLoadingView alloc]init];
    loadingView.progress = 1;
    [self.view addSubview:loadingView];
    [loadingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX).mas_offset(0);
        make.top.mas_equalTo(self.view.mas_top).mas_offset(280);
        make.width.mas_equalTo(150);
        make.height.mas_equalTo(150);
    }];
    
    NSArray *titleAry = @[@"高抬腿", @"波比跳", @"箭步蹲跳", @"登山"];
    
    self.titleLabel.text = titleAry[0];
}

@end
