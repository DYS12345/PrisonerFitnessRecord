//
//  JiHuaCollectionViewCell.m
//  PrisonerFitnessRecord
//
//  Created by dong on 2018/1/5.
//  Copyright © 2018年 董永胜. All rights reserved.
//

#import "JiHuaCollectionViewCell.h"
#import "JiHuaModel.h"
#import "POP.h"

@implementation JiHuaCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
   
}

-(void)setModel:(JiHuaModel *)model{
    _model = model;
    
}

-(void)setHighlighted:(BOOL)highlighted{
    [super setHighlighted:highlighted];
    if (self.highlighted) {
        POPBasicAnimation *scaleAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewScaleXY];
        scaleAnimation.duration = 0.1;
        scaleAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(1, 1)];
        [self.titleLabel pop_addAnimation:scaleAnimation forKey:@"scalingUp"];
        [self.tipImageView pop_addAnimation:scaleAnimation forKey:@"scalingUp"];
    } else {
        POPSpringAnimation *sprintAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
        sprintAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(0.9, 0.9)];
        sprintAnimation.velocity = [NSValue valueWithCGPoint:CGPointMake(2, 2)];
        sprintAnimation.springBounciness = 20.f;
        [self.titleLabel pop_addAnimation:sprintAnimation forKey:@"springAnimation"];
        [self.tipImageView pop_addAnimation:sprintAnimation forKey:@"springAnimation"];
    }
}

@end
