//
//  ZReShenViewController.m
//  PrisonerFitnessRecord
//
//  Created by dong on 2018/3/28.
//  Copyright © 2018年 董永胜. All rights reserved.
//

#import "ZReShenViewController.h"
#import "WCCycleScrollView.h"
#import "Masonry.h"

@interface ZReShenViewController ()

@end

@implementation ZReShenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    WCCycleScrollView *cycleView = [WCCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 100, width, 200) delegate:self placeholderImage:[UIImage imageNamed:@""]];
    cycleView.imageURLStringGroup = @[@"k"];
    cycleView.isGif = YES;
    cycleView.titleGroup = @[@"开合跳"];
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
