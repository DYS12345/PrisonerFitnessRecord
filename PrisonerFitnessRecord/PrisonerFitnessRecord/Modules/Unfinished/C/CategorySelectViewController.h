//
//  CategorySelectViewController.h
//  PrisonerFitnessRecord
//
//  Created by dong on 2017/11/16.
//  Copyright © 2017年 董永胜. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^selectItem)(NSString *s, NSInteger n);

@interface CategorySelectViewController : UIViewController

@property (nonatomic, strong) NSString *selectedItemStr;
@property (nonatomic, copy) selectItem selectItemBlock;
@property (nonatomic, assign) NSInteger selectNumId;

@end
