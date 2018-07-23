//
//  UserManager.m
//  InitialApp
//
//  Created by 姜－pc on 2018/7/16.
//  Copyright © 2018年 姜－pc. All rights reserved.
//

#import "UserManager.h"

@implementation UserManager

+ (UserManager *)sharedUserManager {
    static UserManager *sharedUserManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedUserManager = [[self alloc]init];
    });
    return sharedUserManager;
}

#pragma mark ————— 自动登录到服务器 —————
//-(void)autoLoginToServer:(loginBlock)completion{
//    
//}



#pragma mark ————— 带参数登录 —————
-(void)login:(NSDictionary *)params completion:(loginBlock)completion {
    [MBProgressHUD showActivityMessageInView:@"登录中..."];
    [HttpsManager POST:URL_user_login parameters:params success:^(JsonResult *result) {
        [MBProgressHUD hideHUD];
        //TODO: 假如登录成功
        self.curUserInfo = [UserInfo modelWithDictionary:result.data];
        [self saveUserInfo];
        self.isLogined = YES;
        completion(YES,@"登录成功");
         KPostNotification(KNotificationLoginStateChange, @YES);
    } failure:^(NSError *err) {
        [MBProgressHUD hideHUD];
        if (completion) {
            completion(NO,@"登录返回数据异常");
            KPostNotification(KNotificationLoginStateChange, @NO);
        }
    }];
}

#pragma mark ————— 储存用户信息 —————
-(void)saveUserInfo{
    if (self.curUserInfo) {
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        NSString *str = [self.curUserInfo modelToJSONString];
        [userDefaults setObject:str forKey:KUserModelCache];
//
//        YYCache *cache = [[YYCache alloc]initWithName:KUserCacheName];
//        NSDictionary *dic = [self.curUserInfo modelToJSONObject];
//        [cache setObject:dic forKey:KUserModelCache];
    }
}

#pragma mark ————— 加载缓存的用户信息 —————
-(BOOL)loadUserInfo{
     NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
     NSString *str = [userDefaults objectForKey:KUserModelCache];
     self.curUserInfo = [UserInfo modelWithJSON:str];
    if(self.curUserInfo) {
        return YES;
    } else {
        return NO;
    }
//    YYCache *cache = [[YYCache alloc]initWithName:KUserCacheName];
//    NSDictionary * userDic = (NSDictionary *)[cache objectForKey:KUserModelCache];
//    if (userDic) {
//        self.curUserInfo = [UserInfo modelWithJSON:userDic];
//        return YES;
//    }
}

#pragma mark ————— 被踢下线 —————
-(void)onKick{
    [self logout:nil];
}

#pragma mark ————— 退出登录 —————
- (void)logout:(void (^)(BOOL, NSString *))completion{
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
    
    [[UIApplication sharedApplication] unregisterForRemoteNotifications];
    
    self.curUserInfo = nil;
    self.isLogined = NO;
    
        //移除缓存
   NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults removeObjectForKey:KUserModelCache];
//    YYCache *cache = [[YYCache alloc]initWithName:KUserCacheName];
//    [cache removeAllObjectsWithBlock:^{
//        if (completion) {
//            completion(YES,nil);
//        }
//    }];
    
    KPostNotification(KNotificationLoginStateChange, @NO);
}

@end
