//
//  TCResponseMapper.h
//  TCNetworkingBlocks
//
//  Created by Tayphoon on 25/09/2017.
//  Copyright © 2017 Tayphoon. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 @abstract This protocol describes objects which are responsible for mapping server responses into model objects of any kind.
 */
@protocol TCResponseMapper <NSObject>

/**
 @abstract This method initiates deserialized response mapping
 
 @param response Deserialized server response
 @param context  Dictionary which has additional data for the mapping operation
 @param error    Mapping error
 
 @return Mapped model object
 */
- (nullable id)mapServerResponse:(id)response
              withMappingContext:(NSDictionary*)context
                           error:(NSError * __nullable __autoreleasing *)error;

@end

NS_ASSUME_NONNULL_END
