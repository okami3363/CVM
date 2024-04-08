//
//  CUBTableViewCellBaseClass.h
//  CUBInterview
//
//  Created by KunChan on 2019/10/18.
//  Copyright © 2019 KunChan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
#import "CUBTableViewCellProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface CUBTableViewCellBaseClass : UITableViewCell

@property (nonatomic, strong) id entity;
@property (nonatomic, weak) id <CUBTableViewCellProtocol> delegate;

- (void)setupUI;
- (void)setupAutolayout;

@end

NS_ASSUME_NONNULL_END
