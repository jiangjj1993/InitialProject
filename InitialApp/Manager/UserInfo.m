//
//  UserInfo.m
//  InitialApp
//
//  Created by 姜－pc on 2018/7/16.
//  Copyright © 2018年 姜－pc. All rights reserved.
//

#import "UserInfo.h"

@implementation UserInfo
- (void)encodeWithCoder:(nonnull NSCoder *)aCoder {
    [aCoder encodeObject:self.code forKey:@"code"];
    [aCoder encodeObject:self.wechat forKey:@"wechat"];
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.phone forKey:@"phone"];
    [aCoder encodeObject:self.headUrl forKey:@"headUrl"];
    [aCoder encodeObject:self.jobNumber forKey:@"jobNumber"];
    [aCoder encodeObject:self.companyId forKey:@"companyId"];
    [aCoder encodeObject:self.company forKey:@"company"];
    [aCoder encodeObject:self.departId forKey:@"departId"];
    [aCoder encodeObject:self.depart forKey:@"depart"];
    [aCoder encodeObject:self.roleFlag forKey:@"roleFlag"];
    [aCoder encodeObject:self.userId forKey:@"userId"];
}

- (nullable instancetype)initWithCoder:(nonnull NSCoder *)aDecoder {
    self.code = [aDecoder decodeObjectForKey:@"code"];
    self.wechat = [aDecoder decodeObjectForKey:@"wechat"];
    self.name = [aDecoder decodeObjectForKey:@"name"];
    self.phone = [aDecoder decodeObjectForKey:@"phone"];
    self.headUrl = [aDecoder decodeObjectForKey:@"headUrl"];
    self.jobNumber = [aDecoder decodeObjectForKey:@"jobNumber"];
    self.companyId = [aDecoder decodeObjectForKey:@"companyId"];
    self.company = [aDecoder decodeObjectForKey:@"company"];
    self.departId = [aDecoder decodeObjectForKey:@"departId"];
    self.depart = [aDecoder decodeObjectForKey:@"depart"];
    self.roleFlag = [aDecoder decodeObjectForKey:@"roleFlag"];
    self.userId = [aDecoder decodeObjectForKey:@"userId"];
    return self;
}
@end
