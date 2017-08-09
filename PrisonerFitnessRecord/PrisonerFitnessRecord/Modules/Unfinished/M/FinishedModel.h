//
//  FinishedModel.h
//  PrisonerFitnessRecord
//
//  Created by dong on 2017/8/8.
//  Copyright © 2017年 董永胜. All rights reserved.
//

#import "JKDBModel.h"

@interface FinishedModel : JKDBModel

@property (nonatomic, assign) NSInteger sectionCount;
@property (nonatomic, strong) NSMutableArray *countAry;
@property (nonatomic, copy) NSString *itemName;

@end
