//
//  CUBFriendViewModel.m
//  CVM
//
//  Created by 黃崑展 on 2024/4/8.
//

#import "CUBSegmentModel.h"
#import "CUBFriendViewModel.h"
#import "CUBFriendDataManager.h"
#import "CUBApiClientCenter.h"
#import "CUBUserModel.h"
#import "CUBNoFriendModel.h"
#import "CUBSearchModel.h"
#import "CUBFriendModel.h"
#import "CUBInviteModel.h"

@interface CUBFriendViewModel ()
@property (nonatomic, strong) CUBFriendDataManager *manager;
@end

@implementation CUBFriendViewModel
@synthesize manager = _manager;

-(instancetype)init {
    
    self = [super init];
    if (self) {
        _dataSource = @[].mutableCopy;
        _manager = [[CUBFriendDataManager alloc] init];
        
    }
    return self;
    
}

- (void)get_status_no_friend:(void(^)(NSArray*))entitiesData {
    
    __block NSMutableArray *muArray = @[].mutableCopy;
    __block NSMutableArray *user = @[].mutableCopy;
    __block NSMutableArray *friend = @[].mutableCopy;
    
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_group_enter(group);
    [self getUserData:^(NSArray * _Nonnull success) {
        [user addObjectsFromArray:success];
        dispatch_group_leave(group);
    }];
    
    dispatch_group_enter(group);
    [self getNoFriend:^(NSArray * _Nonnull success) {
        [friend addObjectsFromArray:success];
        dispatch_group_leave(group);
    }];
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        [muArray addObjectsFromArray:user];
        [muArray addObject:[[CUBSegmentModel alloc] init]];
        [muArray addObjectsFromArray:friend];
        entitiesData(muArray);
    });
    
}

- (void)get_status_friend:(void(^)(NSArray*))entitiesData {
    
    __block NSMutableArray *muArray = @[].mutableCopy;
    __block NSMutableArray *user = @[].mutableCopy;
    __block NSMutableArray *friend = @[].mutableCopy;
    
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_group_enter(group);
    [self getUserData:^(NSArray * _Nonnull success) {
        [user addObjectsFromArray:success];
        dispatch_group_leave(group);
    }];
    
    dispatch_group_enter(group);
    [self getFriend:^(NSArray * _Nonnull success) {
        [friend addObjectsFromArray:success];
        dispatch_group_leave(group);
    }];
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        [muArray addObjectsFromArray:user];
        [muArray addObject:[[CUBSegmentModel alloc] init]];
        [muArray addObjectsFromArray:friend];
        entitiesData(muArray);
    });
    
}

- (void)get_status_friend_and_invite:(void(^)(NSArray*))entitiesData {
    
    __block NSMutableArray *muArray = @[].mutableCopy;
    __block NSMutableArray *user = @[].mutableCopy;
    __block NSMutableArray *friend = @[].mutableCopy;
    __block NSMutableArray *invite = @[].mutableCopy;
    
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_group_enter(group);
    [self getUserData:^(NSArray * _Nonnull success) {
        [user addObjectsFromArray:success];
        dispatch_group_leave(group);
    }];
    
    dispatch_group_enter(group);
    [self getFriend:^(NSArray * _Nonnull success) {
        [friend addObjectsFromArray:success];
        dispatch_group_leave(group);
    }];
    
    dispatch_group_enter(group);
    [self getInvite:^(NSArray * _Nonnull success) {
        [invite addObjectsFromArray:success];
        dispatch_group_leave(group);
    }];
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        [muArray addObjectsFromArray:user];
        [muArray addObjectsFromArray:invite];
        [muArray addObject:[[CUBSegmentModel alloc] init]];
        [muArray addObjectsFromArray:friend];
        entitiesData(muArray);
    });
    
}

#pragma mark - private

- (void)getUserData:(void(^)(NSArray*))entitiesData {
    
    NSMutableArray *user = @[].mutableCopy;
    
    [self.manager getUserDataSuccess:^(id  _Nonnull success) {
        
        NSMutableArray *array = [[CUBApiClientCenter sharedInstance] modelOfClass:[CUBUserModel class] fromJSONDictionaryArray:success];
        [user addObjectsFromArray:array];
        
        entitiesData(user);
        
    } failure:^(NSError * _Nullable error) {
        entitiesData(@[]);
    }];
    
}

