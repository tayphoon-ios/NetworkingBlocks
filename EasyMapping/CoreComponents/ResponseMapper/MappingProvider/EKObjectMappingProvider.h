//
//  EKObjectMappingProvider.h
//  NetworkingBlocks
//
//  Created by Tayphoon on 26/09/2017.
//  Copyright © 2017 Tayphoon. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class EKObjectMapping;

/**
 @abstract  This class is used for storing EasyMapping mappings for all of NSObjects
 */
@protocol EKObjectMappingProvider <NSObject>

/**
 @abstract This method processes the provided NSObject class to a specific mapping
 
 @param objectClass The class for mapping
 
 @return EKObjectMapping object
 */
- (EKObjectMapping*)mappingForObjectClass:(Class)objectClass;

@end

NS_ASSUME_NONNULL_END
