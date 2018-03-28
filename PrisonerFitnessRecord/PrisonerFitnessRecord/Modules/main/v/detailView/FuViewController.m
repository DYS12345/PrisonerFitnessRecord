//
//  FuViewController.m
//  PrisonerFitnessRecord
//
//  Created by dong on 2018/3/28.
//  Copyright © 2018年 董永胜. All rights reserved.
//

#import "FuViewController.h"
#import "WCCycleScrollView.h"
#import "Masonry.h"

@interface FuViewController () <WCCycleScrollViewDelegate>

@end

@implementation FuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    WCCycleScrollView *cycleView = [WCCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 100, width, 200) delegate:self placeholderImage:[UIImage imageNamed:@""]];
    cycleView.delegate = self;
    cycleView.imageURLStringGroup = @[@"f1",@"f2",@"f3"];
    cycleView.titleGroup = @[@"卷腹",@"跑步式仰卧起坐",@"仰卧屈膝举腿"];
    [self.view addSubview:cycleView];
    [cycleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top).mas_offset(200);
        make.width.mas_equalTo(width);
        make.height.mas_equalTo(200);
    }];
}

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
