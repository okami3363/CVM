//
//  CUBApiClientCenter.m
//  CUBInterview
//
//  Created by KunChan on 2019/10/17.
//  Copyright © 2019 KunChan. All rights reserved.
//

#import "CUBApiClientCenter.h"
#import "CUBNetworking.h"
#import <Mantle/Mantle.h>

@implementation CUBApiClientCenter

+ (instancetype)sharedInstance {
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[super allocWithZone:NULL] init];
    });
    return sharedInstance;
}

+ (instancetype)allocWithZone:(struct _NSZone*)zone {
    return [self sharedInstance];
}

-(instancetype)init {
    self = [super init];
    if (self) {
    }
    return self;
}

- (NSDictionary*)requestHandler:(id) data {
    NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSDictionary *dictionary = [[CUBApiClientCenter sharedInstance]jsonToDictionary:string];
    
    return dictionary;
}

- (NSDictionary*)jsonToDictionary:(NSString *)jsonString {
        
    if(!jsonString || (![jsonString isKindOfClass:[NSString class]])) {
        
        return nil;
    }
    
    NSString * decodeJSONString = jsonString;
    NSError * error = nil;
    
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData: [ decodeJSONString dataUsingEncoding: NSUTF8StringEncoding ]
                                                               options: NSJSONReadingMutableContainers
                                                                 error: & error ];
    return dictionary;
    
}

- (void)httpGetRespondArrayDataHandel:(NSString *)urlString success:(void (^)(NSArray *success))success failure:(void (^)(NSError *error))failure {
    
    [[CUBNetworking sharedInstance] getWithUrlString:urlString success:^(id data) {
        
        NSDictionary *dictionary = [[CUBApiClientCenter sharedInstance] requestHandler:data];
        if(!dictionary) {
            failure(nil);
            return;
        }
        
        NSArray *arrayData = nil;
        if(dictionary[@"response"]) {
            arrayData = [dictionary[@"response"] copy];
        }
        success(arrayData);
        
    }failure:^(NSError *error) {
        failure(error);
    }];
    
}

- (NSMutableArray *)modelOfClass:(Class _Nonnull)className fromJSONDictionaryArray:(NSArray *)jsonDictionaryArray {
    
    NSMutableArray *muArray = @[].mutableCopy;
    for (NSDictionary *dict in jsonDictionaryArray) {
        NSError *error = nil;
        id model = [MTLJSONAdapter modelOfClass:className fromJSONDictionary:dict error:&error];
        [muArray addObject:model];
    }
    
    return muArray;
}

@end
