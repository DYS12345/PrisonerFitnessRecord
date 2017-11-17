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
#import "DifficultyCoefficienTableViewCell.h"
#import "DifficultyCoefficienViewController.h"
#import "DateTableViewCell.h"
#import "DateSelectViewController.h"
#import "SVProgressHUD.h"

@interface CreatItemViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) UIBarButtonItem *doneBtnItem;

@end

@implementation CreatItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"新项目";
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"NameTableViewCell" bundle:nil] forCellReuseIdentifier:@"NameTableViewCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"CategoryTableViewCell" bundle:nil] forCellReuseIdentifier:@"CategoryTableViewCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"DifficultyCoefficienTableViewCell" bundle:nil] forCellReuseIdentifier:@"DifficultyCoefficienTableViewCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"DateTableViewCell" bundle:nil] forCellReuseIdentifier:@"DateTableViewCell"];
    
    UIButton *doneBtn = [[UIButton alloc] init];
    [doneBtn setTitle:@"完成" forState:(UIControlStateNormal)];
    [doneBtn addTarget:self action:@selector(done:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *doneBtnItem = [[UIBarButtonItem alloc] initWithCustomView:doneBtn];
    self.doneBtnItem = doneBtnItem;
    self.navigationItem.rightBarButtonItem = doneBtnItem;
}

-(void)done:(UIButton *)sender{
    NameTableViewCell *oneCell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    CategoryTableViewCell *twoCell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
    DifficultyCoefficienTableViewCell *threeCell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:2 inSection:0]];
    if (oneCell.itemNameTF.text.length == 0) {
        [SVProgressHUD showInfoWithStatus:@"请填写项目名称"];
    } else {
        if (twoCell.categoryBtn.tag == 0) {
            //看一本书
            switch (threeCell.difficultyNumSelectBtn.tag*10) {
                case 2:
                {
                    //50
                }
                    break;
                case 4:
                {
                    //40
                }
                    break;
                case 6:
                {
                    //30
                }
                    break;
                case 8:
                {
                    //20
                }
                    break;
                case 10:
                {
                    //10
                }
                    break;
                    
                default:
                    break;
            }
        }
    }
}

-(void)category:(UIButton *)sender{
    CategorySelectViewController *vc = [CategorySelectViewController new];
    
    vc.selectItemBlock = ^(NSString *s, NSInteger n) {
        [sender setTitle:s forState:UIControlStateNormal];
        sender.tag = n;
    };
    
    vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    vc.modalPresentationStyle = UIModalPresentationOverFullScreen;
    [self presentViewController:vc animated:YES completion:nil];
}

-(void)difficultyNumSelect:(UIButton *)sender{
    DifficultyCoefficienViewController *vc = [DifficultyCoefficienViewController new];
    
    vc.selectItemBlock = ^(NSString *s, NSInteger n) {
        [sender setTitle:s forState:UIControlStateNormal];
        sender.tag = n;
    };
    
    vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    vc.modalPresentationStyle = UIModalPresentationOverFullScreen;
    [self presentViewController:vc animated:YES completion:nil];
}

-(void)dateSelect:(UIButton *)sender{
    DateSelectViewController *vc = [DateSelectViewController new];
    
    vc.selectItemBlock = ^(NSString *s, NSInteger n) {
        [sender setTitle:s forState:UIControlStateNormal];
    };
    
    vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    vc.modalPresentationStyle = UIModalPresentationOverFullScreen;
    [self presentViewController:vc animated:YES completion:nil];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 100;
    } else if (indexPath.row == 1) {
        return 100;
    } else if (indexPath.row == 2) {
        return 100;
    } else if (indexPath.row == 3) {
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
    } else if (indexPath.row == 2) {
        DifficultyCoefficienTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DifficultyCoefficienTableViewCell"];
        [cell.difficultyNumSelectBtn addTarget:self action:@selector(difficultyNumSelect:) forControlEvents:UIControlEventTouchUpInside];
        return cell;
    } else if (indexPath.row == 3) {
        DateTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DateTableViewCell"];
        [cell.dateSelectBtn addTarget:self action:@selector(dateSelect:) forControlEvents:UIControlEventTouchUpInside];
        return cell;
    }
    NameTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NameTableViewCell"];
    return cell;
}

@end
