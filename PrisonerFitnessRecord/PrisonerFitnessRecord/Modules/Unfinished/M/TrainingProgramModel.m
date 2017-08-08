//
//  TrainingProgramModel.m
//  PrisonerFitnessRecord
//
//  Created by 董永胜 on 2017/8/6.
//  Copyright © 2017年 董永胜. All rights reserved.
//

#import "TrainingProgramModel.h"
#import "MJExtension.h"

@implementation TrainingProgramModel

-(void)getModel{
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"Model" ofType:@"plist"];
    NSArray *array = [[NSArray alloc] initWithContentsOfFile:plistPath];
    NSArray *ary = [TrainingProgramModel mj_objectArrayWithKeyValuesArray:array];
    if ([self.delegate respondsToSelector:@selector(trainingProgramModel:)]) {
        [self.delegate trainingProgramModel:ary];
    }
}

@end
