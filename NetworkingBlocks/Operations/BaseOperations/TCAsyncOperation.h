//
//  TCAsyncOperation.h
//  TCNetworkingBlocks
//
//  Created by Tayphoon on 23/09/2017.
//  Copyright © 2017 Tayphoon. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 @abstract The base NSOperation class, which provides the asynchronyous capabilities to all of its subclasses.
 */
@interface TCAsyncOperation : NSOperation

/**
@abstract This method is called in a separate thread after operation start. Should be overriden.
 */
- (void)main;

/**
 @abstract This method sets all operation flags to appropriate values. Should be manually called after operation executes.
 */
- (void)complete;

@end

NS_ASSUME_NONNULL_END
