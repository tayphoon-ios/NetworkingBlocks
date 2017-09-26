//
//  TCRestRequestBuilder.h
//  TCNetworkingBlocks
//
//  Created by Tayphoon on 23/09/2017.
//  Copyright © 2017 Tayphoon. All rights reserved.
//

#import "TCRequestBuilder.h"

NS_ASSUME_NONNULL_BEGIN

/**
 @abstract This class is intended for serializing NSURLRequests for the REST API
 */
@interface TCRestRequestBuilder : NSObject<TCRequestBuilder>

@property (nonatomic, readonly) NSURL * baseURL;
@property (nonatomic, readonly) NSString * apiPath;

/**
 @abstract The main initializer of the RequestBuilder
 
 @param baseURL The base URL (e.g. https://service.com)
 @param apiPath The path to a server endpoint (e.g. /v1/rest/)
 
 @return TCRestRequestBuilder
 */
+ (instancetype)builderWithBaseURL:(NSURL*)baseURL apiPath:(NSString*)apiPath;

- (instancetype)initWithBaseURL:(NSURL*)baseURL apiPath:(NSString*)apiPath;

@end

NS_ASSUME_NONNULL_END
