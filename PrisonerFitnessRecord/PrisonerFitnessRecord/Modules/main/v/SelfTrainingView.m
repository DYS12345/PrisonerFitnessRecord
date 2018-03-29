//
//  SelfTrainingView.m
//  PrisonerFitnessRecord
//
//  Created by dong on 2018/3/28.
//  Copyright © 2018年 董永胜. All rights reserved.
//

#import "SelfTrainingView.h"
#import "UIView+FSExtension.h"

@implementation SelfTrainingView

-(instancetype)init{
    if (self = [super init]) {
        self = [SelfTrainingView viewFromXib];
    }
    return self;
}
- (IBAction)tabata:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"selftrain" object: nil userInfo:[NSDictionary dictionaryWithObject:@"tabata" forKey:@"key"]];
}
- (IBAction)zuihou:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"selftrain" object: nil userInfo:[NSDictionary dictionaryWithObject:@"zuihou" forKey:@"key"]];
}

- (IBAction)reshen:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"selftrain" object: nil userInfo:[NSDictionary dictionaryWithObject:@"reshen" forKey:@"key"]];
}

- (IBAction)fuwocheng:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"selftrain" object: nil userInfo:[NSDictionary dictionaryWithObject:@"fuwocheng" forKey:@"key"]];
}
- (IBAction)yintixiangshang:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"selftrain" object: nil userInfo:[NSDictionary dictionaryWithObject:@"yintixiangshang" forKey:@"key"]];
}
- (IBAction)shendun:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"selftrain" object: nil userInfo:[NSDictionary dictionaryWithObject:@"shendun" forKey:@"key"]];
}
- (IBAction)fu:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"selftrain" object: nil userInfo:[NSDictionary dictionaryWithObject:@"fu" forKey:@"key"]];
}
- (IBAction)lashen:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"selftrain" object: nil userInfo:[NSDictionary dictionaryWithObject:@"lashen" forKey:@"key"]];
}
- (IBAction)paomozhou:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"selftrain" object: nil userInfo:[NSDictionary dictionaryWithObject:@"paomozhou" forKey:@"key"]];
}

@end
