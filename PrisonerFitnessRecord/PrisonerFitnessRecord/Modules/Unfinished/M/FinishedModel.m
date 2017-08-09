//
//  FinishedModel.m
//  PrisonerFitnessRecord
//
//  Created by dong on 2017/8/8.
//  Copyright © 2017年 董永胜. All rights reserved.
//

#import "FinishedModel.h"

@implementation FinishedModel

-(NSMutableArray *)countAry{
    if (!_countAry) {
        _countAry = [NSMutableArray array];
    }
    return _countAry;
}

@end
