//
//  CUBFriendModel.h
//  CUBInterview
//
//  Created by KunChan on 2019/10/17.
//  Copyright © 2019 KunChan. All rights reserved.
//

#import "CUBModelBaseClass.h"

NS_ASSUME_NONNULL_BEGIN

@interface CUBFriendModel : CUBModelBaseClass


@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, copy, readonly) NSNumber *status;
@property (nonatomic, copy, readonly) NSString *isTop;
@property (nonatomic, copy, readonly) NSString *fid;
@property (nonatomic, copy, readonly) NSString *updateDate;

@end

NS_ASSUME_NONNULL_END
