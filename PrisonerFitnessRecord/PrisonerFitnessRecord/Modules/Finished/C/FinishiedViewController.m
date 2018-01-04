//
//  FinishiedViewController.m
//  PrisonerFitnessRecord
//
//  Created by 董永胜 on 2017/8/6.
//  Copyright © 2017年 董永胜. All rights reserved.
//

#import "FinishiedViewController.h"
#import "JiHuaHeaderView.h"
#import "FinishiedTableViewCell.h"

@interface FinishiedViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *modelAry;
@property (nonatomic, strong) NSArray *modelTitleAry;

@end

@implementation FinishiedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *oneAry = @[@"胸", @"背", @"手臂", @"腿", @"胸", @"背", @"肩", @"手臂", @"腿"];
    NSArray *twoAry = @[@"胸", @"背", @"肩", @"胸", @"背", @"手臂", @"肩"];
    NSArray *threeAry = @[@"胸", @"背", @"手臂", @"腿", @"胸", @"背", @"肩"];
    NSArray *fourAry = @[@"胸", @"背", @"手臂", @"腿", @"胸", @"背", @"肩", @"手臂"];
    NSArray *fiveAry = @[@"胸", @"背", @"肩", @"腿", @"胸", @"背", @"手臂"];
    
    self.modelAry = @[oneAry, twoAry, threeAry, fourAry, fiveAry];
    self.modelTitleAry = @[@"第一周", @"第二周", @"第三周", @"第四周", @"第五周"];
    
    [self.tableView registerClass:[FinishiedTableViewCell class] forCellReuseIdentifier:@"FinishiedTableViewCell"];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FinishiedTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FinishiedTableViewCell"];
    NSArray *ary = self.modelAry[indexPath.section];
    cell.modelAry = ary;
    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    JiHuaHeaderView *view = [[JiHuaHeaderView alloc] init];
    view.titleLabel.text = self.modelTitleAry[section];
    return view;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}

@end
