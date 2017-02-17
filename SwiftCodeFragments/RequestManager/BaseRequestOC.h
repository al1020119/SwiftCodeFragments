//
//  BaseRequestOC.h
//  SwiftCodeFragments
//
//  Created by zhangmingwei on 2017/2/17.
//  Copyright © 2017年 SpeedX. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <AFNetworking/AFNetworking.h>
#import "SingtonMacros.h"

#define CLIENT_API_VERSION   @"/v2.7"                   //服务器API版本号

//没有网络连接的错误码
#define NETWORK_INVALID_CODE -3010
#define HTTP_ERROE_CODE      -3020
#define SOCIAL_LOGIN_FAILED  -3030
#define REQUEST_ERROR_PARAMS -3040
#define ACCOUNT_IS_BIND      1012               // 账号已被绑定

#define RESPONSE_CODE_KEY    @"code"
#define RESPONSE_MESSAGE_KEY @"message"
#define RESPONSE_RESULT_KEY  @"result"


typedef void (^NetworkInvalidBlock) (BOOL networkValid, NSString *message);
typedef void (^RequestResponseBlock) (BOOL successed, NSInteger code, NSString *responseString);


@interface BaseRequestOC : NSObject


@property (nonatomic, strong) AFHTTPSessionManager *sessionManager;
@property (nonatomic, strong) NSString  *googleNickName;    // google登录的昵称

//骑行记录自动修复后台控制开关。 YES:开启自动修复骑行记录功能， NO:关闭自动修复功能
@property (nonatomic, assign) BOOL         cyclingRecordAutoRepair;

instance_interface(BaseRequestOC, defaultManager)

/**
 *  @brief  创建网络请求的 Cookies, 该方法需要在用户登录成功以后，发起任何一个网络请求之前调用.
 */
- (void)      createRequestCookie;

/**
 *  @brief  清除本地Cookie, 该方法需要在退出登录时调用，使新登录的用户使用自己对应的Cookie
 */
- (void)      clearRequestCookie;

/**
 *  @brief 设置请求头, 当切换系统区域以后，该方法需要重新调用，重新设置请求头
 */
- (void)      createRequestHeader;

/**
 *  @brief  判断当前是否存在网络连接
 *
 *  @return YES:已经接入网络，NO:未连接网络
 */
+ (BOOL)      isNetworkValid;

/**
 *  @brief  获取设备型号（仅 iPhone）
 *
 *  @return 设备型号
 */
+ (NSString *)getiPhoneModel;

/**
 *  @brief  POST请求方法，父类方法（在AFNetworking的请求的基础上添加网络判断）
 *
 *  @param  URLString         URLString
 *  @param  parameters        请求参数
 *  @param  networkValidBlock 网络状态block
 *  @param  success           请求成功的block
 *  @param  failure           请求失败的block
 */
+ (void)POST:(NSString *)URLString parameters:(id)parameters networkStatusBlock:(NetworkInvalidBlock)networkValidBlock success:(void (^)(NSURLSessionDataTask *task, id responseObject))success failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;

/**
 *  @brief  DELETE请求方法，父类方法（在AFNetworking的请求的基础上添加网络判断）
 *
 *  @param  URLString         URLString
 *  @param  parameters        请求参数
 *  @param  networkValidBlock 网络状态block
 *  @param  success           请求成功的block
 *  @param  failure           请求失败的block
 */
+ (void)DELETE:(NSString *)URLString parameters:(id)parameters networkStatusBlock:(NetworkInvalidBlock)networkValidBlock success:(void (^)(NSURLSessionDataTask *task, id responseObject))success failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;

/**
 *  @brief  生成网络请求 -- post
 *
 *  @param  urlString url
 *  @param  params    参数
 *  @param  response  block
 */
+ (void)createRequest:(NSString *)urlString params:(NSDictionary *)params response:(RequestResponseBlock)response;


/**
 生成get方式的网络请求 --- get
 
 @param urlString url
 @param params 参数列表
 @param response 返回block.
 */
+ (void)getRequest:(NSString*)urlString params:(NSDictionary*)params response:(RequestResponseBlock)response;

/**
 *  @brief  生成网络请求 -- delete
 *
 *  @param  urlString url
 *  @param  params    参数
 *  @param  response  block
 */
+ (void)deleteRequest:(NSString *)urlString params:(NSDictionary *)params response:(RequestResponseBlock)response;


@end
