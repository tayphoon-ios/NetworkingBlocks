//
//  TCNetworkOperation.m
//  TCNetworkingBlocks
//
//  Created by Tayphoon on 23/09/2017.
//  Copyright © 2017 Tayphoon. All rights reserved.
//

#import <libextobjc/EXTScope.h>

#import "TCNetworkOperation.h"
#import "TCNetworkClient.h"

@interface TCNetworkOperation()

@property (nonatomic, strong) id<TCNetworkClient> networkClient;
@property (nonatomic, strong) NSURLRequest * request;
@property (nonatomic, readwrite) id resultData;
@property (nonatomic, readwrite) NSError * error;

@end

@implementation TCNetworkOperation

+ (instancetype)operationWithNetworkClient:(id<TCNetworkClient>)networkClient {
    return [[[self class] alloc] initWithNetworkClient:networkClient];
}

- (instancetype)initWithNetworkClient:(id<TCNetworkClient>)networkClient {
    self = [super init];
    if (self) {
        _networkClient = networkClient;
    }
    return self;
}

#pragma mark - Operation execution

- (void)main {
    @weakify(self);
    [self.networkClient sendRequest:self.request completion:^(TCServerResponseModel * responseModel, NSError * error) {
        @strongify(self);
        
        [self completeOperationWithData:responseModel error:error];
    }];
}

#pragma mark - TCChainableOperationOutput

- (void)didCompleteChainableOperationWithOutputData:(id)outputData {
    NSAssert([outputData isKindOfClass:[NSURLRequest class]], @"The input data for the operation must be subclass of NSURLRequest");
    
    self.request = outputData;
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
