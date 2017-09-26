//
//  TCRequestBuilderOperation.h
//  TCNetworkingBlocks
//
//  Created by Tayphoon on 23/09/2017.
//  Copyright © 2017 Tayphoon. All rights reserved.
//

#import "TCAsyncOperation.h"
#import "TCChainableOperation.h"

NS_ASSUME_NONNULL_BEGIN

@protocol TCRequestBuilder;

/**
 @abstract The operation is responsible for configuring a NSURLRequest using the provided information
 */
@interface TCRequestBuilderOperation : TCAsyncOperation<TCChainableOperation, TCChainableOperationOutput>

@property (nonatomic, weak) id<TCChainableOperationDelegate> delegate;
@property (nonatomic, weak) id<TCChainableOperationOutput> output;

/**
 @abstract The main initializer of the RequestBuilderOperation

 @param requestBuilder Request builder class conforms to `TCRequestBuilder` protocol
 @param method API method
 @param serviceName Service name
 @param urlParameters URL request parameters
 @return return instance of RequestBuilderOperation
 */
+ (instancetype)operationWithRequestBuilder:(id<TCRequestBuilder>)requestBuilder
                                     method:(NSString*)method
                                serviceName:(NSString*)serviceName
                              urlParameters:(NSArray*)urlParameters;

@end

NS_ASSUME_NONNULL_END
