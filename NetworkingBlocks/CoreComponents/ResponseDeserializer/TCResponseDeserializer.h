//
//  TCResponseDeserializer.h
//  NetworkingBlocks
//
//  Created by Tayphoon on 25/09/2017.
//  Copyright © 2017 Tayphoon. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TCResponseDeserialization.h"

NS_ASSUME_NONNULL_BEGIN

extern NSString * const TCResponseSerializationErrorDomain;

/**
 @abstract `TCResponseDeserializer` conforms to the `TCResponseDeserialization` protocols, offering a concrete base implementation of query string / URL form-encoded parameter serialization.
 */
@interface TCResponseDeserializer : NSObject<TCResponseDeserialization>

/**
 @abstract The string encoding used to serialize data received from the server, when no string encoding is specified by the response. `NSUTF8StringEncoding` by default.
 */
@property (nonatomic, assign) NSStringEncoding stringEncoding;

@end

NS_ASSUME_NONNULL_END
