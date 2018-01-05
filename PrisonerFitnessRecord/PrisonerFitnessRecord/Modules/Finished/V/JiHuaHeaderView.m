//
//  JiHuaHeaderView.m
//  PrisonerFitnessRecord
//
//  Created by dong on 2018/1/4.
//  Copyright © 2018年 董永胜. All rights reserved.
//

#import "JiHuaHeaderView.h"
#import "Masonry.h"
#import "UIColor+Extension.h"
#import "OtherMacro.h"

@implementation JiHuaHeaderView

-(instancetype)init{
    if (self = [super init]) {
        
        [self addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.mas_centerX).mas_offset(10);
            make.centerY.mas_equalTo(self.mas_centerY).mas_offset(0);
        }];
        
        [self addSubview:self.aroImageView];
        [self.aroImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.titleLabel.mas_left).mas_offset(-5);
            make.centerY.mas_equalTo(self.mas_centerY).mas_offset(0);
            make.width.mas_equalTo(25);
            make.height.mas_equalTo(25);
        }];
    }
    return self;
}

-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.textColor = [UIColor colorWithHexString:BLUE_COLOR];
    }
    return _titleLabel;
}

-(UIImageView *)aroImageView{
    if (!_aroImageView) {
        _aroImageView = [UIImageView new];
        _aroImageView.image = [UIImage imageNamed:@"right"];
    }
    return _aroImageView;
}

@end
