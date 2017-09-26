//
//  TCChainableOperationDelegate.h
//  TCNetworkingBlocks
//
//  Created by Tayphoon on 23/09/2017.
//  Copyright © 2017 Tayphoon. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 @abstract The chainable operation delegate
 */
@protocol TCChainableOperationDelegate <NSObject>

/**
 @abstract The method tells a compound operation (usually it poses as the delegate) that the operation is finished (either successfully, or with an error).
 
 @param error The error, produced either by operation or by its dependencies.
 */
- (void)didCompleteChainableOperationWithError:(nullable NSError*)error;

@end

NS_ASSUME_NONNULL_END
