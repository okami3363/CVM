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
    
    self.friendCountLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.friendCountLabel];
    
    self.searchBar = [[UISearchBar alloc] init];
    self.searchBar.delegate = self;
    self.searchBar.placeholder = @"想轉一筆給誰呢？";
    [self.contentView addSubview:self.searchBar];
    
}

- (void)setupAutolayout {
    
    [super setupAutolayout];
    
    [self.friendCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.height.equalTo(@18);
        
        make.top.equalTo(self.contentView.mas_top).with.offset(10);
        make.left.equalTo(self.contentView.mas_left).with.offset(30);
        
    }];
    
    [self.searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.height.equalTo(@36);
        
        make.top.equalTo(self.friendCountLabel.mas_bottom).with.offset(15);
        make.left.equalTo(self.contentView.mas_left).with.offset(30);
        make.right.equalTo(self.contentView.mas_right).with.offset(-30);
        make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-10);
        
    }];
}

#pragma mark - UISearchBarDelegate
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar {
    [self.delegate search];
    return NO;
}

//- (void)awakeFromNib {
//    [super awakeFromNib];
//    // Initialization code
//}
//
//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//
//    // Configure the view for the selected state
//}

@end
