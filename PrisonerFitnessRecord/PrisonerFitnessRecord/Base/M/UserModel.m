//
//  UserModel.m
//  banmen
//
//  Created by dong on 2017/7/17.
//  Copyright © 2017年 banmen. All rights reserved.
//

#import "UserModel.h"
#import "AFNetworking.h"
#import "OtherMacro.h"
#import "MJExtension.h"

@implementation UserModel

+(NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{
             @"srcfile" : @"cover.srcfile",
             @"userId" : @"id"
             };
}

-(void)netGetUserInfo{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    params[@"token"] = [defaults objectForKey:@"token"];
    [manager GET:[kDomainBaseUrl stringByAppendingString:@"auth/user"] parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            UserModel *userModel = [[UserModel alloc] init];
            NSDictionary *dict = responseObject[@"data"];
            userModel = [UserModel mj_objectWithKeyValues:dict];
            AFHTTPSessionManager *manager2 = [AFHTTPSessionManager manager];
            manager2.requestSerializer = [AFHTTPRequestSerializer serializer];
            NSMutableDictionary *params2 = [NSMutableDictionary dictionary];
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            params2[@"token"] = [defaults objectForKey:@"token"];
            [manager2 GET:[kDomainBaseUrl stringByAppendingString:@"survey/index"] parameters:params2 progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                UserModel *userModel2 = [[UserModel findAll] lastObject];
                NSDictionary *dict = responseObject[@"data"];
                userModel2 = [UserModel mj_objectWithKeyValues:dict];
                userModel2.isLogin = YES;
                userModel2.userId = userModel.userId;
                userModel2.account = userModel.account;
                userModel2.phone = userModel.phone;
                userModel2.srcfile = userModel.srcfile;
                [userModel2 saveOrUpdate];
                if ([self.delegate respondsToSelector:@selector(update)]) {
                    [self.delegate update];
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                
            }];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

@end
