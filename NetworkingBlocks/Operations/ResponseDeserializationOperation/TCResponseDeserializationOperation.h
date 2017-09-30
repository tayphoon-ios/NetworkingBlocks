//
//  TCResponseDeserializationOperation.h
//  NetworkingBlocks
//
//  Created by Tayphoon on 25/09/2017.
//  Copyright © 2017 Tayphoon. All rights reserved.
//

#import "TCAsyncOperation.h"
#import "TCChainableOperation.h"

NS_ASSUME_NONNULL_BEGIN

@protocol TCResponseDeserialization;

/**
 @abstract  The operation is responsible for deserializing server raw responses
 */
@interface TCResponseDeserializationOperation : TCAsyncOperation<TCChainableOperation, TCChainableOperationOutput>

@property (nonatomic, weak) id<TCChainableOperationDelegate> delegate;
@property (nonatomic, weak) id<TCChainableOperationOutput> output;

+ (instancetype)operationWithResponseDeserializer:(id<TCResponseDeserialization>)responseDeserializer;

@end

NS_ASSUME_NONNULL_END
