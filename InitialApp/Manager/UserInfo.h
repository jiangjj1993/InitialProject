//
//  UserInfo.h
//  InitialApp
//
//  Created by 姜－pc on 2018/7/16.
//  Copyright © 2018年 姜－pc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInfo : NSObject<NSCoding>
@property (nonatomic,copy) NSString *code;   //--编号
@property (nonatomic,copy) NSString *wechat; //--微信号
@property (nonatomic,copy) NSString *name;   //--姓名
@property (nonatomic,copy) NSString *phone; //--电话
@property (nonatomic,copy) NSString *headUrl;  //--照片
@property (nonatomic,copy) NSString *jobNumber; //--工号
@property (nonatomic,copy) NSString *companyId; //--公司ID
@property (nonatomic,copy) NSString *company;  //--公司简称
@property (nonatomic,copy) NSString *departId;  //--部门ID
@property (nonatomic,copy) NSString *depart;  //--部门简称
@property (nonatomic,copy) NSString *roleFlag;  //-- 0是司机；1-普通业务人员
@property (nonatomic,copy) NSString *userId;//买方联系人ID
@end
