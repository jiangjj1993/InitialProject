//
//  Tool.h
//  fanhua-ios
//
//  Created by 姜－pc on 2018/3/2.
//  Copyright © 2018年 姜－pc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tool : NSObject

/**
 检测字符串是否是纯数字

 @param num str
 @return bool
 */
+ (BOOL)isNumber:(NSString *)num;

/**
 检测字符串是否是数字或字母组成

 @param num str
 @return bool
 */
+ (BOOL)isNumberOrLetter:(NSString *)num;

/**
 检测是否是手机号码

 @param mobileNum str
 @return bool
 */
+ (BOOL)isMobileNumber:(NSString *)mobileNum;

/**
 判断字符串是否为空或者都是空格

 @param string str
 @return bool
 */
+ (BOOL)isBlankString:(NSString *)string;

/**
 比较两个版本号的大小
 
 @param v1 第一个版本号
 @param v2 第二个版本号
 @return 版本号相等,返回0; v1小于v2,返回-1; 否则返回1.
 */
+ (NSInteger)compareVersion:(NSString *)v1 to:(NSString *)v2;

/**
 金额千位数上逗号显示
 
 @param text 传入数字
 @return 返回格式后的字符串
 */
+ (NSString *)positiveFormat:(NSString *)text;




/**
 将某个时间转化成 时间戳

 @param formatTime formatTime
 @param format format
 @return 时间戳
 */
+(NSString *)timeSwitchTimestamp:(NSString *)formatTime andFormatter:(NSString *)format;


/**
 将某个时间戳转化成 时间

 @param timestamp 时间戳
 @param format 格式
 @return 时间
 */
+(NSString *)timestampSwitchTime:(NSInteger)timestamp andFormatter:(NSString *)format;
@end
