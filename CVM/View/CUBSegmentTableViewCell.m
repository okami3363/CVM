//
//  CUBSegmentTableViewCell.m
//  CVM
//
//  Created by 黃崑展 on 2024/4/12.
//

#import "CUBSegmentTableViewCell.h"

@interface CUBSegmentTableViewCell ()
@property (nonatomic, strong) UIButton *friednButton;
@property (nonatomic, strong) UIView *indicatorView;
@property (nonatomic, strong) UIView *lineView;
@end

@implementation CUBSegmentTableViewCell

- (void)setupUI {
    [super setupUI];
    
    self.friednButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIColor * _Nonnull textColor = [UIColor colorWithRed:71/255.0f green:71/255.0f blue:71/255.0f alpha:1.0f];
    [self.friednButton setTitleColor:textColor forState:UIControlStateNormal];
    [self.friednButton setTitle:@"好友" forState:UIControlStateNormal];
    self.friednButton.titleLabel.font = [UIFont boldSystemFontOfSize:13.0f];
    [self.contentView addSubview:self.friednButton];
    
    UIColor * _Nonnull pinkColor = [UIColor colorWithRed:236/255.0f green:0/255.0f blue:140/255.0f alpha:1.0f];
    self.indicatorView = [[UIView alloc] init];
    self.indicatorView.backgroundColor = pinkColor;
    self.indicatorView.clipsToBounds = YES;
    self.indicatorView.layer.cornerRadius = 2.0f;
    [self.contentView addSubview:self.indicatorView];
    
    self.lineView = [[UIView alloc] init];
    self.lineView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.075f];
    [self.contentView addSubview:self.lineView];
}
- (void)setupAutolayout {
    [self.friednButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(30);
        make.top.equalTo(self.contentView).offset(5);
    }];
    
    [self.indicatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@4);
        make.top.equalTo(self.friednButton.mas_bottom);
        make.left.equalTo(self.friednButton).offset(2);
        make.right.equalTo(self.friednButton).offset(-2);
    }];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.height.equalTo(@1);
        
        make.top.equalTo(self.indicatorView.mas_bottom).with.offset(0);
        make.left.equalTo(self.contentView.mas_left).with.offset(0);
        make.right.equalTo(self.contentView.mas_right).with.offset(0);
        make.bottom.equalTo(self.contentView.mas_bottom).with.offset(0);
        
    }];
    
}

@end
