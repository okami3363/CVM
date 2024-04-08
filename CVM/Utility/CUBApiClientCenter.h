//
//  CUBApiClientCenter.h
//  CUBInterview
//
//  Created by KunChan on 2019/10/17.
//  Copyright © 2019 KunChan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CUBApiClientCenter : NSObject

+ (instancetype)sharedInstance;
- (NSDictionary*)requestHandler:(id) data;
- (NSDictionary*)jsonToDictionary:(NSString*)jsonString;
- (void)httpGetRespondArrayDataHandel:(NSString *)urlString success:(void (^)(NSArray *success))success failure:(void (^)(NSError *error))failure;
- (NSMutableArray *)modelOfClass:(Class _Nonnull)className fromJSONDictionaryArray:(NSArray *)jsonDictionaryArray;


@end

NS_ASSUME_NONNULL_END
