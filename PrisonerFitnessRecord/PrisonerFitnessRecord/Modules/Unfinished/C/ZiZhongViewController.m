//
//  ZiZhongViewController.m
//  PrisonerFitnessRecord
//
//  Created by dong on 2018/1/18.
//  Copyright © 2018年 董永胜. All rights reserved.
//

#import "ZiZhongViewController.h"
#import "ZiZhongTableViewCell.h"
#import "UIView+Size.h"
#import "OtherMacro.h"
#import "ZiZhongJiShuTableViewCell.h"

@interface ZiZhongViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *imageAry;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *selectViewTop;
@property (nonatomic, assign) NSInteger flagN;

@end

@implementation ZiZhongViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *selectBtn = [[UIButton alloc] init];
    [selectBtn setImage:[UIImage imageNamed:@"menu"] forState:UIControlStateNormal];
    [selectBtn addTarget:self action:@selector(select) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *selectBtnItem = [[UIBarButtonItem alloc] initWithCustomView:selectBtn];
    self.navigationItem.rightBarButtonItem = selectBtnItem;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"ZiZhongTableViewCell" bundle:nil] forCellReuseIdentifier:@"ZiZhongTableViewCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"ZiZhongJiShuTableViewCell" bundle:nil] forCellReuseIdentifier:@"ZiZhongJiShuTableViewCell"];
    
    NSMutableArray *imageAry = [NSMutableArray array];
    for (int i = 1; i<=5; i++) {
        [imageAry addObject:[NSString stringWithFormat:@"ziZhong%d", i]];
    }
    self.imageAry = imageAry;
    self.flagN = 0;
}

- (IBAction)firstBtn:(id)sender {
    self.flagN = 0;
    [self.tableView reloadData];
}

- (IBAction)secondbtn:(id)sender {
    self.flagN = 1;
    [self.tableView reloadData];
}

- (IBAction)thirdBtn:(id)sender {
    self.flagN = 2;
    [self.tableView reloadData];
}

- (IBAction)fourBtn:(id)sender {
    self.flagN = 4;
    [self.tableView reloadData];
}

- (IBAction)fuBtn:(id)sender {
    self.flagN = 3;
    [self.tableView reloadData];
}

- (IBAction)selectViewCancel:(id)sender {
    [UIView animateWithDuration:0.4 animations:^{
        self.selectViewTop.constant = 600;
        [self.view layoutIfNeeded];
    }];
}

-(void)select{
    [UIView animateWithDuration:0.4 animations:^{
        self.selectViewTop.constant = 0; // 600
        [self.view layoutIfNeeded];
    }];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 1) {
        ZiZhongJiShuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZiZhongJiShuTableViewCell"];
        return cell;
    } else if (indexPath.row == 0) {
        ZiZhongTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZiZhongTableViewCell"];
        cell.contentImageView.image = [UIImage imageNamed:self.imageAry[self.flagN]];
        return cell;
    }
    UITableViewCell *cell;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 10/7.0 * SCREEN_WIDTH;
    }
    return 100;
}

@end
