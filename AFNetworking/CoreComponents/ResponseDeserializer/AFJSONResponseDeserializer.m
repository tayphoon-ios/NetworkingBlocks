//
//  AFJSONResponseDeserializer.m
//  NetworkingBlocks
//
//  Created by Tayphoon on 26/09/2017.
//  Copyright © 2017 Tayphoon. All rights reserved.
//

#import "AFJSONResponseDeserializer.h"

static NSString * const AFPlainTextContentType = @"text/plain";

@implementation AFJSONResponseDeserializer

- (instancetype)init {
    self = [super init];
    if (self) {
        NSMutableSet *contentTypes = [self.acceptableContentTypes mutableCopy];
        [contentTypes addObject:AFPlainTextContentType];
        self.acceptableContentTypes = [contentTypes copy];
    }
    return self;
}

@end
