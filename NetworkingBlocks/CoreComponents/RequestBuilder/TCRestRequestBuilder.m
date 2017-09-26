//
//  TCRestRequestBuilder.m
//  TCNetworkingBlocks
//
//  Created by Tayphoon on 23/09/2017.
//  Copyright © 2017 Tayphoon. All rights reserved.
//

#import "TCRestRequestBuilder.h"

@implementation TCRestRequestBuilder

+ (instancetype)builderWithBaseURL:(NSURL*)baseURL apiPath:(NSString*)apiPath {
    return [[[self class] alloc] initWithBaseURL:baseURL apiPath:apiPath];
}

- (instancetype)initWithBaseURL:(NSURL*)baseURL apiPath:(NSString*)apiPath {
    self = [super init];
    if (self) {
        _baseURL = [baseURL copy];
        _apiPath = [apiPath copy];
    }
    return self;
}

- (NSURLRequest*)requestWithMethod:(NSString*)method
                       serviceName:(NSString*)serviceName
                     urlParameters:(NSArray*)urlParameters
                          bodyData:(NSData*)bodyData {
    NSURL * finalURL = [self generateURLWithServiceName:serviceName
                                         urlParameters:urlParameters];
    NSMutableURLRequest * mutableRequest = [NSMutableURLRequest requestWithURL:finalURL];
    [mutableRequest setHTTPMethod:method];
    
    [mutableRequest setHTTPBody:bodyData];

    return [mutableRequest copy];
}

#pragma mark - Private methods

- (NSURL*)generateURLWithServiceName:(NSString*)serviceName urlParameters:(NSArray*)urlParameters {
    NSMutableArray * urlParts = [NSMutableArray new];
    
    [urlParts addObject:self.apiPath];
    if (serviceName) {
        [urlParts addObject:serviceName];
    }
    
    [urlParts addObjectsFromArray:urlParameters];
    
    NSString *urlPath = [urlParts componentsJoinedByString:@"/"];
    urlPath = [self filterSlashesInURLPath:urlPath];
    
    NSURL *finalURL = [self.baseURL URLByAppendingPathComponent:urlPath];
    return finalURL;
}

- (NSString *)filterSlashesInURLPath:(NSString*)urlPath {
    return [urlPath stringByReplacingOccurrencesOfString:@"//" withString:@"/"];
}

@end
