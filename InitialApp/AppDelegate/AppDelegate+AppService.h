//
//  AppDelegate+AppService.h
//  InitialApp
//
//  Created by 姜－pc on 2018/7/12.
//  Copyright © 2018年 姜－pc. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (AppService)

//初始化服务
-(void)initService;

//初始化 window
-(void)initWindow;

//初始化用户系统
-(void)initUserManager;

//监听网络状态
- (void)monitorNetworkStatus;

//初始化Bugly --腾讯异常上报功能
-(void)initBugly;



//单例
+ (AppDelegate *)shareAppDelegate;


/**
 当前顶层控制器
 */
-(UIViewController*) getCurrentVC;

-(UIViewController*) getCurrentUIVC;


@end
