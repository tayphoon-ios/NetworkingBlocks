//
//  TCChainableOperation.h
//  TCNetworkingBlocks
//
//  Created by Tayphoon on 23/09/2017.
//  Copyright © 2017 Tayphoon. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TCChainableOperationDelegate.h"
#import "TCChainableOperationOutput.h"

NS_ASSUME_NONNULL_BEGIN

/**
 @abstract The protocol describes an operation, suited for working in compound operation's chain
 */
@protocol TCChainableOperation <NSObject>

/**
@abstract The operation's delegate, which is informed when the operation is finished
*/
@property (nonatomic, weak) id<TCChainableOperationDelegate> delegate;

/**
 @abstract The container for the result of operation's work
 */
@property (nonatomic, weak) id<TCChainableOperationOutput> output;

/**
 @abstract Operation result data
 */
@property (nonatomic, readonly) id resultData;

/**
 @abstract Operation error
 */
@property (nonatomic, readonly) NSError * error;

@end

NS_ASSUME_NONNULL_END
