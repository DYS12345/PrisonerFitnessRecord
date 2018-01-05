//
//  JiHuaModel.h
//  PrisonerFitnessRecord
//
//  Created by dong on 2018/1/5.
//  Copyright © 2018年 董永胜. All rights reserved.
//

#import "JKDBModel.h"

@interface JiHuaModel : JKDBModel

@property(nonatomic, copy) NSString *zhou;
@property(nonatomic, strong) NSMutableArray *days;

@end
