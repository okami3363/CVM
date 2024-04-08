//
//  CUBUserTableViewCell.m
//  CUBInterview
//
//  Created by KunChan on 2019/10/18.
//  Copyright © 2019 KunChan. All rights reserved.
//

#import "CUBUserTableViewCell.h"
#import "CUBUserModel.h"

@interface CUBUserTableViewCell()

@property (nonatomic, strong) UIImageView *userImageView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *kokoIdLabel;
@property (nonatomic, strong) UIView *view;

@property (nonatomic, strong) UIButton *testButton;
@property (nonatomic, strong) UIButton *test2Button;
@property (nonatomic, strong) UIButton *test3Button;

@end

@implementation CUBUserTableViewCell

- (void)setEntity:(id)entity {
    
    [super setEntity:entity];
    
    CUBUserModel *model = nil;
    if (![entity isMemberOfClass:[CUBUserModel class]]) {
        return;
    }
    else {
        model = (CUBUserModel *)entity;
    }
    
    self.nameLabel.text = model.name;
    self.kokoIdLabel.text = [NSString stringWithFormat:@"KOKO ID：%@", model.kokoid];
    
    
}

- (void)setupUI {
    
    [super setupUI];
    
    self.nameLabel = [[UILabel alloc] init];
    self.nameLabel.font = [UIFont boldSystemFontOfSize:18];
    [self.contentView addSubview:self.nameLabel];
    
    self.kokoIdLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.kokoIdLabel];
    
    self.userImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"user"]];
    [self.contentView addSubview:self.userImageView];
    
    self.view = [[UIView alloc] init];
    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.075f];
    [self.contentView addSubview:self.view];
    
    UIColor *testColor = [UIColor colorWithRed:236/255.0f green:0/255.0f blue:140/255.0f alpha:1.0f];
    CGFloat borderWidth = 1.f;
    CGFloat cornerRadius = 2.0f;
    
    self.testButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.testButton.layer.borderWidth = borderWidth;
    self.testButton.layer.borderColor = [testColor CGColor];
    self.testButton.layer.cornerRadius = cornerRadius;
    self.testButton.layer.masksToBounds = YES;
    [self.testButton setTitle:@"無好友" forState:UIControlStateNormal];
    [self.testButton setTitleColor:testColor forState:UIControlStateNormal];
    [self.testButton addTarget:self action:@selector(tsetAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.testButton];
    
    self.test2Button = [UIButton buttonWithType:UIButtonTypeCustom];
    self.test2Button.layer.borderWidth = borderWidth;
    self.test2Button.layer.borderColor = [testColor CGColor];
    self.test2Button.layer.cornerRadius = cornerRadius;
    self.test2Button.layer.masksToBounds = YES;
    [self.test2Button setTitle:@"只有好友" forState:UIControlStateNormal];
    [self.test2Button setTitleColor:testColor forState:UIControlStateNormal];
    [self.test2Button addTarget:self action:@selector(tset2Action:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.test2Button];
    
    self.test3Button = [UIButton buttonWithType:UIButtonTypeCustom];
    self.test3Button.layer.borderWidth = borderWidth;
    self.test3Button.layer.borderColor = [testColor CGColor];
    self.test3Button.layer.cornerRadius = cornerRadius;
    self.test3Button.layer.masksToBounds = YES;
    [self.test3Button setTitle:@"好友含邀請" forState:UIControlStateNormal];
    [self.test3Button setTitleColor:testColor forState:UIControlStateNormal];
    [self.test3Button addTarget:self action:@selector(tset3Action:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.test3Button];
    
    
    
}

- (void)setupAutolayout {
    
    [super setupAutolayout];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.height.equalTo(@18);
        
        make.top.equalTo(self.contentView.mas_top).with.offset(73);
        make.left.equalTo(self.contentView.mas_left).with.offset(30);
        
    }];
    
    [self.kokoIdLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.height.equalTo(@18);
        
        make.top.equalTo(self.nameLabel.mas_bottom).with.offset(8);
        make.left.equalTo(self.contentView).with.offset(30);
        
    }];
    
    [self.userImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.equalTo(@52);
        make.height.equalTo(@52);
        
        make.right.equalTo(self.contentView.mas_right).with.offset(-30);
        make.bottom.equalTo(self.view.mas_top).with.offset(-10);
        
    }];
    
    [self.view mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.height.equalTo(@10);
        
        make.top.equalTo(self.kokoIdLabel.mas_bottom).with.offset(10);
        make.left.equalTo(self.contentView.mas_left).with.offset(0);
        make.right.equalTo(self.contentView.mas_right).with.offset(0);
        make.bottom.equalTo(self.contentView.mas_bottom).with.offset(0);
        
    }];
    
    [self.testButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.equalTo(@110);
        make.height.equalTo(@30);
        
        make.top.equalTo(self.contentView.mas_top).with.offset(20);
        make.left.equalTo(self.contentView.mas_left).with.offset(15);
        
    }];
    
    [self.test2Button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@30);

        make.top.equalTo(self.contentView.mas_top).with.offset(20);
        make.left.equalTo(self.testButton.mas_right).with.offset(15);
        make.right.equalTo(self.test3Button.mas_left).with.offset(-15);

    }];

    [self.test3Button mas_makeConstraints:^(MASConstraintMaker *make) {

        make.width.equalTo(@110);
        make.height.equalTo(@30);

        make.top.equalTo(self.contentView.mas_top).with.offset(20);
        make.right.equalTo(self.contentView.mas_right).with.offset(-15);

    }];

}

- (void)tsetAction:(id)sender {
    [self.delegate test1];
}

- (void)tset2Action:(id)sender {
    [self.delegate test2];
}

- (void)tset3Action:(id)sender {
    [self.delegate test3];
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
