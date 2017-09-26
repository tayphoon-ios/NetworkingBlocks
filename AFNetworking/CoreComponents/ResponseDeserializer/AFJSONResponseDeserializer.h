//
//  AFJSONResponseDeserializer.h
//  NetworkingBlocks
//
//  Created by Tayphoon on 26/09/2017.
//  Copyright © 2017 Tayphoon. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

#import "TCResponseDeserializer.h"

NS_ASSUME_NONNULL_BEGIN

/**
 @abstract This implementation of the `TCResponseDeserialization` protocol is responsible for deserializing json-reponses from the remote server.
 */
@interface AFJSONResponseDeserializer : AFJSONResponseSerializer<TCResponseDeserializer>

@end

NS_ASSUME_NONNULL_END
