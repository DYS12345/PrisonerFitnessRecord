//
//  UnfinishiedViewController.m
//  PrisonerFitnessRecord
//
//  Created by 董永胜 on 2017/8/6.
//  Copyright © 2017年 董永胜. All rights reserved.
//

#import "UnfinishiedViewController.h"
#import "TrainingProgramTableViewCell.h"
#import "TrainingProgramModel.h"
#import "UIColor+Extension.h"
#import "SVProgressHUD.h"
#import "FinishedModel.h"

@interface UnfinishiedViewController () <UITableViewDelegate, UITableViewDataSource, TrainingProgramModelDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (strong, nonatomic) NSArray *modelAry;
@property (strong, nonatomic) TrainingProgramModel *trainingModel;

@end

@implementation UnfinishiedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIButton *editBtn = [[UIButton alloc] init];
    [editBtn setTitle:@"完成" forState:UIControlStateNormal];
    [editBtn addTarget:self action:@selector(edit) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *editButton = [[UIBarButtonItem alloc] initWithCustomView:editBtn];
    self.navigationItem.rightBarButtonItem = editButton;
    
    self.tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableview registerClass:[TrainingProgramTableViewCell class] forCellReuseIdentifier:@"TrainingProgramTableViewCell"];
    self.tableview.rowHeight = 80;
    
    self.trainingModel.delegate = self;
    [self.trainingModel getModel];
}

-(void)trainingProgramModel:(NSArray *)ary{
    self.modelAry = ary;
    [self.tableview reloadData];
}

-(TrainingProgramModel *)trainingModel{
    if (!_trainingModel) {
        _trainingModel = [TrainingProgramModel new];
    }
    return _trainingModel;
}

-(void)edit{
    
}

#pragma mark - 重写----设置有groupTableView有几个分区
-(NSInteger)numberOfSectionsInTableView:(UITableView*)tableView {
    return 6; //返回值是多少既有几个分区
}

#pragma mark - 重写----设置每个分区有几个单元格
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //分别设置每个分组上面显示的单元格个数
    TrainingProgramModel *model = self.modelAry[section];
    switch (section) {
        case0:
            return model.data.count;
            break;
        case1:
            return model.data.count;
            break;
        case2:
            return model.data.count;
            break;
        case3:
            return model.data.count;
            break;
        case4:
            return model.data.count;
            break;
        case5:
            return model.data.count;
            break;
        default:
            break;
    }
    return 10;
}

#pragma mark - 重写----设置每个分组单元格中显示的内容
-(UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TrainingProgramModel *model = self.modelAry[indexPath.section];
    TrainingProgramTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TrainingProgramTableViewCell"];
    cell.nameStr = model.data[indexPath.row];
    cell.addBtn.titleLabel.text = model.data[indexPath.row];
    cell.removeBtn.titleLabel.text = model.data[indexPath.row];
    [cell.addBtn addTarget:self action:@selector(addSection:) forControlEvents:(UIControlEventTouchUpInside)];
    [cell.removeBtn addTarget:self action:@selector(removeSection:) forControlEvents:(UIControlEventTouchUpInside)];
    [cell.editBtn addTarget:self action:@selector(editCount:) forControlEvents:(UIControlEventTouchUpInside)];
    return cell;
}

#pragma mark - 重写----设置标题和标注的高度
-(CGFloat)tableView:(UITableView*)tableView heightForHeaderInSection:(NSInteger)section {
    return 30.0f;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

#pragma mark - 重写----设置自定义的标题和标注
-(UIView*)tableView:(UITableView*)tableView viewForHeaderInSection:(NSInteger)section {
    TrainingProgramModel *model = self.modelAry[section];
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    headerLabel.font = [UIFont boldSystemFontOfSize:14.0f];
    headerLabel.backgroundColor = [UIColor colorWithHexString:@"#ff5a5f"];
    headerLabel.text = model.tip;
    headerLabel.textColor = [UIColor blackColor];
    return headerLabel;
}


-(void)addSection:(UIButton *)sender{
    NSArray *modelAry = [FinishedModel findAll];
    BOOL flag = NO;
    for (int i = 0; i < modelAry.count; i++) {
        FinishedModel *model = modelAry[i];
        if ([model.itemName isEqualToString:sender.titleLabel.text]) {
            flag = YES;
            model.sectionCount ++;
            [model saveOrUpdate];
            [SVProgressHUD showSuccessWithStatus:@"添加一组"];
        }
    }
    if (!flag) {
        FinishedModel *model = [[FinishedModel alloc] init];
        model.sectionCount ++;
        model.itemName = sender.titleLabel.text;
        [model saveOrUpdate];
        [SVProgressHUD showSuccessWithStatus:@"添加一组"];
    }
}

-(void)removeSection:(UIButton *)sender{
    NSArray *modelAry = [FinishedModel findAll];
    for (int i = 0; i < modelAry.count; i++) {
        FinishedModel *model = modelAry[i];
        if ([model.itemName isEqualToString:sender.titleLabel.text]) {
            if (model.sectionCount > 0) {
                model.sectionCount --;
                [model saveOrUpdate];
                [SVProgressHUD showSuccessWithStatus:@"减去一组"];
            } else {
                [SVProgressHUD showInfoWithStatus:@"已经为空了"];
            }
        } else {
            [SVProgressHUD showInfoWithStatus:@"已经为空了"];
        }
    }
}

-(void)editCount:(UIButton *)sender{
    
}

@end
