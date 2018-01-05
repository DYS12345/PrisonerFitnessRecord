//
//  FinishiedTableViewCell.h
//  PrisonerFitnessRecord
//
//  Created by dong on 2018/1/4.
//  Copyright © 2018年 董永胜. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JiHuaModel;

@interface FinishiedTableViewCell : UITableViewCell

@property (strong, nonatomic) UICollectionView *collectionView;
@property(nonatomic, strong) NSArray *modelAry;
@property(nonatomic, strong) JiHuaModel *jiHuaModel;
@property(nonatomic, strong) UIViewController *vc;
@property(nonatomic, assign) NSInteger numFlag;

@end
