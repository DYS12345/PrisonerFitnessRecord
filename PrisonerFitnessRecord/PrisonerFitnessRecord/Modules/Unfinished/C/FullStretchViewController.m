//
//  FullStretchViewController.m
//  PrisonerFitnessRecord
//
//  Created by dong on 2018/1/26.
//  Copyright © 2018年 董永胜. All rights reserved.
//

#import "FullStretchViewController.h"
#import "FullStretchTableViewCell.h"

@interface FullStretchViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation FullStretchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"FullStretchTableViewCell" bundle:nil] forCellReuseIdentifier:@"FullStretchTableViewCell"];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FullStretchTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FullStretchTableViewCell"];
    return cell;
}

@end
