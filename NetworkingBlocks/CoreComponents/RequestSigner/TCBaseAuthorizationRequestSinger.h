//
//  TLBaseAuthorizationRequestSinger.h
//  NetworkingBlocks
//
//  Created by Tayphoon on 30/09/2017.
//  Copyright © 2017 Tayphoon. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TCRequestSigner.h"

NS_ASSUME_NONNULL_BEGIN

/**
 @abstract A class responsible for signing requests using HTTP Base Authorization. It includes two fields on the request's http headers:
 - TokenType, Authorization tokent type
 - Toke, Authorization tokent
 */
@interface TCBaseAuthorizationRequestSinger : NSObject<TCRequestSigner>

@property (nonatomic, readonly) NSString * tokenType;
@property (nonatomic, readonly) NSString * token;

/**
 @abstract The main initializer of the BaseAuthorizationRequestSinger

 @param tokenType Authorization tokent type
 @param token Authorization tokent
 @return TCBaseAuthorizationRequestSinger
 */
- (instancetype)initWithTokenType:(NSString*)tokenType token:(NSString*)token;

@end

NS_ASSUME_NONNULL_END
