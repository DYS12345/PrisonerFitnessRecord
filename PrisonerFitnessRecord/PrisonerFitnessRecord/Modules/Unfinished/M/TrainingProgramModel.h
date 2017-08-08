//
//  TrainingProgramModel.h
//  PrisonerFitnessRecord
//
//  Created by 董永胜 on 2017/8/6.
//  Copyright © 2017年 董永胜. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TrainingProgramModelDelegate <NSObject>

-(void)trainingProgramModel:(NSArray *)ary;

@end

@interface TrainingProgramModel : NSObject

@property (nonatomic, copy) NSString *tip;
@property (nonatomic, strong) NSArray *data;
@property (nonatomic, weak) id <TrainingProgramModelDelegate> delegate;

-(void)getModel;

@end
