//
//  TCChainableOperationOutput.h
//  NetworkingBlocks
//
//  Created by Tayphoon on 23/09/2017.
//  Copyright © 2017 Tayphoon. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 @abstract The protocol for the operation output data container
 */
@protocol TCChainableOperationOutput <NSObject>

/**
 @abstract The method passes the operation's result to the container
 
 @param outputData The operation's result
 */
- (void)didCompleteChainableOperationWithOutputData:(nullable id)outputData;

@end

NS_ASSUME_NONNULL_END
