//
//  HttpsManager.m
//  fanhua-ios
//
//  Created by 姜－pc on 2018/3/5.
//  Copyright © 2018年 姜－pc. All rights reserved.
//

#import "HttpsManager.h"
@implementation HttpsManager
+ (void)GET:(NSString *)URL
 parameters:(id)parameters
    success:(requestSuccessBlock)success
    failure:(requestFailureBlock)failure{
    [PPNetworkHelper GET:URL parameters:parameters success:^(id responseObject) {
        success( [HttpsManager tranToJsonResultWithResponse:responseObject]);
    } failure:^(NSError *error) {
        failure(error);
    }];
}


+ (void)GET:(NSString *)URL
 parameters:(id)parameters
responseCache:(PPHttpRequestCache)responseCache
    success:(requestSuccessBlock)success
    failure:(requestFailureBlock)failure{
    [PPNetworkHelper GET:URL parameters:parameters responseCache:^(id responseCache) {
          //success([HttpsManager tranToJsonResultWithResponse:responseObject]);
    } success:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];
}

+ (void)POST:(NSString *)URL
  parameters:(id)parameters
     success:(requestSuccessBlock)success
     failure:(requestFailureBlock)failure{
    [PPNetworkHelper POST:URL parameters:parameters success:^(id responseObject) {
//        if ([[NSString stringWithFormat:@"%@",[responseObject valueForKey:@"code"]] isEqualToString:@"50"]){
//            //显示登录页面
//            VerifyCodeViewController *vc = [[NSBundle mainBundle] loadNibNamed:
//                                               @"VerifyCodeViewController" owner:nil options:nil ].lastObject;
//            UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
//           kRootViewController = nav;
//            if ([MBProgressHUD allHUDsForView:kAppWindow].count == 0) {
//                 [MBProgressHUD showActivityMessageInWindow:@"登录信息已过期"timer:2];
//            }
//        } else {
         success( [HttpsManager tranToJsonResultWithResponse:responseObject]);
       // }
    } failure:^(NSError *error) {
        failure(error);
    }];
}


+ (void)POST:(NSString *)URL
  parameters:(id)parameters
responseCache:(PPHttpRequestCache)responseCache
     success:(requestSuccessBlock)success
     failure:(requestFailureBlock)failure{
    [PPNetworkHelper POST:URL parameters:parameters responseCache:^(id responseCache) {
        
        
    } success:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];
}


+ (void)uploadFileWithURL:(NSString *)URL
               parameters:(id)parameters
                     name:(NSString *)name
                 filePath:(NSString *)filePath
                 progress:(PPHttpProgress)progress
                  success:(requestSuccessBlock)success
                  failure:(requestFailureBlock)failure{
    [PPNetworkHelper uploadFileWithURL:URL parameters:parameters name:name filePath:filePath progress:progress success:^(id responseObject) {
          success( [HttpsManager tranToJsonResultWithResponse:responseObject]);
    } failure:^(NSError *error) {
        failure(error);
    }];
}


+ (void)uploadImagesWithURL:(NSString *)URL
                 parameters:(id)parameters
                       name:(NSString *)name
                     images:(NSArray<UIImage *> *)images
                  fileNames:(NSArray<NSString *> *)fileNames
                 imageScale:(CGFloat)imageScale
                  imageType:(NSString *)imageType
                   progress:(PPHttpProgress)progress
                    success:(requestSuccessBlock)success
                    failure:(requestFailureBlock)failure{
    [PPNetworkHelper uploadImagesWithURL:URL parameters:parameters name:name images:images fileNames:fileNames imageScale:imageScale imageType:imageType progress:progress success:^(id responseObject) {
          success( [HttpsManager tranToJsonResultWithResponse:responseObject]);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

+ (void)downloadWithURL:(NSString *)URL
                fileDir:(NSString *)fileDir
               progress:(PPHttpProgress)progress
                success:(void(^)(NSString *filePath))success
                failure:(requestFailureBlock)failure{
    [PPNetworkHelper downloadWithURL:URL fileDir:fileDir progress:progress success:^(NSString *filePath) {
        success(filePath);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

/**
 *  API结果转化为JsonResult
 *
 *  @param responseObject API返回结果
 *
 *  @return Json构造的API返回结果
 */

+(JsonResult *)tranToJsonResultWithResponse:(id)responseObject{
    if (responseObject == nil) {
        return nil;
    }
    //取得返回数据
    id dicResult = responseObject;
    //返回结果处理
    JsonResult *result = [[JsonResult alloc]init];
    result.code = [dicResult valueForKey:@"code"];
    result.msg =[dicResult valueForKey:@"msg"];
    result.data = [dicResult valueForKey:@"data"];
    //假如Code值为"50" token过期，跳转登录页面 根据API去补充逻辑
//    if ([[NSString stringWithFormat:@"%@",result.code] isEqualToString:@"50"]){
//        //显示登录页面
//        VerifyCodeViewController *vc = [[NSBundle mainBundle] loadNibNamed:
//                                           @"VerifyCodeViewController" owner:nil options:nil ].lastObject;
//        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
//        kRootViewController = nav;
//        if ([MBProgressHUD allHUDsForView:kAppWindow].count == 0) {
//            [MBProgressHUD showActivityMessageInWindow:@"登录信息已过期"timer:2];
//        }
//    }
    return result;
}
            
            
@end
