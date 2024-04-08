//
//  CUBNetworking.m
//  CUBInterview
//
//  Created by KunChan on 2019/10/17.
//  Copyright © 2019 KunChan. All rights reserved.
//

#import "CUBNetworking.h"
#import <AFNetworking/AFNetworking.h>

@implementation CUBNetworking

+ (instancetype)sharedInstance {
    
    static id sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [super allocWithZone:NULL];
    });
    
    return sharedInstance;
    
}

+ (instancetype)allocWithZone:(struct _NSZone*)zone {
    
    return [self sharedInstance];
    
}

- (void)getWithUrlString:(NSString *)urlString success:(HttpSuccess)success failure:(HttpFailure)failure {
    //创建请求管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    //内容类型
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json",@"text/javascript",@"text/html", nil];
    //get请求
    [manager GET:urlString parameters:nil headers:@{} progress:^(NSProgress * _Nonnull downloadProgress) {
        //数据请求的进度
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
    
}

@end
