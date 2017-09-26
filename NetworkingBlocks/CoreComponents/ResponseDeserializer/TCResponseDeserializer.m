//
//  TCResponseDeserializer.m
//  TCNetworkingBlocks
//
//  Created by Tayphoon on 25/09/2017.
//  Copyright © 2017 Tayphoon. All rights reserved.
//

#import "TCResponseDeserializer.h"

NSString * const TCResponseSerializationErrorDomain = @"com.tayphoon.TCResponseSerializationErrorDomain";

@implementation TCResponseDeserializer

- (instancetype)init {
    self = [super init];
    if (self) {
        self.stringEncoding = NSUTF8StringEncoding;
    }
    
    return self;
}


- (id)responseObjectForResponse:(NSURLResponse*)response data:(NSData*)data error:(NSError **)error {
    return data;
}

@end
