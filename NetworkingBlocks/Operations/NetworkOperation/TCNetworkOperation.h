//
//  TCNetworkOperation.h
//  NetworkingBlocks
//
//  Created by Tayphoon on 23/09/2017.
//  Copyright © 2017 Tayphoon. All rights reserved.
//

#import "TCAsyncOperation.h"
#import "TCChainableOperation.h"

NS_ASSUME_NONNULL_BEGIN

@protocol TCNetworkClient;

/**
 @abstract The operation is responsible for sending preconfigured NSURLRequest to the remote server and receiving back some response.
 */
@interface TCNetworkOperation : TCAsyncOperation<TCChainableOperation, TCChainableOperationOutput>

@property (nonatomic, weak) id<TCChainableOperationDelegate> delegate;
@property (nonatomic, weak) id<TCChainableOperationOutput> output;

/**
 @abstract Initilize network operation

 @param networkClient Network client class conforms `TCNetworkClient` protocol.
 @return network operation
 */
+ (instancetype)operationWithNetworkClient:(id<TCNetworkClient>)networkClient;

@end

NS_ASSUME_NONNULL_END
