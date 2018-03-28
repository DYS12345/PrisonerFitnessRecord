 //
//  PaoMoZhouViewController.m
//  PrisonerFitnessRecord
//
//  Created by dong on 2018/3/28.
//  Copyright © 2018年 董永胜. All rights reserved.
//

#import "PaoMoZhouViewController.h"
#import "WCCycleScrollView.h"
#import "Masonry.h"

@interface PaoMoZhouViewController () <WCCycleScrollViewDelegate>

@end

@implementation PaoMoZhouViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    WCCycleScrollView *cycleView = [WCCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 100, width, 200) delegate:self placeholderImage:[UIImage imageNamed:@""]];
    cycleView.delegate = self;
    cycleView.imageURLStringGroup = @[@"p1",@"p2",@"p3",@"p4",@"p5",@"p6", @"p7"];
    cycleView.titleGroup = @[@"小腿后侧放松",@"大腿外侧放松",@"大腿前侧放松",@"大腿后侧放松", @"臀部放松",@"背阔肌放松", @"手臂放松"];
    [self.view addSubview:cycleView];
    [cycleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top).mas_offset(200);
        make.width.mas_equalTo(width);
        make.height.mas_equalTo(300);
    }];
}

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
