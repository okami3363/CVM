//
//  CUBNoFriendTableViewCell.m
//  CUBInterview
//
//  Created by KunChan on 2019/10/18.
//  Copyright © 2019 KunChan. All rights reserved.
//

#import "CUBNoFriendTableViewCell.h"

@interface CUBNoFriendTableViewCell()

@property (nonatomic, strong) UILabel *setKokoLabel;
@property (nonatomic, strong) UILabel *descLabel;
@property (nonatomic, strong) UIImageView *noFriendImageView;
@property (nonatomic, strong) UILabel *noFriendLabel;
@property (nonatomic, strong) UIButton *addButton;

@end

@implementation CUBNoFriendTableViewCell

- (void)setupUI {
    
    [super setupUI];
    
    UIColor * _Nonnull textColor153 = [UIColor colorWithRed:153/255.0f green:153/255.0f blue:153/255.0f alpha:1.0f];
    UIColor *pinkColor = [UIColor colorWithRed:236/255.0f green:0/255.0f blue:140/255.0f alpha:1.0f];
    self.setKokoLabel = [[UILabel alloc] init];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:@"幫助好友更快找到你？設定 KOKO ID"];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:13.0f] range:NSMakeRange(0, attributedString.length)];
    [attributedString addAttribute:NSForegroundColorAttributeName value:textColor153 range:NSMakeRange(0, 10)];
    NSRange kokoRange = NSMakeRange(10, 10);
    [attributedString addAttribute:NSForegroundColorAttributeName value:pinkColor range:kokoRange];
    [attributedString addAttribute:NSUnderlineStyleAttributeName
                             value:@(NSUnderlineStyleSingle)
                             range:kokoRange];
    [attributedString addAttribute:NSUnderlineColorAttributeName
                             value:pinkColor
                             range:kokoRange];
    
    self.setKokoLabel.attributedText = attributedString;
    [self.contentView addSubview:self.setKokoLabel];
    
    UIColor * _Nonnull textColor = [UIColor colorWithRed:71/255.0f green:71/255.0f blue:71/255.0f alpha:1.0f];
    
    self.descLabel = [[UILabel alloc] init];
    self.descLabel.text = @"與好友們一起用 KOKO 聊起來！\n還能互相收付款、發紅包喔：）";
    self.descLabel.font = [UIFont systemFontOfSize:14.0f];
    self.descLabel.textColor = textColor153;
    self.descLabel.numberOfLines = 2;
    self.descLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.descLabel];
    
    self.noFriendImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"noFriend"]];
    [self.contentView addSubview:self.noFriendImageView];
    
    self.noFriendLabel = [[UILabel alloc] init];
    self.noFriendLabel.text = @"就從加好友開始吧：）";
    self.noFriendLabel.textAlignment = NSTextAlignmentCenter;
    self.noFriendLabel.font = [UIFont boldSystemFontOfSize:21];
    self.noFriendLabel.textColor = textColor;
    [self.contentView addSubview:self.noFriendLabel];
    
    self.addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.addButton setTitle:@"加好友" forState:UIControlStateNormal];
    [self.addButton setImage:[UIImage imageNamed:@"add"] forState:UIControlStateNormal];
    self.addButton.layer.cornerRadius = 20;
    self.addButton.layer.masksToBounds = YES;
    self.addButton.titleEdgeInsets = UIEdgeInsetsMake(0, -27, 0, 0);
    self.addButton.imageEdgeInsets = UIEdgeInsetsMake(0, 160, 0, 0);
    [self.contentView addSubview:self.addButton];
    
}

- (void)setupAutolayout {
    
    [super setupAutolayout];
    
    [self.setKokoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.addButton.mas_bottom).offset(37);
        make.left.right.equalTo(self.noFriendLabel);
        make.bottom.equalTo(self.contentView.mas_bottom).with.offset(0);
    }];
    
    [self.descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.noFriendLabel.mas_bottom).offset(8);
        make.centerX.equalTo(self.noFriendLabel);
        make.left.equalTo(self.noFriendLabel).offset(5);
        make.right.equalTo(self.noFriendLabel).offset(-5);
    }];
    
    [self.noFriendImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.equalTo(@245);
        make.height.equalTo(@172);
        
        make.top.equalTo(self.contentView.mas_top).with.offset(40);
        make.centerX.equalTo(self.contentView);
        
    }];
    
    [self.noFriendLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.height.equalTo(@29);
        
        make.top.equalTo(self.noFriendImageView.mas_bottom).with.offset(41);
        make.centerX.equalTo(self.contentView);
        
    }];
    
    [self.addButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.equalTo(@192);
        make.height.equalTo(@40);

        make.top.equalTo(self.noFriendLabel.mas_bottom).with.offset(70);
        make.centerX.equalTo(self.contentView);
        
    }];
    
    dispatch_async(dispatch_get_main_queue(), ^(){
        
        [self.addButton layoutIfNeeded];
        
        CAGradientLayer *gradient = [CAGradientLayer layer];
        gradient.frame = self.addButton.bounds;
        gradient.startPoint = CGPointMake(0, 0.5);
        gradient.endPoint = CGPointMake(1, 0.5);
        gradient.colors = [NSArray arrayWithObjects:
                           (id)[[UIColor colorWithRed:68/255.0f green:179/255.0f blue:11/255.0f alpha:1.0f] CGColor],
                           (id)[[UIColor colorWithRed:166/255.0f green:204/255.0f blue:66/255.0f alpha:1.0f] CGColor],
                           nil];
        [self.addButton.layer insertSublayer:gradient atIndex:0];
        
    });
    
}

@end
