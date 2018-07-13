//
//  JsonResult.h
//  fanhua-ios
//
//  Created by 姜－pc on 2018/3/5.
//  Copyright © 2018年 姜－pc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JsonResult : NSObject
@property(nonatomic,strong)NSNumber *code;
@property(nonatomic,strong)NSString *msg;
@property(nonatomic,strong)NSDictionary *data;
@end
