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

@interface ZiZhongViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *imageAry;

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
    
    NSMutableArray *imageAry = [NSMutableArray array];
    for (int i = 1; i<=5; i++) {
        [imageAry addObject:[NSString stringWithFormat:@"ziZhong%d", i]];
    }
    self.imageAry = imageAry;
}

-(void)select{
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZiZhongTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZiZhongTableViewCell"];
    cell.contentImageView.image = [UIImage imageNamed:self.imageAry[indexPath.row]];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 10/7.0 * SCREEN_WIDTH;
    }
    return 0;
}

@end
