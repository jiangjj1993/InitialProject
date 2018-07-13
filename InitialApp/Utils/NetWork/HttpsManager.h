//
//  HttpsManager.h
//  fanhua-ios
//
//  Created by 姜－pc on 2018/3/5.
//  Copyright © 2018年 姜－pc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JsonResult.h"

//typedef void (^requestSuccessBlock) (id result);
//typedef void (^requestFailureBlock) (NSNumber* code, NSString *msg);
//typedef void (^CallProgressBlock) (NSProgress* progress);

typedef void (^requestSuccessBlock) (JsonResult *result);
typedef void (^requestFailureBlock) (NSError *err);
typedef void (^requestProgressBlock) (NSProgress *progress);
/// 缓存的Block
typedef void(^PPHttpRequestCache)(id responseCache);
/// 上传或者下载的进度, Progress.completedUnitCount:当前大小 - Progress.totalUnitCount:总大小
typedef void (^PPHttpProgress)(NSProgress *progress);

@interface HttpsManager : NSObject

/**
 *  GET请求,无缓存
 *
 *  @param URL        请求地址
 *  @param parameters 请求参数
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 *
 */
+ (void)GET:(NSString *)URL
                        parameters:(id)parameters
                           success:(requestSuccessBlock)success
                           failure:(requestFailureBlock)failure;

/**
 *  GET请求,自动缓存
 *
 *  @param URL           请求地址
 *  @param parameters    请求参数
 *  @param responseCache 缓存数据的回调
 *  @param success       请求成功的回调
 *  @param failure       请求失败的回调
 *
 */
+ (void)GET:(NSString *)URL
                        parameters:(id)parameters
                     responseCache:(PPHttpRequestCache)responseCache
                           success:(requestSuccessBlock)success
                           failure:(requestFailureBlock)failure;

/**
 *  POST请求,无缓存
 *
 *  @param URL        请求地址
 *  @param parameters 请求参数
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 *
 */
+ (void)POST:(NSString *)URL
                         parameters:(id)parameters
                            success:(requestSuccessBlock)success
                            failure:(requestFailureBlock)failure;

/**
 *  POST请求,自动缓存
 *
 *  @param URL           请求地址
 *  @param parameters    请求参数
 *  @param responseCache 缓存数据的回调
 *  @param success       请求成功的回调
 *  @param failure       请求失败的回调
 *
 */
+ (void)POST:(NSString *)URL
                         parameters:(id)parameters
                      responseCache:(PPHttpRequestCache)responseCache
                            success:(requestSuccessBlock)success
                            failure:(requestFailureBlock)failure;

/**
 *  上传文件
 *
 *  @param URL        请求地址
 *  @param parameters 请求参数
 *  @param name       文件对应服务器上的字段
 *  @param filePath   文件本地的沙盒路径
 *  @param progress   上传进度信息
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 *
 */
+ (void)uploadFileWithURL:(NSString *)URL
                                      parameters:(id)parameters
                                            name:(NSString *)name
                                        filePath:(NSString *)filePath
                                        progress:(PPHttpProgress)progress
                                         success:(requestSuccessBlock)success
                                         failure:(requestFailureBlock)failure;

/**
 *  上传单/多张图片
 *
 *  @param URL        请求地址
 *  @param parameters 请求参数
 *  @param name       图片对应服务器上的字段
 *  @param images     图片数组
 *  @param fileNames  图片文件名数组, 可以为nil, 数组内的文件名默认为当前日期时间"yyyyMMddHHmmss"
 *  @param imageScale 图片文件压缩比 范围 (0.f ~ 1.f)
 *  @param imageType  图片文件的类型,例:png、jpg(默认类型)....
 *  @param progress   上传进度信息
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 *
 */
+ (void)uploadImagesWithURL:(NSString *)URL
                                        parameters:(id)parameters
                                              name:(NSString *)name
                                            images:(NSArray<UIImage *> *)images
                                         fileNames:(NSArray<NSString *> *)fileNames
                                        imageScale:(CGFloat)imageScale
                                         imageType:(NSString *)imageType
                                          progress:(PPHttpProgress)progress
                                           success:(requestSuccessBlock)success
                                           failure:(requestFailureBlock)failure;

/**
 *  下载文件
 *
 *  @param URL      请求地址
 *  @param fileDir  文件存储目录(默认存储目录为Download)
 *  @param progress 文件下载的进度信息
 *  @param success  下载成功的回调(回调参数filePath:文件的路径)
 *  @param failure  下载失败的回调
 *
 */
+ (void)downloadWithURL:(NSString *)URL
                                       fileDir:(NSString *)fileDir
                                      progress:(PPHttpProgress)progress
                                       success:(void(^)(NSString *filePath))success
                                       failure:(requestFailureBlock)failure;





@end
