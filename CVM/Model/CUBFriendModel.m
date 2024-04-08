//
//  CUBFriendModel.m
//  CUBInterview
//
//  Created by KunChan on 2019/10/17.
//  Copyright © 2019 KunChan. All rights reserved.
//

#import "CUBFriendModel.h"

@implementation CUBFriendModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    
    return @{
             @"name": @"name",
             @"status": @"status",
             @"isTop": @"isTop",
             @"fid": @"fid",
             @"updateDate": @"updateDate",
             };
    
}

//+ (NSValueTransformer *)isTopJSONTransformer {
//    return [NSValueTransformer valueTransformerForName:MTLBooleanValueTransformerName];
//}

//+ (NSValueTransformer *)updateDateJSONTransformer {
//    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSString *dateString, BOOL *success, NSError *__autoreleasing *error) {
//        return [self.dateFormatter dateFromString:dateString];
//    } reverseBlock:^id(NSDate *date, BOOL *success, NSError *__autoreleasing *error) {
//        return [self.dateFormatter stringFromDate:date];
//    }];
//}
//
//+ (NSDateFormatter *)dateFormatter {
//
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
//    dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss'Z'";
//    return dateFormatter;
//
//}


@end
