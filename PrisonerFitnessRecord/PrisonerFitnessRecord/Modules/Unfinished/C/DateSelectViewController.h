//
//  DateSelectViewController.h
//  PrisonerFitnessRecord
//
//  Created by dong on 2017/11/17.
//  Copyright © 2017年 董永胜. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^selectItem)(NSString *s, NSInteger n);

@interface DateSelectViewController : UIViewController

@property (nonatomic, copy) selectItem selectItemBlock;

@end
