//
//  AppDelegate.h
//  InitialApp
//
//  Created by 姜－pc on 2018/7/12.
//  Copyright © 2018年 姜－pc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainTabBarController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

/**
 这里面只做调用，具体实现放到 AppDelegate+AppService 或者Manager里面，防止代码过多不清晰
 */
@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) MainTabBarController *mainTabBar;

@end

