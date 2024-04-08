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
    switch ([model.status intValue]) {
        case 0:
            statusString = @"邀請已送出";
            statusColor = [UIColor colorWithRed:153/255.0f green:153/255.0f blue:153/255.0f alpha:1.0f];
            break;
        case 1:
            statusString = @"可轉帳";
            statusColor = [UIColor colorWithRed:236/255.0f green:0/255.0f blue:140/255.0f alpha:1.0f];
            break;
        case 2:
            statusString = @"邀請";
            statusColor = [UIColor colorWithRed:236/255.0f green:0/255.0f blue:140/255.0f alpha:1.0f];
            break;
            
        default:
            break;
    }
    
    [self.statusButton setTitle:statusString forState:UIControlStateNormal];
    [self.statusButton setTitleColor:statusColor forState:UIControlStateNormal];
    
    self.statusButton.layer.borderColor = [statusColor CGColor];
    
}

- (void)setupUI {
    
    [super setupUI];
    
    self.starImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star"]];
    self.starImageView.hidden = YES;
    [self.contentView addSubview:self.starImageView];
    
    self.userImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"user"]];
    [self.contentView addSubview:self.userImageView];
    
    self.nameLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.nameLabel];
    
    self.statusButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.statusButton.layer.borderWidth = 1;
    self.statusButton.layer.cornerRadius = 2;
    self.statusButton.layer.masksToBounds = YES;
    [self.contentView addSubview:self.statusButton];
    
}

- (void)setupAutolayout {
    
    [super setupAutolayout];
    
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
        
        make.top.equalTo(self.contentView.mas_top).with.offset(18);
        make.left.equalTo(self.contentView.mas_right).with.offset(-(30+90));
        make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-18);
        
    }];

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
