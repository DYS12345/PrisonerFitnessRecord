//
//  TrainingProgramTableViewCell.m
//  PrisonerFitnessRecord
//
//  Created by 董永胜 on 2017/8/6.
//  Copyright © 2017年 董永胜. All rights reserved.
//

#import "TrainingProgramTableViewCell.h"
#import "Masonry.h"
#import "UIColor+Extension.h"
#import "OtherMacro.h"
#import "UIView+FSExtension.h"

@implementation TrainingProgramTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self.contentView addSubview:self.nameLabel];
        [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.contentView.centerY).mas_offset(0);
            make.left.mas_equalTo(self.contentView.mas_left).mas_offset(15);
        }];
        
        [self.contentView addSubview:self.editBtn];
        [_editBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.contentView.mas_right).mas_offset(-15);
            make.centerY.mas_equalTo(self.contentView.mas_centerY).mas_offset(0);
        }];
        
        [self.contentView addSubview:self.removeBtn];
        [_removeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.contentView.centerY).mas_offset(0);
            make.right.mas_equalTo(self.editBtn.mas_left).mas_offset(-30);
        }];
        
        [self.contentView addSubview:self.addBtn];
        [_addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.contentView.centerY).mas_offset(0);
            make.right.mas_equalTo(self.removeBtn.mas_left).mas_offset(-30);
        }];
        
        [self.contentView addSubview:self.lineView];
        [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.nameLabel.mas_left).mas_offset(0);
            make.right.mas_equalTo(self.editBtn.mas_right).mas_offset(0);
            make.bottom.mas_equalTo(self.contentView.mas_bottom).mas_offset(0);
            make.height.mas_equalTo(1);
        }];
        
    }
    return self;
}

-(UIView *)lineView{
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = [UIColor colorWithHexString:@"#f7f7f7"];
    }
    return _lineView;
}

-(void)setNameStr:(NSString *)nameStr{
    _nameStr = nameStr;
    self.nameLabel.text = nameStr;
}

-(UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = [UIFont systemFontOfSize:14];
        _nameLabel.textColor = [UIColor colorWithHexString:@"#222222"];
    }
    return _nameLabel;
}

-(UIButton *)editBtn{
    if (!_editBtn) {
        _editBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_editBtn setImage:[UIImage imageNamed:@"edit"] forState:UIControlStateNormal];
    }
    return _editBtn;
}

-(UIButton *)addBtn{
    if (!_addBtn) {
        _addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_addBtn setImage:[UIImage imageNamed:@"add"] forState:UIControlStateNormal];
    }
    return _addBtn;
}

-(UIButton *)removeBtn{
    if (!_removeBtn) {
        _removeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_removeBtn setImage:[UIImage imageNamed:@"remove"] forState:UIControlStateNormal];
    }
    return _removeBtn;
}

@end
