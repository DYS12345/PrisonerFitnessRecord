//
//  UnfinishiedViewController.m
//  PrisonerFitnessRecord
//
//  Created by 董永胜 on 2017/8/6.
//  Copyright © 2017年 董永胜. All rights reserved.
//

#import "UnfinishiedViewController.h"
#import "UIColor+Extension.h"
#import "SVProgressHUD.h"
#import "CreatItemViewController.h"
#import "TargetMuscleTableViewCell.h"
#import "ActionShowViewController.h"
#import "QiXieXunLianJiRouViewController.h"
#import "ReLiangDuiZhaoViewController.h"
#import "TabataJiShiViewController.h"
#import "ZiZhongViewController.h"
#import "QiuTuZiZhongViewController.h"

@interface UnfinishiedViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (strong, nonatomic) NSArray *modelAry;

@end

@implementation UnfinishiedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIButton *addBtn = [[UIButton alloc] init];
    [addBtn setImage:[UIImage imageNamed:@"add"] forState:UIControlStateNormal];
    [addBtn addTarget:self action:@selector(add) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *addBtnItem = [[UIBarButtonItem alloc] initWithCustomView:addBtn];
    self.navigationItem.rightBarButtonItem = addBtnItem;
    
    UIButton *menuBtn = [[UIButton alloc] init];
    [menuBtn setImage:[UIImage imageNamed:@"menu"] forState:UIControlStateNormal];
    [menuBtn addTarget:self action:@selector(menu) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *menuBtnItem = [[UIBarButtonItem alloc] initWithCustomView:menuBtn];
    self.navigationItem.leftBarButtonItem = menuBtnItem;
    
    self.modelAry = @[@"器械训练肌肉训练", @"囚徒自重训练", @"自重训练动作", @"肌肉拉伸", @"泡沫轴放松肌肉", @"对照食物查看热量", @"tabata计时"];
    
    [self.tableview registerClass:[TargetMuscleTableViewCell class] forCellReuseIdentifier:@"TargetMuscleTableViewCell"];
}

-(void)add{
    CreatItemViewController *vc = [CreatItemViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)menu{
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TargetMuscleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TargetMuscleTableViewCell"];
    cell.textLabel.text = self.modelAry[indexPath.item];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.modelAry.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 5) {
        ReLiangDuiZhaoViewController *vc = [ReLiangDuiZhaoViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    } else if (indexPath.row == 6) {
        TabataJiShiViewController *vc = [TabataJiShiViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    } else if (indexPath.row == 1) {
        QiuTuZiZhongViewController *vc = [QiuTuZiZhongViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    } else {
        QiXieXunLianJiRouViewController *vc = [QiXieXunLianJiRouViewController new];
        vc.numFlag = indexPath.item;
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
