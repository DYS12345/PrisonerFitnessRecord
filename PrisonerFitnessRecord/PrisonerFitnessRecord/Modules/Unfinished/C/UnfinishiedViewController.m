//
//  UnfinishiedViewController.m
//  PrisonerFitnessRecord
//
//  Created by 董永胜 on 2017/8/6.
//  Copyright © 2017年 董永胜. All rights reserved.
//

#import "UnfinishiedViewController.h"
#import "TrainingProgramTableViewCell.h"

@interface UnfinishiedViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (strong, nonatomic) NSArray *modelAry;

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
    self.tableview.rowHeight = 50;
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Model" ofType:@"plist"];
    self.modelAry = [NSArray arrayWithContentsOfFile:path];
    [self.tableview reloadData];
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
    switch (section) {
        case0:
            return 10;
            break;
        case1:
            return 2;
            break;
        case2:
            return 5;
            break;
        case3:
            return 10;
            break;
        case4:
            return 10;
            break;
        case5:
            return 10;
            break;
        default:
            break;
    }
    return 10;
}

#pragma mark - 重写----设置每个分组单元格中显示的内容
-(UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TrainingProgramTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TrainingProgramTableViewCell"];
    return cell;
}

#pragma mark - 重写----设置标题和标注的高度
-(CGFloat)tableView:(UITableView*)tableView heightForHeaderInSection:(NSInteger)section {
    return 30.0f;
}

#pragma mark - 重写----设置自定义的标题和标注
-(UIView*)tableView:(UITableView*)tableView viewForHeaderInSection:(NSInteger)section {
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    headerLabel.font = [UIFont boldSystemFontOfSize:18.0f];
    headerLabel.backgroundColor = [UIColor clearColor];
    headerLabel.text = @"  我是标题";
    headerLabel.textColor = [UIColor blackColor];
    return headerLabel;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
