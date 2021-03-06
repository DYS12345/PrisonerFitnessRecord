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
#import "ZiZhongViewController.h"
#import "FullStretchViewController.h"

@interface QiXieXunLianJiRouViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *modelAry;

@end

@implementation QiXieXunLianJiRouViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *qiXieAry = @[@"胸肌", @"背部", @"肩膀", @"肱二头肌", @"肱三头肌", @"腿部"];
    
    NSArray *qiuTuAry = @[@"胸和三头", @"升降机般的大腿", @"背和二头", @"腹", @"严阵以待的脊柱", @"肩膀"];
    
    NSArray *ziZhongAry = @[@"当下流行的无器械健身套路", @"升降机般的大腿", @"背和二头", @"腹", @"严阵以待的脊柱", @"肩膀"];
    
    NSArray *jiRouLaShenAry = @[@"全面拉伸", @"腿部拉伸"];
    
    NSArray *paoMoZhouFangSongAry = @[@"胸和三头", @"升降机般的大腿", @"背和二头", @"腹", @"严阵以待的脊柱", @"肩膀"];
    
    self.modelAry = @[qiXieAry, qiuTuAry, ziZhongAry, jiRouLaShenAry, paoMoZhouFangSongAry];
    [self.tableView registerClass:[TargetMuscleTableViewCell class] forCellReuseIdentifier:@"TargetMuscleTableViewCell"];
}

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
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
    } else if (self.numFlag == 2) {
        ZiZhongViewController *vc = [ZiZhongViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    } else if (self.numFlag == 3) {
        if (indexPath.row == 0) {
            FullStretchViewController *vc = [FullStretchViewController new];
            [self.navigationController pushViewController:vc animated:YES];
        } else if (indexPath.row == 1) {
            
        }
    }
}

@end
