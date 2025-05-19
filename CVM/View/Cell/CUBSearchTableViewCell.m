//
//  CUBSearchTableViewCell.m
//  CUBInterview
//
//  Created by KunChan on 2019/10/18.
//  Copyright © 2019 KunChan. All rights reserved.
//

#import "CUBSearchTableViewCell.h"
#import "CUBSearchModel.h"

@interface CUBSearchTableViewCell() <UISearchBarDelegate>

@property (nonatomic, strong) UIButton *addButton;
@property (nonatomic, strong) UILabel *friendCountLabel;
@property (nonatomic, strong) UISearchBar *searchBar;

@end

@implementation CUBSearchTableViewCell

- (void)setEntity:(id)entity {
    
    [super setEntity:entity];
    
    CUBSearchModel *model = nil;
    if (![entity isMemberOfClass:[CUBSearchModel class]]) {
        return;
    }
    else {
        model = (CUBSearchModel *)entity;
    }
    
    self.friendCountLabel.text = [NSString stringWithFormat:@"好友列表 %@", model.friendCount];
    
}

- (void)setupUI {
    
    [super setupUI];

    self.addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.addButton setImage:[UIImage imageNamed:@"pinkAdd"] forState:UIControlStateNormal];
    [self.contentView addSubview:self.addButton];
    
    self.friendCountLabel = [[UILabel alloc] init];
    self.friendCountLabel.hidden = YES;
    [self.contentView addSubview:self.friendCountLabel];
    
    self.searchBar = [[UISearchBar alloc] init];
    self.searchBar.delegate = self;
    self.searchBar.placeholder = @"想轉一筆給誰呢？";
    self.searchBar.searchBarStyle = UISearchBarStyleMinimal;
    [self.contentView addSubview:self.searchBar];
    
}

- (void)setupAutolayout {
    
    [super setupAutolayout];
    
    [self.addButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(24, 24));
        make.centerY.equalTo(self.searchBar);
        make.right.equalTo(self.contentView).offset(-20);
    }];
    
    [self.friendCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.height.equalTo(@18);
        
        make.top.equalTo(self.contentView.mas_top).with.offset(10);
        make.left.equalTo(self.contentView.mas_left).with.offset(30);
        
    }];
    
    [self.searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.height.equalTo(@36);
        
        make.top.equalTo(self.contentView.mas_top).with.offset(15);
        make.left.equalTo(self.contentView.mas_left).with.offset(20);
        make.right.equalTo(self.contentView.mas_right).with.offset(-60);
        make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-10);
        
    }];
}

#pragma mark - UISearchBarDelegate
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar {
    [self.delegate search];
    return NO;
}

@end
