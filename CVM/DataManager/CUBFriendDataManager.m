//
//  CUBFriendDataManager.m
//  CUBInterview
//
//  Created by KunChan on 2019/10/17.
//  Copyright © 2019 KunChan. All rights reserved.
//

#import "CUBFriendDataManager.h"
#import "CUBApiClientCenter.h"


@implementation CUBFriendDataManager

- (void)getUserDataSuccess:(void (^)(NSArray *success))success failure:(void (^)(NSError *error))failure {
    NSString *urlString = @"https://okami3363.github.io/man.json";
    
    [[CUBApiClientCenter sharedInstance] httpGetRespondArrayDataHandel:urlString success:^(NSArray * _Nonnull dataArrry) {
        success(dataArrry);
    } failure:^(NSError * _Nonnull error) {
        failure(error);
    }];
}

- (void)getNoFriendSuccess:(void (^)(NSArray *success))success failure:(void (^)(NSError *error))failure {
    NSString *urlString = @"https://okami3363.github.io/friend4.json";
    
    [[CUBApiClientCenter sharedInstance] httpGetRespondArrayDataHandel:urlString success:^(NSArray * _Nonnull dataArrry) {
        success(dataArrry);
    } failure:^(NSError * _Nonnull error) {
        failure(error);
    }];
}

- (void)getFriend1Success:(void (^)(NSArray * _Nonnull))success failure:(void (^)(NSError * _Nonnull))failure {
    
    NSString *urlString = @"https://okami3363.github.io/friend1.json";
    
    [[CUBApiClientCenter sharedInstance] httpGetRespondArrayDataHandel:urlString success:^(NSArray * _Nonnull dataArrry) {
        success(dataArrry);
    } failure:^(NSError * _Nonnull error) {
        failure(error);
    }];
    
}

- (void)getFriend2Success:(void (^)(NSArray * _Nonnull))success failure:(void (^)(NSError * _Nonnull))failure {
    
    NSString *urlString = @"https://okami3363.github.io/friend2.json";
    
    [[CUBApiClientCenter sharedInstance] httpGetRespondArrayDataHandel:urlString success:^(NSArray * _Nonnull dataArrry) {
        success(dataArrry);
    } failure:^(NSError * _Nonnull error) {
        failure(error);
    }];
    
}

- (void)getInviteSuccess:(void (^)(NSArray *success))success failure:(void (^)(NSError *error))failure {
    
    NSString *urlString = @"https://okami3363.github.io/friend3.json";
    
    [[CUBApiClientCenter sharedInstance] httpGetRespondArrayDataHandel:urlString success:^(NSArray * _Nonnull dataArrry) {
        success(dataArrry);
    } failure:^(NSError * _Nonnull error) {
        failure(error);
    }];
    
}

@end
