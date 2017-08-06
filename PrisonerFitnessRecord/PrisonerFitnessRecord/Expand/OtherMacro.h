//
//  OtherMacro.h
//  banmen
//
//  Created by FLYang on 2017/6/20.
//  Copyright © 2017年 banmen. All rights reserved.
//

#ifndef OtherMacro_h
#define OtherMacro_h

#define USER_DEFAULT        [NSUserDefaults standardUserDefaults]

#define SCREEN_HEIGHT       [[UIScreen mainScreen] bounds].size.height
#define SCREEN_WIDTH        [[UIScreen mainScreen] bounds].size.width
#define BOUNDS_WIDTH        self.bounds.size.width
#define BOUNDS_HEIGHT       self.bounds.size.height

typedef enum {
    product = 0,
    sales = 1
} HomeCategoryType;

typedef enum {
    sale = 0,
    unitPrice = 1,
    regional = 2,
    top = 3,
    channel = 4
} SalesCategoryType;

// API ROOT URL
//#define kDomainBaseUrl @"http://k.taihuoniao.com/saasApi/"           //生产环境
#define kDomainBaseUrl @"http://k.taihuoniao.com/saasApi/"             //  上线正式环境
//#define kDomainBaseUrl @"http://k.taihuoniao.com/saasApi/"     //  开发环境

//首页第一个滑动条的高度
#define XMGTitilesViewH 44;

//首页第一个滑动条的y值
#define XMGTitilesViewY 1;

#endif /* OtherMacro_h */
