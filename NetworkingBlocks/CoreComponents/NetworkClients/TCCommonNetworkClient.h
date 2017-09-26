//
//  TCCommonNetworkClient.h
//  TCNetworkingBlocks
//
//  Created by Tayphoon on 23/09/2017.
//  Copyright © 2017 Tayphoon. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TCNetworkClient.h"

NS_ASSUME_NONNULL_BEGIN

/**
 @abstract  A very simple network client, which just sends preconfigured NSURLRequests and processes received raw data up the chain.
 */
@interface TCCommonNetworkClient : NSObject<TCNetworkClient>

@property (nonatomic, readonly) NSURLSession * session;

/**
 @abstract The main initializer of CommonNetworkClient
 
 @param session The NSURLSession object used for sending requests
 
 @return CommonNetworkClient
 */

- (instancetype)networkClientWithURLSession:(NSURLSession*)session;

- (instancetype)initWithURLSession:(NSURLSession*)session;

@end

NS_ASSUME_NONNULL_END
