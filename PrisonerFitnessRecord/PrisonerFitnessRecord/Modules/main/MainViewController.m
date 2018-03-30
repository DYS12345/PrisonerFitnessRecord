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
#import "EquipmentTrainingView.h"
#import "SelfTrainingView.h"
#import "ReShenViewController.h"
#import "QiXieViewController.h"
#import "TabataViewController.h"
#import "FuViewController.h"
#import "FullStretchViewController.h"
#import "PaoMoZhouViewController.h"
#import "ZReShenViewController.h"
#import "FuWochengViewController.h"
#import "YintixiangshangViewController.h"
#import "ShendunViewController.h"
#import "InsaView.h"

@interface MainViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) InsaView *insView;
@property (assign, nonatomic) BOOL is_first;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *toplayOut;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *version = [UIDevice currentDevice].systemVersion;
    if (version.doubleValue >= 11.0) {
        self.toplayOut.constant = -20;
    } else{
        self.toplayOut.constant = 0;
    }
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"MainTableViewCell" bundle:nil] forCellReuseIdentifier:@"MainTableViewCell1"];
    [self.tableView registerNib:[UINib nibWithNibName:@"MainTableViewCell" bundle:nil] forCellReuseIdentifier:@"MainTableViewCell2"];
    self.tableView.backgroundColor = [UIColor blackColor];
    self.tableView.rowHeight = SCREEN_HEIGHT;
    
    self.tableView.pagingEnabled = YES;
    self.is_first = YES;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(isLogOutSuccess:)  name:@"isLogOutSuccess" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(selftrain:)  name:@"selftrain" object:nil];
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

-(void) isLogOutSuccess:(NSNotification*)notification{
    NSDictionary *dictionary = [notification userInfo];
    if ([dictionary[@"key"] isEqualToString:@"reshen"]) {
        ReShenViewController *vc = [ReShenViewController new];
        [self presentViewController:vc animated:YES completion:nil];
    } else if ([dictionary[@"key"] isEqualToString:@"liliang"]) {
        QiXieViewController *vc = [QiXieViewController new];
        UINavigationController *navc = [[UINavigationController alloc] initWithRootViewController:vc];
        [self presentViewController:navc animated:YES completion:nil];
    } else if ([dictionary[@"key"] isEqualToString:@"tabata"]) {
        TabataViewController *vc = [TabataViewController new];
        [self presentViewController:vc animated:YES completion:nil];
    } else if ([dictionary[@"key"] isEqualToString:@"fu"]) {
        FuViewController *vc = [FuViewController new];
        [self presentViewController:vc animated:YES completion:nil];
    } else if ([dictionary[@"key"] isEqualToString:@"lashen"]) {
        FullStretchViewController *vc = [FullStretchViewController new];
        [self presentViewController:vc animated:YES completion:nil];
    } else if ([dictionary[@"key"] isEqualToString:@"paomozhou"]) {
        PaoMoZhouViewController *vc = [PaoMoZhouViewController new];
        [self presentViewController:vc animated:YES completion:nil];
    }
}

-(void) selftrain:(NSNotification*)notification{
    NSDictionary *dictionary = [notification userInfo];
    if ([dictionary[@"key"] isEqualToString:@"reshen"]) {
        ZReShenViewController *vc = [ZReShenViewController new];
        [self presentViewController:vc animated:YES completion:nil];
    } else if ([dictionary[@"key"] isEqualToString:@"fuwocheng"]) {
        FuWochengViewController *vc = [FuWochengViewController new];
//        UINavigationController *navc = [[UINavigationController alloc] initWithRootViewController:vc];
        [self presentViewController:vc animated:YES completion:nil];
    } else if ([dictionary[@"key"] isEqualToString:@"yintixiangshang"]) {
        YintixiangshangViewController *vc = [YintixiangshangViewController new];
        [self presentViewController:vc animated:YES completion:nil];
    } else if ([dictionary[@"key"] isEqualToString:@"shendun"]) {
        ShendunViewController *vc = [ShendunViewController new];
        [self presentViewController:vc animated:YES completion:nil];
    } else if ([dictionary[@"key"] isEqualToString:@"fu"]) {
        FuViewController *vc = [FuViewController new];
        [self presentViewController:vc animated:YES completion:nil];
    } else if ([dictionary[@"key"] isEqualToString:@"lashen"]) {
        FullStretchViewController *vc = [FullStretchViewController new];
        [self presentViewController:vc animated:YES completion:nil];
    } else if ([dictionary[@"key"] isEqualToString:@"paomozhou"]) {
        PaoMoZhouViewController *vc = [PaoMoZhouViewController new];
        [self presentViewController:vc animated:YES completion:nil];
    } else if ([dictionary[@"key"] isEqualToString:@"tabata"]) {
        TabataViewController *vc = [TabataViewController new];
        [self presentViewController:vc animated:YES completion:nil];
    } else if ([dictionary[@"key"] isEqualToString:@"zuihou"]) {
        self.is_first = !self.is_first;
        if (!self.is_first) {
            [UIView animateWithDuration:0.4 animations:^{
                self.insView.frame = CGRectMake(0, SCREEN_HEIGHT/2-(SCREEN_WIDTH+300)/2, SCREEN_WIDTH, SCREEN_HEIGHT-100);
                self.insView.hidden = NO;
            }];
        } else {
            [UIView animateWithDuration:0.4 animations:^{
                self.insView.frame = CGRectMake(0, SCREEN_HEIGHT/2-(SCREEN_WIDTH+300)/2, 50*SCREEN_WIDTH, 50*SCREEN_HEIGHT);
                self.insView.hidden = YES;
            }];
        }
    }
}

-(InsaView *)insView{
    if (!_insView) {
        _insView = [[InsaView alloc] init];
        [self.view addSubview:_insView];
        self.insView.hidden = YES;
        _insView.frame = CGRectMake(SCREEN_WIDTH/2-100, -500, 200, 200);
    }
    return _insView;
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        MainTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"MainTableViewCell1"];
        EquipmentTrainingView *view = [[EquipmentTrainingView alloc] init];
        view.frame = cell.frame;
        [cell.contentView addSubview:view];
        
        return cell;
    } else {
        MainTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"MainTableViewCell2"];
        SelfTrainingView *view = [[SelfTrainingView alloc] init];
        view.frame = cell.frame;
        [cell.contentView addSubview:view];
        return cell;
    }
}

@end
