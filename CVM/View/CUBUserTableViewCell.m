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

@property (nonatomic, strong) UIView *indicatorView;
@property (nonatomic, strong) UIButton *friednButton;
@property (nonatomic, strong) UIImageView *arrowImageView;
@property (nonatomic, strong) UIView *dotView;
@property (nonatomic, strong) UIImageView *userImageView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *kokoIdLabel;
@property (nonatomic, strong) UIView *lineView;

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
        
    UIColor * _Nonnull pinkColor = [UIColor colorWithRed:236/255.0f green:0/255.0f blue:140/255.0f alpha:1.0f];
    self.indicatorView = [[UIView alloc] init];
    self.indicatorView.backgroundColor = pinkColor;
    self.indicatorView.clipsToBounds = YES;
    self.indicatorView.layer.cornerRadius = 2.0f;
    [self.contentView addSubview:self.indicatorView];
    
    self.friednButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIColor * _Nonnull textColor = [UIColor colorWithRed:71/255.0f green:71/255.0f blue:71/255.0f alpha:1.0f];
    [self.friednButton setTitleColor:textColor forState:UIControlStateNormal];
    [self.friednButton setTitle:@"好友" forState:UIControlStateNormal];
    self.friednButton.titleLabel.font = [UIFont boldSystemFontOfSize:13.0f];
    [self.contentView addSubview:self.friednButton];
    
    self.contentView.backgroundColor = [UIColor colorWithRed:252/255.0f green:252/255.0f blue:252/255.0f alpha:1.0f];
    
    self.dotView = [[UIView alloc] init];
    self.dotView.backgroundColor = pinkColor;
    self.dotView.clipsToBounds = YES;
    self.dotView.layer.cornerRadius = 5.0f;
    self.dotView.hidden = YES;
    [self.contentView addSubview:self.dotView];
    
    self.arrowImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow"]];
    [self.contentView addSubview:self.arrowImageView];
    
    self.nameLabel = [[UILabel alloc] init];
    self.nameLabel.font = [UIFont boldSystemFontOfSize:18];
    self.nameLabel.textColor = textColor;
    [self.contentView addSubview:self.nameLabel];
    
    self.kokoIdLabel = [[UILabel alloc] init];
    self.kokoIdLabel.textColor = textColor;
    [self.contentView addSubview:self.kokoIdLabel];
    
    self.userImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"user"]];
    [self.contentView addSubview:self.userImageView];
    
    self.lineView = [[UIView alloc] init];
    self.lineView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.075f];
    [self.contentView addSubview:self.lineView];
    
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
    
    [self.indicatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@4);
        make.top.equalTo(self.friednButton.mas_bottom);
        make.left.equalTo(self.friednButton).offset(2);
        make.right.equalTo(self.friednButton).offset(-2);
    }];
    
    [self.friednButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabel);
        make.top.equalTo(self.kokoIdLabel.mas_bottom).offset(25);
    }];
    
    [self.dotView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(10, 10));
        make.centerY.equalTo(self.kokoIdLabel);
        make.left.equalTo(self.arrowImageView.mas_right).offset(15);
    }];
    
    [self.arrowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(18, 18));
        make.centerY.equalTo(self.kokoIdLabel);
        make.left.equalTo(self.kokoIdLabel.mas_right);
    }];
    
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
        
        make.top.equalTo(self.nameLabel).offset(-3);
        make.right.equalTo(self.contentView.mas_right).with.offset(-30);
        
    }];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.height.equalTo(@1);
        
        make.top.equalTo(self.indicatorView.mas_bottom).with.offset(0);
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
