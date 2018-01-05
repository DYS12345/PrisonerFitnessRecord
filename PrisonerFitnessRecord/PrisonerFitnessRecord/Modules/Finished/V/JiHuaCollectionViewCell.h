//
//  JiHuaCollectionViewCell.h
//  PrisonerFitnessRecord
//
//  Created by dong on 2018/1/5.
//  Copyright © 2018年 董永胜. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JiHuaModel;

@interface JiHuaCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIView *oneLine;
@property (weak, nonatomic) IBOutlet UIView *twoLine;
@property (weak, nonatomic) IBOutlet UIView *threeLine;
@property (weak, nonatomic) IBOutlet UIView *fourLine;
@property (weak, nonatomic) IBOutlet UIImageView *tipImageView;
@property (nonatomic, strong) JiHuaModel *model;

@end
