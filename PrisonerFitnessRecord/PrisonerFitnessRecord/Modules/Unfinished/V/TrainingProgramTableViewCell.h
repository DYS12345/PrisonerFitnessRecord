//
//  TrainingProgramTableViewCell.h
//  PrisonerFitnessRecord
//
//  Created by 董永胜 on 2017/8/6.
//  Copyright © 2017年 董永胜. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TrainingProgramTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UIButton *addBtn;
@property (nonatomic, strong) UIButton *removeBtn;
@property (nonatomic, strong) UIButton *editBtn;
@property (nonatomic, copy) NSString *nameStr;
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) UILabel *sectionCountLabel;

@end
