//
//  EquipmentTrainingView.m
//  PrisonerFitnessRecord
//
//  Created by dong on 2018/3/28.
//  Copyright © 2018年 董永胜. All rights reserved.
//

#import "EquipmentTrainingView.h"
#import "UIView+FSExtension.h"

@implementation EquipmentTrainingView

-(instancetype)init{
    if (self = [super init]) {
        self = [EquipmentTrainingView viewFromXib];
    }
    return self;
}

- (IBAction)reshen:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"isLogOutSuccess" object: nil userInfo:[NSDictionary dictionaryWithObject:@"reshen" forKey:@"key"]];
}

- (IBAction)liliang:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"isLogOutSuccess" object: nil userInfo:[NSDictionary dictionaryWithObject:@"liliang" forKey:@"key"]];
}
- (IBAction)tabata:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"isLogOutSuccess" object: nil userInfo:[NSDictionary dictionaryWithObject:@"tabata" forKey:@"key"]];
}
- (IBAction)fu:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"isLogOutSuccess" object: nil userInfo:[NSDictionary dictionaryWithObject:@"fu" forKey:@"key"]];
}
- (IBAction)lashen:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"isLogOutSuccess" object: nil userInfo:[NSDictionary dictionaryWithObject:@"lashen" forKey:@"key"]];
}
- (IBAction)paomozhou:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"isLogOutSuccess" object: nil userInfo:[NSDictionary dictionaryWithObject:@"paomozhou" forKey:@"key"]];
}

@end
