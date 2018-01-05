//
//  FinishiedTableViewCell.m
//  PrisonerFitnessRecord
//
//  Created by dong on 2018/1/4.
//  Copyright © 2018年 董永胜. All rights reserved.
//

#import "FinishiedTableViewCell.h"
#import "JiHuaCollectionViewCell.h"
#import "Masonry.h"
#import "JiHuaModel.h"
#import "OtherMacro.h"
#import "UIColor+Extension.h"

@interface FinishiedTableViewCell()<UICollectionViewDelegate, UICollectionViewDataSource>

@property(nonatomic, assign) NSInteger n;

@end


@implementation FinishiedTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self.contentView addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.left.bottom.mas_equalTo(self.contentView).mas_offset(0);
    }];
    
    self.collectionView.scrollEnabled = NO;
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"JiHuaCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"JiHuaCollectionViewCell"];
    
    
}

-(UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.itemSize = CGSizeMake(70, 70);
        flowLayout.minimumLineSpacing = 2;
        flowLayout.minimumInteritemSpacing = 0;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 200, 200) collectionViewLayout:flowLayout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
    }
    return _collectionView;
}

-(void)setModelAry:(NSArray *)modelAry{
    _modelAry = modelAry;
    [self.collectionView reloadData];
}

-(void)setJiHuaModel:(JiHuaModel *)jiHuaModel{
    _jiHuaModel = jiHuaModel;
    [self.collectionView reloadData];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)showAlert {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"确定你的操作？"
                                                                   message:@"This is an alert."
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                              NSString *str = self.jiHuaModel.days[self.n];
                                                              if ([str isEqualToString:@"0"]) {
                                                                  str = @"1";
                                                              } else {
                                                                  str = @"0";
                                                              }
                                                              [self.jiHuaModel.days replaceObjectAtIndex:self.n withObject:str];
                                                              
//                                                              NSArray *ary = [JiHuaModel findAll];
//                                                              NSMutableArray *ary1 = [NSMutableArray arrayWithArray:ary];
                                                              
                                                              
                                                              [self.collectionView reloadData];
                                                              
                                                              BOOL flag = NO;
                                                              for (int i = 0; i<self.jiHuaModel.days.count; i++) {
                                                                  if ([self.jiHuaModel.days[i] isEqualToString:@"1"]) {
                                                                      flag = YES;
                                                                  } else {
                                                                      flag = NO;
                                                                  }
                                                              }
                                                              
                                                              if (flag) {
                                                                  NSDictionary *dict =[[NSDictionary alloc] initWithObjectsAndKeys:[NSString stringWithFormat:@"%ld", (long)self.numFlag],@"num", nil];
                                                                  NSNotification *notification =[NSNotification notificationWithName:@"InfoNotification" object:nil userInfo:dict];
                                                                  [[NSNotificationCenter defaultCenter] postNotification:notification];
                                                              }
                                                          }];
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * action) {
                                                             
                                                         }];
    
    [alert addAction:cancelAction];
    [alert addAction:defaultAction];
    [self.vc presentViewController:alert animated:YES completion:nil];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.modelAry.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    JiHuaCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"JiHuaCollectionViewCell" forIndexPath:indexPath];
    cell.titleLabel.text = self.modelAry[indexPath.item];
    
    NSString *str = self.jiHuaModel.days[indexPath.row];
    if ([str isEqualToString:@"0"]) {
        cell.tipImageView.image = [UIImage imageNamed:@"love"];
        cell.oneLine.backgroundColor = [UIColor colorWithHexString:BLUE_COLOR];
        cell.twoLine.backgroundColor = [UIColor colorWithHexString:BLUE_COLOR];
        cell.threeLine.backgroundColor = [UIColor colorWithHexString:BLUE_COLOR];
        cell.fourLine.backgroundColor = [UIColor colorWithHexString:BLUE_COLOR];
    } else {
        cell.tipImageView.image = [UIImage imageNamed:@"loveSelected"];
        cell.oneLine.backgroundColor = [UIColor colorWithHexString:PURPLE_COLOR];
        cell.twoLine.backgroundColor = [UIColor colorWithHexString:PURPLE_COLOR];
        cell.threeLine.backgroundColor = [UIColor colorWithHexString:PURPLE_COLOR];
        cell.fourLine.backgroundColor = [UIColor colorWithHexString:PURPLE_COLOR];
    }
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    self.n = indexPath.row;
    [self showAlert];
}

@end
