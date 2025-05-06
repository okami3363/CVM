//
//  CUBFriendViewModel.h
//  CVM
//
//  Created by 黃崑展 on 2024/4/8.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger,CUBTestType){
    CUBTestType1 = 1,   //(1) 無好友畫面
    CUBTestType2,       //(2) 只有好友列表
    CUBTestType3,       //(3) 好友列表含邀請
};

@interface CUBFriendViewModel : NSObject

@property CUBTestType testType;
@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, strong) NSMutableArray *results;

- (void)get_status_no_friend:(void(^)(NSArray*))entitiesData;
- (void)get_status_friend:(void(^)(NSArray*))entitiesData;
- (void)get_status_friend_and_invite:(void(^)(NSArray*))entitiesData;

@end

NS_ASSUME_NONNULL_END
