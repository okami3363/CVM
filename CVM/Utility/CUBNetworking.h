//
//  CUBNetworking.h
//  CUBInterview
//
//  Created by KunChan on 2019/10/17.
//  Copyright © 2019 KunChan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CUBNetworking : NSObject

//宏定义成功block 回调成功后得到的信息
typedef void (^HttpSuccess)(id _Nonnull data);
//宏定义失败block 回调失败信息
typedef void (^HttpFailure)(NSError * _Nullable error);

+ (instancetype)sharedInstance;

- (void)getWithUrlString:(NSString * _Nonnull ) urlString success:(HttpSuccess _Nonnull )success failure:(HttpFailure _Nullable )failure;


@end

NS_ASSUME_NONNULL_END
