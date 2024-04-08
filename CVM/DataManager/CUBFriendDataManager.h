//
//  CUBFriendDataManager.h
//  CUBInterview
//
//  Created by KunChan on 2019/10/17.
//  Copyright © 2019 KunChan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CUBFriendDataManager : NSObject

- (void)getUserDataSuccess:(void (^)(NSArray *success))success failure:(void (^)(NSError *error))failure;

- (void)getNoFriendSuccess:(void (^)(NSArray *success))success failure:(void (^)(NSError *error))failure;

- (void)getFriend1Success:(void (^)(NSArray *success))success failure:(void (^)(NSError *error))failure;

- (void)getFriend2Success:(void (^)(NSArray *success))success failure:(void (^)(NSError *error))failure;

- (void)getInviteSuccess:(void (^)(NSArray *success))success failure:(void (^)(NSError *error))failure;

@end

NS_ASSUME_NONNULL_END
