//
//  QiuTuActionShowViewController.m
//  PrisonerFitnessRecord
//
//  Created by dong on 2018/1/4.
//  Copyright © 2018年 董永胜. All rights reserved.
//

#import "QiuTuActionShowViewController.h"
#import "ActionShowTableViewCell.h"

@interface QiuTuActionShowViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *titleAry;
@property (nonatomic, strong) NSMutableArray *imageAry;
@property (nonatomic, strong) NSArray *modelTitleAry;
@property (nonatomic, strong) NSArray *modelImageAry;

@end

@implementation QiuTuActionShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"ActionShowTableViewCell" bundle:nil] forCellReuseIdentifier:@"ActionShowTableViewCell"];
    
    self.titleAry = @[@"平板杠铃卧推", @"下斜板杠铃卧推", @"上斜板杠铃卧推", @"平板哑铃飞鸟", @"上斜板哑铃飞鸟", @"坐姿器械推胸", @"平板哑铃卧推", @"下斜板哑铃卧推", @"上斜板哑铃卧推", @"蝴蝶机夹胸", @"大飞鸟夹胸"];
    self.imageAry = [NSMutableArray array];
    for (int i=1; i<self.titleAry.count+1; i++) {
        NSString *str = [NSString stringWithFormat:@"x%d",i];
        [self.imageAry addObject:str];
    }
    
    NSArray *bTitleAry = @[@"引体向上", @"器械下拉", @"杠铃划船", @"坐姿划船", @"哑铃划船", @"直臂下压", @"T字划船"];
    NSMutableArray *bImageAry = [NSMutableArray array];
    for (int i=1; i<bTitleAry.count+1; i++) {
        NSString *str = [NSString stringWithFormat:@"b%d",i];
        [bImageAry addObject:str];
    }
    
    NSArray *jTitleAry = @[@"杠铃推举", @"哑铃推举", @"阿诺推举", @"杠铃提拉", @"哑铃耸肩", @"杠铃耸肩", @"杠铃侧平举", @"反向蝴蝶机", @"俯身飞鸟", @"哑铃前平举"];
    NSMutableArray *jImageAry = [NSMutableArray array];
    for (int i=1; i<jTitleAry.count+1; i++) {
        NSString *str = [NSString stringWithFormat:@"j%d",i];
        [jImageAry addObject:str];
    }
    
    NSArray *eTitleAry = @[@"杠铃臂弯举", @"单臂弯举", @"锤击臂弯举", @"反向杠铃臂弯举", @"托臂弯举", @"高位拉力器弯举"];
    NSMutableArray *eImageAry = [NSMutableArray array];
    for (int i=1; i<eTitleAry.count+1; i++) {
        NSString *str = [NSString stringWithFormat:@"e%d",i];
        [eImageAry addObject:str];
    }
    
    NSArray *sTitleAry = @[@"窄距杠铃卧推", @"单臂颈后臂屈伸", @"钢线下压", @"单臂下压", @"附身臂屈伸", @"仰姿反屈伸", @"杠铃颈后臂屈伸"];
    NSMutableArray *sImageAry = [NSMutableArray array];
    for (int i=1; i<sTitleAry.count+1; i++) {
        NSString *str = [NSString stringWithFormat:@"s%d",i];
        [sImageAry addObject:str];
    }
    
    NSArray *tTitleAry = @[@"杠铃深蹲", @"史密斯深蹲", @"颈前史密斯深蹲", @"直腿硬拉", @"屈腿硬拉", @"坐姿蹬腿", @"俯立挺身", @"哑铃弓箭步", @"杠铃弓箭步", @"附身腿弯举", @"哈克深蹲", @"坐姿提踵", @"坐姿腿弯举", @"坐姿腿屈伸"];
    NSMutableArray *tImageAry = [NSMutableArray array];
    for (int i=1; i<tTitleAry.count+1; i++) {
        NSString *str = [NSString stringWithFormat:@"t%d",i];
        [tImageAry addObject:str];
    }
    
    self.modelTitleAry = @[self.titleAry, bTitleAry, jTitleAry, eTitleAry, sTitleAry, tTitleAry];
    self.modelImageAry = @[self.imageAry, bImageAry, jImageAry, eImageAry, sImageAry, tImageAry];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *ary = self.modelTitleAry[self.numFlag];
    return ary.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ActionShowTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ActionShowTableViewCell"];
    NSArray *ary = self.modelTitleAry[self.numFlag];
    NSArray *imageAry = self.modelImageAry[self.numFlag];
    cell.label.text = ary[indexPath.item];
    cell.showImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@", imageAry[indexPath.item]]];
    return cell;
}

@end
