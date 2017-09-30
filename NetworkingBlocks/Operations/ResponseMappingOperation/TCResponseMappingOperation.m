//
//  TCResponseMappingOperation.m
//  NetworkingBlocks
//
//  Created by Tayphoon on 25/09/2017.
//  Copyright © 2017 Tayphoon. All rights reserved.
//

#import "TCResponseMappingOperation.h"
#import "TCResponseMapper.h"

@interface TCResponseMappingOperation()

@property (nonatomic, strong) id<TCResponseMapper> responseMapper;
@property (nonatomic, strong) NSDictionary * mappingContext;
@property (nonatomic, strong) id inputData;
@property (nonatomic, readwrite) id resultData;
@property (nonatomic, readwrite) NSError * error;

@end

@implementation TCResponseMappingOperation

+ (instancetype)operationWithResponseMapper:(id<TCResponseMapper>)responseMapper
                             mappingContext:(NSDictionary*)context {
    return [[[self class] alloc] initWithResponseMapper:responseMapper
                                         mappingContext:context];
}

- (instancetype)initWithResponseMapper:(id<TCResponseMapper>)responseMapper
                        mappingContext:(NSDictionary*)context {
    self = [super init];
    if (self) {
        _responseMapper = responseMapper;
        _mappingContext = context;
    }
    return self;
}

- (void)main {
    NSError * mappingError = nil;
    id result = [self.responseMapper mapServerResponse:self.inputData
                                    withMappingContext:self.mappingContext
                                                 error:&mappingError];
    
    [self completeOperationWithData:result error:mappingError];
}

#pragma mark - TCChainableOperationOutput

- (void)didCompleteChainableOperationWithOutputData:(id)outputData {
    self.inputData = outputData;
}

#pragma mark - Private methods

- (void)completeOperationWithData:(id)data error:(NSError*)error {
    self.resultData = data;
    self.error = error;
    
    if (data) {
        [self.output didCompleteChainableOperationWithOutputData:data];
    }
    
    [self.delegate didCompleteChainableOperationWithError:error];
    [self complete];
}

@end
