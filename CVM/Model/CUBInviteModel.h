//
//  CUBInviteModel.h
//  CUBInterview
//
//  Created by KunChan on 2019/10/18.
//  Copyright © 2019 KunChan. All rights reserved.
//

#import "CUBFriendModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface CUBInviteModel : CUBFriendModel

@property BOOL isLeader;
@property BOOL isClose;
@property (nonatomic, strong) NSMutableArray <CUBInviteModel *> *group;

@end

NS_ASSUME_NONNULL_END
