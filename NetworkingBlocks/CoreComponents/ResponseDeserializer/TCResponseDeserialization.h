//
//  TCResponseDeserialization.h
//  TCNetworkingBlocks
//
//  Created by Tayphoon on 25/09/2017.
//  Copyright © 2017 Tayphoon. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 @abstract This protocol describes an object responsible for deserializing raw response NSData to object. It can have a number of different implementations depending on the server response format.
 */
@protocol TCResponseDeserialization <NSObject>

/**
 @abstract The response object decoded from the data associated with a specified response.

@param response The response to be processed.
@param data The response data to be decoded.
@param error The error that occurred while attempting to decode the response data.

@return The object decoded from the specified response data.
*/
- (nullable id)responseObjectForResponse:(nullable NSURLResponse*)response
                                    data:(nullable NSData*)data
                                   error:(NSError * __nullable __autoreleasing *)error;

@end

NS_ASSUME_NONNULL_END
