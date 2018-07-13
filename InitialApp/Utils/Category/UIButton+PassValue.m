//
//  UIButton+PassValue.m
//  fanhua-ios
//
//  Created by 姜－pc on 2018/3/18.
//  Copyright © 2018年 姜－pc. All rights reserved.
//

#import "UIButton+PassValue.h"

@implementation UIButton (PassValue)

-(NSDictionary *)paramDic{
    return objc_getAssociatedObject(self, _cmd);
}
-(void)setParamDic:(NSDictionary *)paramDic{
    objc_setAssociatedObject(self, @selector(paramDic), paramDic, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
