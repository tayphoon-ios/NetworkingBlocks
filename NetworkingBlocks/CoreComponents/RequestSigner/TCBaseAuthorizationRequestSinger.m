//
//  TLBaseAuthorizationRequestSinger.m
//  NetworkingBlocks
//
//  Created by Tayphoon on 30/09/2017.
//  Copyright © 2017 Tayphoon. All rights reserved.
//

#import "TCBaseAuthorizationRequestSinger.h"

@implementation TCBaseAuthorizationRequestSinger

- (instancetype)initWithTokenType:(NSString*)tokenType token:(NSString*)token {
    self = [super init];
    
    if (self) {
        _tokenType = tokenType;
        _token = token;
    }
    
    return self;
}

- (NSURLRequest*)signRequest:(NSURLRequest*)request {
    NSMutableURLRequest * mutableRequest = [request mutableCopy];
    [mutableRequest setValue:[NSString stringWithFormat:@"%@ %@", self.tokenType, self.token]
          forHTTPHeaderField:@"Authorization"];
    
    return [mutableRequest copy];
}

@end
