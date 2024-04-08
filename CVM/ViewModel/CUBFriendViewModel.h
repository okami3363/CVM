//
//  CUBFriendViewModel.h
//  CVM
//
//  Created by 黃崑展 on 2024/4/8.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CUBFriendViewModel : NSObject

- (void)get_status_no_friend:(void(^)(NSArray*))entitiesData;
- (void)get_status_friend:(void(^)(NSArray*))entitiesData;
- (void)get_status_friend_and_invite:(void(^)(NSArray*))entitiesData;

@end

NS_ASSUME_NONNULL_END
