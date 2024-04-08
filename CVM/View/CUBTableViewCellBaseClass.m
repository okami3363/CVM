//
//  CUBTableViewCellBaseClass.m
//  CUBInterview
//
//  Created by KunChan on 2019/10/18.
//  Copyright © 2019 KunChan. All rights reserved.
//

#import "CUBTableViewCellBaseClass.h"

@implementation CUBTableViewCellBaseClass

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
        [self setupAutolayout];
    }
    return self;
}

- (void)setEntity:(id)entity {
    _entity = entity;
}

- (void)setupUI {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setupAutolayout {
    
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
