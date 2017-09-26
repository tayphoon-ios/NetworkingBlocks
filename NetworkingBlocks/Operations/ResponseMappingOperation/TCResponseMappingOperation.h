//
//  TCResponseMappingOperation.h
//  TCNetworkingBlocks
//
//  Created by Tayphoon on 25/09/2017.
//  Copyright © 2017 Tayphoon. All rights reserved.
//

#import "TCAsyncOperation.h"
#import "TCChainableOperation.h"

NS_ASSUME_NONNULL_BEGIN

@protocol TCResponseMapper;

/**
 @abstract The operation is responsible for server response mapping
 */
@interface TCResponseMappingOperation : TCAsyncOperation<TCChainableOperation, TCChainableOperationOutput>

@property (nonatomic, weak) id<TCChainableOperationDelegate> delegate;
@property (nonatomic, weak) id<TCChainableOperationOutput> output;

+ (instancetype)operationWithResponseMapper:(id<TCResponseMapper>)responseMapper
                             mappingContext:(NSDictionary *)context;

@end

NS_ASSUME_NONNULL_END
