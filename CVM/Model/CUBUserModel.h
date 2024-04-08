//
//  CUBUserModel.h
//  CUBInterview
//
//  Created by KunChan on 2019/10/18.
//  Copyright © 2019 KunChan. All rights reserved.
//

#import "CUBModelBaseClass.h"

NS_ASSUME_NONNULL_BEGIN

@interface CUBUserModel : CUBModelBaseClass

@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, copy, readonly) NSString *kokoid;

@end

NS_ASSUME_NONNULL_END
