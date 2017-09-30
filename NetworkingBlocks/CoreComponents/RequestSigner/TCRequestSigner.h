//
//  TCRequestSigner.h
//  NetworkingBlocks
//
//  Created by Tayphoon on 30/09/2017.
//  Copyright © 2017 Tayphoon. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 @abstract This protocol is describing objects responsible for signing previously configured NSURLRequests with OAuth tokens or anything else.
 */
@protocol TCRequestSigner <NSObject>

/**
 @abstract The method signs a NSURLRequest using data, provided by the specific signer's dependencies
 
 @param request Previously configurated NSURLRequest
 
 @return Signed NSURLRequest
 */
- (NSURLRequest*)signRequest:(NSURLRequest*)request;

@end

NS_ASSUME_NONNULL_END
