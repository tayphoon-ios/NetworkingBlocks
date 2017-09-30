//
//  TCRequestBuilder.h
//  NetworkingBlocks
//
//  Created by Tayphoon on 23/09/2017.
//  Copyright © 2017 Tayphoon. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 @abstract This protocol describes the functionality of request configurators - objects, that are responsible for serializing NSURLRequest from a number of input parameters.
 */
@protocol TCRequestBuilder <NSObject>

/**
 @abstract This method return a serialized NSURLRequest for a URL, specified during the instantiation of a concrete request builder.
 
 @param method           HTTP method name
 @param serviceName      The name of the API service (e.g. the Entity name)
 @param urlParameters    Other parts of the URL (e.g. specific object identifier)
 @param bodyData         The request body data
 
 @return A serialized NSURLRequest
 */
- (NSURLRequest*)requestWithMethod:(NSString*)method
                       serviceName:(NSString*)serviceName
                     urlParameters:(NSArray*)urlParameters
                          bodyData:(NSData*)bodyData;

@end

NS_ASSUME_NONNULL_END
