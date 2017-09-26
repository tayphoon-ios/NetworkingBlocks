//
//  EKResponseMapper.h
//  NetworkingBlocks
//
//  Created by Tayphoon on 26/09/2017.
//  Copyright © 2017 Tayphoon. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TCResponseMapper.h"

NS_ASSUME_NONNULL_BEGIN

@protocol EKObjectMappingProvider;

/**
 @abstract  Base implementation of response mapper conforms to `TCResponseMapper` protocol.
 */
@interface EKResponseMapper : NSObject<TCResponseMapper>

@property (nonatomic, readonly) id<EKObjectMappingProvider> mappingProvider;

/**
 @abstract The main initializer of EKResponseMapper
 
 @param mappingProvider This provider is used to retrieve a mapping for a given NSObject class name
 
 @return EKResponseMapper instance
 */
- (instancetype)initWithMappingProvider:(id<EKObjectMappingProvider>)mappingProvider;

@end

NS_ASSUME_NONNULL_END
