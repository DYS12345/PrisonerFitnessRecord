//
//  FuWochengViewController.m
//  PrisonerFitnessRecord
//
//  Created by 董永胜 on 2018/3/29.
//  Copyright © 2018年 董永胜. All rights reserved.
//

#import "FuWochengViewController.h"
#import "WCCycleScrollView.h"
#import "Masonry.h"

@interface FuWochengViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation FuWochengViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    WCCycleScrollView *cycleView = [WCCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 100, width, 200) delegate:self placeholderImage:[UIImage imageNamed:@""]];
    cycleView.imageURLStringGroup = @[@"zf1", @"zf2",@"zf3"];
    cycleView.isGif = NO;
    cycleView.titleGroup = @[@"跪姿俯卧撑",@"标准俯卧撑",@"窄距俯卧撑"];
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
