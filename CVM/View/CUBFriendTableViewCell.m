//
//  CUBFriendTableViewCell.m
//  CUBInterview
//
//  Created by KunChan on 2019/10/17.
//  Copyright © 2019 KunChan. All rights reserved.
//

#import "CUBFriendTableViewCell.h"
#import "CUBFriendModel.h"

@interface CUBFriendTableViewCell()

@property (nonatomic, strong) UIButton *transferButton;
@property (nonatomic, strong) UIImageView *starImageView;
@property (nonatomic, strong) UIImageView *userImageView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UIButton *statusButton;

@end

@implementation CUBFriendTableViewCell

- (void)setEntity:(id)entity {
    
    [super setEntity:entity];
    
    CUBFriendModel *model = nil;
    if (![entity isMemberOfClass:[CUBFriendModel class]]) {
        return;
    }
    else {
        model = (CUBFriendModel *)entity;
    }
    
    self.starImageView.hidden = [model.isTop boolValue];
    self.nameLabel.text = model.name;
    NSString *statusString = @"";
    UIColor *statusColor = [UIColor clearColor];
    UIImage *img = nil;
    UIColor  *_Nonnull borderColor = [UIColor clearColor];
    CGSize buttonSize = CGSizeMake(60, 24);
    
    switch ([model.status intValue]) {
        case 0:
            statusString = @"邀請中";
            statusColor = [UIColor colorWithRed:153/255.0f green:153/255.0f blue:153/255.0f alpha:1.0f];
            borderColor = [UIColor colorWithRed:201/255.0f green:201/255.0f blue:201/255.0f alpha:1.0f];
            break;
        case 1:
            img = [UIImage imageNamed:@"more"];
            buttonSize = CGSizeMake(44, 24);
            break;
        case 2:
            img = [UIImage imageNamed:@"more"];
            buttonSize = CGSizeMake(44, 24);
            break;
    }
    
    [self.statusButton setTitle:statusString forState:UIControlStateNormal];
    [self.statusButton setTitleColor:statusColor forState:UIControlStateNormal];
    [self.statusButton setImage:img forState:UIControlStateNormal];
    
    self.statusButton.layer.borderColor = [borderColor CGColor];
    [self.statusButton mas_updateConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(buttonSize);
    }];
    
}

- (void)setupUI {
    
    [super setupUI];
    
    self.lineView = [[UIView alloc] init];
    self.lineView.backgroundColor = [UIColor colorWithRed:228/255.0f green:228/255.0f blue:228/255.0f alpha:1.0f];
    [self.contentView addSubview:self.lineView];
    
    self.transferButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.transferButton setTitle:@"轉帳" forState:UIControlStateNormal];
    self.transferButton.titleLabel.font = [UIFont systemFontOfSize:14.0f];
    UIColor  *_Nonnull pinkColor = [UIColor colorWithRed:236/255.0f green:0/255.0f blue:140/255.0f alpha:1.0f];
    self.transferButton.layer.borderColor = [pinkColor CGColor];
    self.transferButton.layer.borderWidth = 1.0f;
    self.transferButton.clipsToBounds = YES;
    self.transferButton.layer.cornerRadius = 2.0f;
    [self.transferButton setTitleColor:pinkColor forState:UIControlStateNormal];
    [self.contentView addSubview:self.transferButton];
    
    self.starImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star"]];
    self.starImageView.hidden = YES;
    [self.contentView addSubview:self.starImageView];
    
    self.userImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"user"]];
    [self.contentView addSubview:self.userImageView];
    
    self.nameLabel = [[UILabel alloc] init];
    self.nameLabel.textColor = [UIColor colorWithRed:71/255.0f green:71/255.0f blue:71/255.0f alpha:1.0f];
    [self.contentView addSubview:self.nameLabel];
    
    self.statusButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.statusButton.layer.borderWidth = 1;
    self.statusButton.layer.cornerRadius = 2;
    self.statusButton.layer.masksToBounds = YES;
    self.statusButton.titleLabel.font = [UIFont systemFontOfSize:14.0f];
    [self.contentView addSubview:self.statusButton];
    
}

- (void)setupAutolayout {
    
    [super setupAutolayout];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@1);
        make.bottom.equalTo(self.contentView);
        make.left.equalTo(self.nameLabel);
        make.right.equalTo(self.contentView).offset(-30);
    }];
    
    [self.transferButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(47, 24));
        make.right.equalTo(self.statusButton.mas_left).offset(-10);
        make.centerY.equalTo(self.statusButton);
    }];
    
    [self.starImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.equalTo(@14);
        make.height.equalTo(@14);
        
        make.top.equalTo(self.contentView.mas_top).with.offset(23);
        make.left.equalTo(self.contentView.mas_left).with.offset(30);
        make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-23);
        
    }];
    
    [self.userImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.equalTo(@40);
        make.height.equalTo(@40);
        
        make.left.equalTo(self.starImageView.mas_right).with.offset(6);
        make.centerY.equalTo(self.contentView);
        
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.contentView.mas_top).with.offset(19);
        make.left.equalTo(self.userImageView.mas_right).with.offset(15);
        make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-19);
        
    }];
    
    [self.statusButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(60, 24));
        make.centerY.equalTo(self.nameLabel);
        make.right.equalTo(self.contentView.mas_right).with.offset(-20);
        make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-18);
        
    }];

}

@end
