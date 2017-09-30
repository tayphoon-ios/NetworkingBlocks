//
//  TCCompoundOperation.h
//  NetworkingBlocks
//
//  Created by Tayphoon on 23/09/2017.
//  Copyright © 2017 Tayphoon. All rights reserved.
//

#import "TCAsyncOperation.h"
#import "TCChainableOperationDelegate.h"
#import "TCChainableOperationOutput.h"

NS_ASSUME_NONNULL_BEGIN

@protocol TCChainableOperation;

typedef void(^TCCompoundOperationCompletion)(_Nullable id data,  NSError * _Nullable  error);

/**
 @abstract The default max number running simultaneously operations.
 */
extern NSUInteger const TCDefaultMaxConcurrentOperationsCount;

/**
 @abstract The base class for compound operation.
 */
@interface TCCompoundOperation : TCAsyncOperation<TCChainableOperationDelegate, TCChainableOperationOutput>

/**
 @abstract This property points, how many operations are allowed to execute in parallel.
 */
@property (nonatomic, assign) NSUInteger maxConcurrentOperationsCount;

/**
 @abstract This block is called after the operation is finished.
 */
@property (nonatomic, copy) TCCompoundOperationCompletion completion;

/**
 @abstract This method adds the provided operation to a compound operation inner queue.

 @param operation NSOperation
 */
- (void)addOperation:(NSOperation<TCChainableOperation>*)operation;

@end

NS_ASSUME_NONNULL_END
