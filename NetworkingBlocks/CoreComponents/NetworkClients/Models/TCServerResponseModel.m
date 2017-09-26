//
//  TCServerResponseModel.m
//  TCNetworkingBlocks
//
//  Created by Tayphoon on 23/09/2017.
//  Copyright © 2017 Tayphoon. All rights reserved.
//

#import "TCServerResponseModel.h"

@interface TCServerResponseModel()

@property (nonatomic, readwrite) NSHTTPURLResponse * response;
@property (nonatomic, readwrite) NSData * data;

@end

@implementation TCServerResponseModel

+ (instancetype)responseModelWithResponse:(NSHTTPURLResponse*)response data:(NSData*)data {
    return [[[self class] alloc] initWithResponse:response data:data];
}

- (instancetype)initWithResponse:(NSHTTPURLResponse*)response data:(NSData*)data {
    self = [super init];
    
    if (self) {
        _response = response;
        _data = data;
    }
    
    return self;
}

@end
