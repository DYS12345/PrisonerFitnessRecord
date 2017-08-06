//
//  UserModel.h
//  banmen
//
//  Created by dong on 2017/7/17.
//  Copyright © 2017年 banmen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JKDBModel.h"

@protocol UserModelDelegate <NSObject>

-(void)update;

@end

@interface UserModel : JKDBModel

@property (nonatomic, assign) BOOL isLogin;
@property (nonatomic, copy) NSString *userId;
@property (nonatomic, copy) NSString *account;
@property (nonatomic, copy) NSString *phone;
@property (nonatomic, copy) NSString *srcfile;
@property (nonatomic, copy) NSString *cooperation_count;
@property (nonatomic, copy) NSString *sales_volume;
@property (nonatomic, copy) NSString *order_quantity;
@property(nonatomic,weak) id <UserModelDelegate> delegate;

-(void)netGetUserInfo;

@end
