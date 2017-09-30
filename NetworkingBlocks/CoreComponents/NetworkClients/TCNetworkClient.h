//
//  TCNetworkClient.h
//  NetworkingBlocks
//
//  Created by Tayphoon on 23/09/2017.
//  Copyright © 2017 Tayphoon. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class TCServerResponseModel;

typedef void(^TCNetworkClientCompletion)(TCServerResponseModel * respodeModel, NSError * error);

/**
 @abstract  The protocol describes a universal network client, which is responsible for sending NSURLRequests and
 receiving the server response as a raw data.
 */
@protocol TCNetworkClient <NSObject>

/**
 @abstract This asynchronyous method initiates sending the provided NSURLRequest to some server and receiving its response as NSData object.
 
 @param request  The NSURLRequest containing all the necessary information (target URL, HTTP headers, request body, etc) for performing the request.
 @param completion The block, which is called when the response data is received.
 */
- (void)sendRequest:(NSURLRequest*)request completion:(TCNetworkClientCompletion)completion;

@end

NS_ASSUME_NONNULL_END