- (void)getNoFriend:(void(^)(NSArray*))entitiesData {
    
    NSMutableArray *friend = @[].mutableCopy;
    
    [self.manager getNoFriendSuccess:^(id  _Nonnull success) {
        
        NSMutableArray *array = [[CUBApiClientCenter sharedInstance] modelOfClass:[CUBUserModel class] fromJSONDictionaryArray:success];
        [friend addObjectsFromArray:array];
        
        NSMutableArray *filter = [self friendFilter:friend];
        
        entitiesData(filter);
        
    } failure:^(NSError * _Nullable error) {
        entitiesData(@[]);
    }];
    
}

- (void)getFriend:(void(^)(NSArray*))entitiesData {
    
    __block NSMutableArray *muArray = @[].mutableCopy;
    __block NSMutableArray *friend = @[].mutableCopy;
    __block NSMutableArray *friend2 = @[].mutableCopy;
    
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_group_enter(group);
    [self.manager getFriend1Success:^(NSArray * _Nonnull success) {
        
        NSMutableArray *array = [[CUBApiClientCenter sharedInstance] modelOfClass:[CUBFriendModel class] fromJSONDictionaryArray:success];
        
        [friend addObjectsFromArray:array];
        
        dispatch_group_leave(group);
        
    } failure:^(NSError * _Nonnull error) {
        
        dispatch_group_leave(group);
        
    }];
    
    dispatch_group_enter(group);
    [self.manager getFriend2Success:^(NSArray * _Nonnull success) {
        
        NSMutableArray *array = [[CUBApiClientCenter sharedInstance] modelOfClass:[CUBFriendModel class] fromJSONDictionaryArray:success];
        
        [friend2 addObjectsFromArray:array];
        
        dispatch_group_leave(group);
        
    } failure:^(NSError * _Nonnull error) {
        
        dispatch_group_leave(group);
        
    }];
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        
        [muArray addObjectsFromArray:friend];
        [muArray addObjectsFromArray:friend2];
        
        NSMutableArray *filter = [self friendFilter:muArray];
        
        entitiesData(filter);
        
    });
    
}

- (void)getInvite:(void(^)(NSArray*))entitiesData {
    
    NSMutableArray *invite = @[].mutableCopy;
    
    [self.manager getInviteSuccess:^(id  _Nonnull success) {
        
        NSMutableArray *array = [[CUBApiClientCenter sharedInstance] modelOfClass:[CUBInviteModel class] fromJSONDictionaryArray:success];
        [invite addObjectsFromArray:array];
        
        NSMutableArray *group = [self inViteGroup:invite];
        
        entitiesData(group);
        
    } failure:^(NSError * _Nullable error) {
        entitiesData(@[]);
    }];
    
}

- (NSMutableArray *)friendFilter:(NSMutableArray *)friend {
    
    NSMutableArray *origin = friend.mutableCopy;
    for (CUBFriendModel *model in origin) {
        
        for (CUBFriendModel *model2 in origin) {
            if ([model.fid intValue] == [model2.fid intValue]) {
                if ([model.updateDate intValue] < [model2.updateDate intValue]) {
                    [friend removeObject:model];
                }
            }
        }
    }
    
    if (friend.count == 0) {
        CUBNoFriendModel *model = [[CUBNoFriendModel alloc] init];
        [friend addObject:model];
    }
    else {
        CUBSearchModel *model = [[CUBSearchModel alloc] init];
        model.friendCount = [NSNumber numberWithInteger:friend.count];
        [friend insertObject:model atIndex:0];
    }
    
    return friend;
    
}

- (NSMutableArray *)inViteGroup:(NSMutableArray *)invite {
    
    if (invite.count<2) {
        return invite;
    }
    NSMutableArray *group = [NSMutableArray arrayWithArray:invite];
    CUBInviteModel *model = [invite firstObject];
    [group removeObjectAtIndex:0];
    
    model.isLeader = YES;
    model.isClose = YES;
    model.group = [NSMutableArray arrayWithArray:group];
    
    return @[model].mutableCopy;
}


@end
