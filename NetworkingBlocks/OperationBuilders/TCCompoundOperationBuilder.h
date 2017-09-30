//
//  TCCompoundOperationBuilder.h
//  NetworkingBlocks
//
//  Created by Tayphoon on 24/09/2017.
//  Copyright © 2017 Tayphoon. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol TCChainableOperation;
@class TCCompoundOperation;

/**
 @abstract The base compound operation builder class, which provides the basic methods to build operation.
 */
@interface TCCompoundOperationBuilder : NSObject

/**
 @abstract Add operation to array, set dependencies and outputs.

 @param operation Chainable Operation
 */
- (void)addOperation:(NSOperation<TCChainableOperation>*)operation;

/**
 @abstract Build compound operation with all chainable operation add by `- (void)addOperation:` method.

 @return Compound operation
 */
- (TCCompoundOperation*)compoundOperation;

@end

NS_ASSUME_NONNULL_END
