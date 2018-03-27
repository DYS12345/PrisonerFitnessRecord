//
//  MainViewController.m
//  PrisonerFitnessRecord
//
//  Created by dong on 2018/3/27.
//  Copyright © 2018年 董永胜. All rights reserved.
//

#import "MainViewController.h"
#import "MainTableViewCell.h"
#import "OtherMacro.h"

@interface MainViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"MainTableViewCell" bundle:nil] forCellReuseIdentifier:@"MainTableViewCell"];
    self.tableView.backgroundColor = [UIColor blackColor];
    self.tableView.rowHeight = SCREEN_HEIGHT;
    
    self.tableView.pagingEnabled = YES;
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MainTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"MainTableViewCell"];
    return cell;
}

@end
