//
//  QiXieViewController.m
//  PrisonerFitnessRecord
//
//  Created by dong on 2018/3/28.
//  Copyright © 2018年 董永胜. All rights reserved.
//

#import "QiXieViewController.h"
#import "ActionShowViewController.h"

@interface QiXieViewController ()

@end

@implementation QiXieViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)xiong:(id)sender {
    ActionShowViewController *vc = [ActionShowViewController new];
    vc.numFlag = 0;
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)bei:(id)sender {
    ActionShowViewController *vc = [ActionShowViewController new];
    vc.numFlag = 1;
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)jian:(id)sender {
    ActionShowViewController *vc = [ActionShowViewController new];
    vc.numFlag = 2;
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)shoubi:(id)sender {
    ActionShowViewController *vc = [ActionShowViewController new];
    vc.numFlag = 3;
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)tui:(id)sender {
    ActionShowViewController *vc = [ActionShowViewController new];
    vc.numFlag = 4;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
