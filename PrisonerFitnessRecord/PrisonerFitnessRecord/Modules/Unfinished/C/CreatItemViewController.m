//
//  CreatItemViewController.m
//  PrisonerFitnessRecord
//
//  Created by dong on 2017/11/16.
//  Copyright © 2017年 董永胜. All rights reserved.
//

#import "CreatItemViewController.h"
#import "NameTableViewCell.h"
#import "CategoryTableViewCell.h"
#import "CategorySelectViewController.h"

@interface CreatItemViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation CreatItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"新项目";
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"NameTableViewCell" bundle:nil] forCellReuseIdentifier:@"NameTableViewCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"CategoryTableViewCell" bundle:nil] forCellReuseIdentifier:@"CategoryTableViewCell"];
}

-(void)category:(UIButton *)sender{
    CategorySelectViewController *vc = [CategorySelectViewController new];
    
    CategoryTableViewCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
    vc.selectItemBlock = ^(NSString *s) {
        [cell.categoryBtn setTitle:s forState:UIControlStateNormal];
    };
    
    vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    vc.modalPresentationStyle = UIModalPresentationOverFullScreen;
    [self presentViewController:vc animated:YES completion:nil];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 100;
    } else if (indexPath.row == 1) {
        return 100;
    }
    return 80;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        NameTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NameTableViewCell"];
        return cell;
    } else if (indexPath.row == 1) {
        CategoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CategoryTableViewCell"];
        [cell.categoryBtn addTarget:self action:@selector(category:) forControlEvents:UIControlEventTouchUpInside];
        return cell;
    }
    NameTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NameTableViewCell"];
    return cell;
}

@end
