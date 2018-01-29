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
#import "MJExtension.h"
#import "JiHuaModel.h"
#import "OtherMacro.h"
#import "UIColor+Extension.h"

@interface FinishiedViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *modelAry;
@property (nonatomic, strong) NSArray *modelTitleAry;
@property(nonatomic, strong) NSArray *JiHuaModelAry;

@end

@implementation FinishiedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *oneAry = @[@"胸", @"背", @"肩", @"腿", @"胸", @"背", @"手臂", @"腿"];
    NSArray *twoAry = @[@"胸", @"背", @"肩", @"腿", @"胸", @"背", @"手臂", @"腿"];
    
    self.modelAry = @[oneAry, twoAry];
    self.modelTitleAry = @[@"第一周", @"第二周"];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"FinishiedTableViewCell" bundle:nil] forCellReuseIdentifier:@"FinishiedTableViewCell"];
    
    NSArray *ary = @[@{@"zhou":@"0", @"days":@[@"0",@"0",@"0",@"0",@"0",@"0",@"0", @"0"]},
                     @{@"zhou":@"0", @"days":@[@"0",@"0",@"0",@"0",@"0",@"0",@"0", @"0"]}];
    
//    NSArray *ary1 = [JiHuaModel findAll];
//    if (ary1.count == 0) {
//        self.JiHuaModelAry = [JiHuaModel mj_objectArrayWithKeyValuesArray:ary];
//        for (JiHuaModel *model in self.JiHuaModelAry) {
//            [model save];
//        }
//    } else {
//        self.JiHuaModelAry = ary1;
//    }
    self.JiHuaModelAry = [JiHuaModel mj_objectArrayWithKeyValuesArray:ary];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(InfoNotificationAction:) name:@"InfoNotification" object:nil];
}

- (void)InfoNotificationAction:(NSNotification *)notification{
    NSString *str = notification.userInfo[@"num"];
    NSInteger n = [str integerValue];
    JiHuaModel *model = self.JiHuaModelAry[n];
    model.zhou = @"1";
    [self.tableView reloadData];
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"InfoNotification" object:nil];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FinishiedTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FinishiedTableViewCell"];
    NSArray *ary = self.modelAry[indexPath.section];
    cell.modelAry = ary;
    cell.vc = self;
    cell.numFlag = indexPath.section;
    cell.jiHuaModel = self.JiHuaModelAry[indexPath.section];
    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    JiHuaHeaderView *view = [[JiHuaHeaderView alloc] init];
    view.titleLabel.text = self.modelTitleAry[section];
    
    JiHuaModel *model = self.JiHuaModelAry[section];
    if ([model.zhou isEqualToString:@"0"]) {
        view.titleLabel.textColor = [UIColor colorWithHexString:BLUE_COLOR];
    } else {
        view.titleLabel.textColor = [UIColor colorWithHexString:PURPLE_COLOR];
    }
    
    return view;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}

@end
