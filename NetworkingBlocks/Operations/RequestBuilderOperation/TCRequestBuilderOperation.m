//
//  TCRequestBuilderOperation.m
//  NetworkingBlocks
//
//  Created by Tayphoon on 23/09/2017.
//  Copyright © 2017 Tayphoon. All rights reserved.
//

#import "TCRequestBuilderOperation.h"
#import "TCRequestBuilder.h"

@interface TCRequestBuilderOperation()

@property (nonatomic, strong) id<TCRequestBuilder> requestBuilder;
@property (nonatomic, copy) NSString * method;
@property (nonatomic, copy) NSString * serviceName;
@property (nonatomic, strong) NSArray * urlParameters;
@property (nonatomic, strong) id inputData;

@property (nonatomic, readwrite) id resultData;
@property (nonatomic, readwrite) NSError * error;

@end

@implementation TCRequestBuilderOperation

+ (instancetype)operationWithRequestBuilder:(id<TCRequestBuilder>)requestBuilder
                                     method:(NSString*)method
                                serviceName:(NSString*)serviceName
                              urlParameters:(NSArray*)urlParameters {
    return [[[self class] alloc] initWithRequestBuilder:requestBuilder
                                                 method:method
                                           serviceName:serviceName
                                         urlParameters:urlParameters];
}

- (instancetype)initWithRequestBuilder:(id<TCRequestBuilder>)requestBuilder
                                method:(NSString*)method
                           serviceName:(NSString*)serviceName
                         urlParameters:(NSArray*)urlParameters {
    self = [super init];
    if (self) {
        _requestBuilder = requestBuilder;
        _method = method;
        _serviceName = serviceName;
        _urlParameters = urlParameters;
    }
    return self;
}

#pragma mark - Operation execution

- (void)main {
    NSURLRequest * request = [self.requestBuilder requestWithMethod:self.method
                                                        serviceName:self.serviceName
                                                      urlParameters:self.urlParameters
                                                           bodyData:self.inputData];
    
    [self completeOperationWithData:request error:nil];
}

#pragma mark - TCChainableOperationOutput

- (void)didCompleteChainableOperationWithOutputData:(id)outputData {
    NSAssert([outputData isKindOfClass:[NSData class]], @"The input data for the operation must be subclass of NSData");
    
    self.inputData = outputData;
}

#pragma mark - Private methods

- (void)completeOperationWithData:(id)data error:(NSError*)error {
    if (data) {
        [self.output didCompleteChainableOperationWithOutputData:data];
    }
    
    [self.delegate didCompleteChainableOperationWithError:error];
    [self complete];
}

@end
