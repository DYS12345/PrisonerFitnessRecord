//
//  InsaView.m
//  PrisonerFitnessRecord
//
//  Created by 董永胜 on 2018/3/29.
//  Copyright © 2018年 董永胜. All rights reserved.
//

#import "InsaView.h"
#import "UIView+FSExtension.h"

@implementation InsaView

-(instancetype)init{
    if (self = [super init]) {
        self = [InsaView viewFromXib];
    }
    return self;
}

@end
