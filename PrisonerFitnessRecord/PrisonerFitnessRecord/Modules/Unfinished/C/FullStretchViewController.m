//
//  FullStretchViewController.m
//  PrisonerFitnessRecord
//
//  Created by dong on 2018/1/26.
//  Copyright © 2018年 董永胜. All rights reserved.
//

#import "FullStretchViewController.h"
#import "FullStretchTableViewCell.h"
#import "Masonry.h"
#import "OtherMacro.h"
#import "UIColor+Extension.h"

@interface FullStretchViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *imageAry;
@property (nonatomic, strong) NSArray *heightAry;
@property (nonatomic, strong) NSArray *headerTitleAry;
@property (nonatomic, strong) NSArray *footerMasleTitleAry;
@property (nonatomic, strong) NSArray *footerPointsTitleAry;

@end

@implementation FullStretchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"FullStretchTableViewCell" bundle:nil] forCellReuseIdentifier:@"FullStretchTableViewCell"];
    
    NSMutableArray *imageAry = [NSMutableArray array];
    for (int i = 1; i<=18; i++) {
        NSString *str = [NSString stringWithFormat:@"tension%d", i];
        [imageAry addObject:str];
    }
    self.imageAry = imageAry;
    
    NSArray *heightAry = @[@(508), @(508), @(1070), @(451), @(503), @(1070), @(503), @(542), @(542), @(445), @(1123), @(513), @(625), @(401), @(406), @(347), @(342), @(368)];
    self.heightAry = heightAry;
    
    NSArray *headerTitleAry = @[@"01 伸展脖子弯曲的肌肉", @"02 借助手拉伸脖子的侧区肌", @"03 婴儿式", @"04 骆驼式", @"05 靠墙伸展胸部肌肉", @"06 广角式", @"07 侧肩伸展式", @"08 站立颈部伸展式", @"09 三角式", @"10 靠墙下犬式", @"11 仰卧脊柱扭转式", @"12 站立侧弯", @"13 简易单腿前屈式", @"14 蝴蝶式", @"15 怀抱婴儿式", @"16 坐立鸽子式", @"17 前屈折叠式", @"18 冲刺式"];
    self.headerTitleAry = headerTitleAry;
    
    NSArray *footerMasleTitleAry = @[@"涉及肌肉：胸锁乳突肌", @"涉及肌肉：胸锁乳突肌和斜方肌上部", @"涉及肌肉：背部肌肉", @"涉及肌肉：腹直肌和腹外斜肌", @"涉及肌肉：背部、胸部最宽的肌肉", @"涉及肌肉：内收肌、腘绳肌。", @"涉及肌肉：外侧三角肌。", @"涉及肌肉：斜方肌。", @"涉及肌肉：腹外斜肌。", @"涉及肌肉：背部、胸部最宽的肌肉。", @"涉及肌肉：臀部和腹外斜肌。", @"涉及肌肉：腹外斜肌和背部最宽的肌肉。", @"涉及肌肉：腘绳肌。", @"涉及肌肉：内收肌。", @"涉及肌肉：髋屈肌。", @"涉及肌肉：前胫骨", @"涉及肌肉：腘绳肌和小腿肌肉", @"涉及肌肉：腰部肌肉和股四头肌。"];
    self.footerMasleTitleAry = footerMasleTitleAry;
    
    NSArray *footerPointsTitleAry = @[@"要点：手放在髋部，挺直背部，轻轻地抬头向上伸展。", @"要点：坐立，身体立直，将头倾斜到左边，耳朵找向左肩，相反的方向重复练习。", @"要点：跪立，双腿分开，臀部坐向脚后跟，身体向前，试图用额头触地。", @"要点：髋部向前推，稍微向上，不要过度挤压腰部。", @"要点：面对墙站立，右手推墙，身体慢慢地离开墙壁， 另一面重复。", @"要点：坐在地板上，双腿伸直打开，不要弯曲膝盖，身体向前倾斜，双手沿着双腿向前伸展。",@"要点：站立，手臂伸直，轻轻按压以增加肌肉的伸展， 另一只手重复练习。", @"要点：站立，双腿并拢，微微屈膝，手将头部向前倾斜，下巴找胸部。", @"要点：把手放在站立腿的前面，背部挺直，抬起对侧手臂，让髋部从前向后打开。", @"要点：靠墙一定距离站立，身体平行于地板。 保持背部平坦，然后从胸部开始慢慢弯曲。", @"要点：仰卧，屈右膝，身体向左扭转。", @"要点：站立，身体向右侧弯，重复左边的练习。", @"要点：站立，一只脚在前，背部挺直。 双手放在髋部，从髋部开始向前折叠，另一条腿重复。", @"要点：屈膝坐下来，脚底相对，背部平直，轻轻地将双手放在膝盖上，将臀部和膝盖向下靠近地面。", @"要点：坐在地板上，挺直背部，慢慢地将一条腿拉到胸前，把大腿转出来，另一条腿重复。", @"要点：坐在地板上，右手收回，用手握住右脚放在左膝上，左脚重复。", @"要点：坐在地板上，双腿并拢伸直向前折叠。", @"要点：冲刺式，左腿在前屈膝90度。 抓住右脚向腰部，换另一只脚重复。"];
    self.footerPointsTitleAry = footerPointsTitleAry;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [UIView new];
    UILabel *label = [UILabel new];
    label.text = self.headerTitleAry[section];
    label.font = [UIFont systemFontOfSize:15];
    label.textColor = [UIColor colorWithHexString:PURPLE_COLOR];
    [view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(view.center).mas_offset(0);
    }];
    UIImageView *imageView = [UIImageView new];
    imageView.image = [UIImage imageNamed:@"angle3"];
    [view addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(view.mas_centerY).mas_offset(0);
        make.right.mas_equalTo(label.mas_left).mas_offset(-3);
        make.width.mas_equalTo(20);
        make.height.mas_equalTo(20);
    }];
    return view;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view = [UIView new];
    UILabel *masleLabel = [UILabel new];
    masleLabel.text = self.footerMasleTitleAry[section];
    masleLabel.numberOfLines = 0;
    masleLabel.textColor = [UIColor colorWithHexString:BLUE_COLOR];
    masleLabel.font = [UIFont systemFontOfSize:15];
    [view addSubview:masleLabel];
    [masleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(view.mas_left).mas_offset(15);
        make.right.mas_equalTo(view.mas_right).mas_offset(-15);
        make.top.mas_equalTo(view.mas_top).mas_offset(10);
    }];
    
    UILabel *pointsLabel = [UILabel new];
    pointsLabel.text = self.footerPointsTitleAry[section];
    pointsLabel.numberOfLines = 0;
    pointsLabel.textColor = [UIColor colorWithHexString:BLUE_COLOR];
    pointsLabel.font = [UIFont systemFontOfSize:15];
    [view addSubview:pointsLabel];
    [pointsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(view.mas_left).mas_offset(15);
        make.right.mas_equalTo(view.mas_right).mas_offset(-15);
        make.top.mas_equalTo(masleLabel.mas_bottom).mas_offset(10);
    }];
    return view;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 80;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.imageAry.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FullStretchTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FullStretchTableViewCell"];
    cell.imageView.image = [UIImage imageNamed:self.imageAry[indexPath.section]];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat n = [self.heightAry[indexPath.section] floatValue];
    return n/2;
}

@end
