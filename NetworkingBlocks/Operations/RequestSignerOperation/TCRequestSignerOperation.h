//
//  TCRequestSignerOperation.h
//  NetworkingBlocks
//
//  Created by Tayphoon on 30/09/2017.
//  Copyright © 2017 Tayphoon. All rights reserved.
//

#import "TCAsyncOperation.h"
#import "TCChainableOperation.h"

NS_ASSUME_NONNULL_BEGIN

@protocol TCRequestSigner;

/**
 @abstract The operation is responsible for sign a NSURLRequest
 */
@interface TCRequestSignerOperation : TCAsyncOperation<TCChainableOperation, TCChainableOperationOutput>

@property (nonatomic, weak) id<TCChainableOperationDelegate> delegate;
@property (nonatomic, weak) id<TCChainableOperationOutput> output;

/**
 @abstract Initilize request singer operation
 
 @param requestSigner Request singer class conforms `TCRequestSigner` protocol.
 @return Request singer operation
 */
+ (instancetype)operationWithRequestSigner:(id<TCRequestSigner>)requestSigner;

@end

NS_ASSUME_NONNULL_END
