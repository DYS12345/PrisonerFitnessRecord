//
//  BaseTarBar.m
//  banmen
//
//  Created by dong on 2017/6/19.
//  Copyright © 2017年 banmen. All rights reserved.
//

#import "BaseTarBar.h"
#import "OtherMacro.h"
#import "UIColor+Extension.h"

@implementation BaseTarBar

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.frame = CGRectMake(0, SCREEN_HEIGHT-49, SCREEN_WIDTH, 49);
        [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                           [UIColor colorWithHexString:@"#8a98a9"], NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    }
    return self;
}

@end
