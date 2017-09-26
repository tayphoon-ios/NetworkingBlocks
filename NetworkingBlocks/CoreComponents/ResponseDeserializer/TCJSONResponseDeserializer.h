//
//  TCJSONResponseDeserializer.h
//  TCNetworkingBlocks
//
//  Created by Tayphoon on 25/09/2017.
//  Copyright © 2017 Tayphoon. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TCResponseDeserializer.h"

NS_ASSUME_NONNULL_BEGIN

/**
 @abstract This implementation of the `TCResponseDeserialization` protocol is responsible for deserializing json-reponses from the remote server.
 */
@interface TCJSONResponseDeserializer : TCResponseDeserializer

/**
 @abstract Options for reading the response JSON data and creating the Foundation objects. For possible values, see the `NSJSONSerialization` documentation section "NSJSONReadingOptions". `0` by default.
 */
@property (nonatomic, assign) NSJSONReadingOptions readingOptions;

@end

NS_ASSUME_NONNULL_END
