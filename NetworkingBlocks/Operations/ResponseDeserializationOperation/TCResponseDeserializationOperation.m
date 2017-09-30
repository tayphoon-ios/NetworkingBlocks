//
//  TCResponseDeserializationOperation.m
//  NetworkingBlocks
//
//  Created by Tayphoon on 25/09/2017.
//  Copyright © 2017 Tayphoon. All rights reserved.
//

#import "TCResponseDeserializationOperation.h"
#import "TCResponseDeserialization.h"
#import "TCServerResponseModel.h"

@interface TCResponseDeserializationOperation()

@property (nonatomic, strong) id<TCResponseDeserialization> responseDeserializer;
@property (nonatomic, strong) TCServerResponseModel * responseModel;
@property (nonatomic, readwrite) id resultData;
@property (nonatomic, readwrite) NSError * error;

@end

@implementation TCResponseDeserializationOperation

+ (instancetype)operationWithResponseDeserializer:(id<TCResponseDeserialization>)responseDeserializer {
    return [[[self class] alloc] initWithResponseDeserializer:responseDeserializer];
}

- (instancetype)initWithResponseDeserializer:(id<TCResponseDeserialization>)responseDeserializer {
    self = [super init];
    if (self) {
        _responseDeserializer = responseDeserializer;
    }
    return self;
}

#pragma mark - Operation execution

- (void)main {
    NSError * serializationError = nil;
    id response = [self.responseDeserializer responseObjectForResponse:self.responseModel.response
                                                                  data:self.responseModel.data
                                                                 error:&serializationError];
    
    [self completeOperationWithData:response error:serializationError];
}

#pragma mark - TCChainableOperationOutput

- (void)didCompleteChainableOperationWithOutputData:(id)outputData {
    NSAssert([outputData isKindOfClass:[TCServerResponseModel class]], @"The input data for the operation must be subclass of NSURLRequest");
    
    self.responseModel = outputData;
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
