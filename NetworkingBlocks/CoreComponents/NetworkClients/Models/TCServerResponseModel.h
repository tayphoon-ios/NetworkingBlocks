//
//  TCServerResponseModel.h
//  NetworkingBlocks
//
//  Created by Tayphoon on 23/09/2017.
//  Copyright © 2017 Tayphoon. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TCServerResponseModel : NSObject

@property (nonatomic, readonly) NSHTTPURLResponse * response;
@property (nonatomic, readonly) NSData * data;

+ (instancetype)responseModelWithResponse:(NSHTTPURLResponse*)response data:(NSData*)data;

- (instancetype)initWithResponse:(NSHTTPURLResponse*)response data:(NSData*)data;

@end

NS_ASSUME_NONNULL_END
