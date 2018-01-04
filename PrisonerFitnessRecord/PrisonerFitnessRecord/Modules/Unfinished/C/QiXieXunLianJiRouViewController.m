//
//  QiXieXunLianJiRouViewController.m
//  PrisonerFitnessRecord
//
//  Created by dong on 2018/1/4.
//  Copyright © 2018年 董永胜. All rights reserved.
//

#import "QiXieXunLianJiRouViewController.h"
#import "UIColor+Extension.h"
#import "SVProgressHUD.h"
#import "CreatItemViewController.h"
#import "TargetMuscleTableViewCell.h"
#import "ActionShowViewController.h"
#import "QiuTuActionShowViewController.h"

@interface QiXieXunLianJiRouViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *modelAry;

@end

@implementation QiXieXunLianJiRouViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *qiXieAry = @[@"胸肌", @"背部", @"肩膀", @"肱二头肌", @"肱三头肌", @"腿部"];
    
    NSArray *qiuTuAry = @[@"胸和三头", @"升降机般的大腿", @"背和二头", @"腹", @"严阵以待的脊柱", @"肩膀"];
    
    NSArray *ziZhongAry = @[@"胸和三头", @"升降机般的大腿", @"背和二头", @"腹", @"严阵以待的脊柱", @"肩膀"];
    
    NSArray *jiRouLaShenAry = @[@"胸和三头", @"升降机般的大腿", @"背和二头", @"腹", @"严阵以待的脊柱", @"肩膀"];
    
    NSArray *paoMoZhouFangSongAry = @[@"胸和三头", @"升降机般的大腿", @"背和二头", @"腹", @"严阵以待的脊柱", @"肩膀"];
    
    self.modelAry = @[qiXieAry, qiuTuAry, ziZhongAry, jiRouLaShenAry, paoMoZhouFangSongAry];
    [self.tableView registerClass:[TargetMuscleTableViewCell class] forCellReuseIdentifier:@"TargetMuscleTableViewCell"];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TargetMuscleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TargetMuscleTableViewCell"];
    NSArray *ary = self.modelAry[self.numFlag];
    cell.textLabel.text = ary[indexPath.item];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *ary = self.modelAry[self.numFlag];
    return ary.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.numFlag == 0) {
        ActionShowViewController *vc = [ActionShowViewController new];
        vc.numFlag = indexPath.item;
        [self.navigationController pushViewController:vc animated:YES];
    } else if (self.numFlag == 1) {
        QiuTuActionShowViewController *vc = [QiuTuActionShowViewController new];
        vc.numFlag = indexPath.item;
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
