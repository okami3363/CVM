//
//  CUBUserModel.m
//  CUBInterview
//
//  Created by KunChan on 2019/10/18.
//  Copyright © 2019 KunChan. All rights reserved.
//

#import "CUBUserModel.h"

@implementation CUBUserModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    
    return @{
             @"name": @"name",
             @"kokoid": @"kokoid",
             };
    
}

@end
