//
//  UserManager.h
//  InitialApp
//
//  Created by 姜－pc on 2018/7/16.
//  Copyright © 2018年 姜－pc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserInfo.h"

typedef void (^loginBlock)(BOOL success, NSString * des);

#define userManager [UserManager sharedUserManager]
#define isLogin [UserManager sharedUserManager].isLogined
#define curUser [UserManager sharedUserManager].curUserInfo
/**
 包含用户相关服务
 */
@interface UserManager : NSObject
//单例
+ (UserManager *) sharedUserManager;

//当前用户
@property (nonatomic, strong) UserInfo *curUserInfo;
@property (nonatomic, assign) BOOL isLogined;

/**
 带参登录
 @param params 参数，手机和账号登录需要
 @param completion 回调
 */
-(void)login:(NSDictionary *)params completion:(loginBlock)completion;

/**
 自动登录
 
 @param completion 回调
 */
//-(void)autoLoginToServer:(loginBlock)completion;

/**
 退出登录
 
 @param completion 回调
 */
- (void)logout:(loginBlock)completion;

/**
 加载缓存用户数据
 
 @return 是否成功
 */
-(BOOL)loadUserInfo;

@end
