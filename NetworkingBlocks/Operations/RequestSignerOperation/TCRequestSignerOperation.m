//
//  TCRequestSignerOperation.m
//  NetworkingBlocks
//
//  Created by Tayphoon on 30/09/2017.
//  Copyright © 2017 Tayphoon. All rights reserved.
//

#import "TCRequestSignerOperation.h"
#import "TCRequestSigner.h"

@interface TCRequestSignerOperation()

@property (nonatomic, strong) id<TCRequestSigner> requestSigner;
@property (nonatomic, strong) NSURLRequest * request;
@property (nonatomic, readwrite) id resultData;
@property (nonatomic, readwrite) NSError * error;

@end

@implementation TCRequestSignerOperation

+ (instancetype)operationWithRequestSigner:(id<TCRequestSigner>)requestSigner {
    return [[[self class] alloc] initWithRequestSigner:requestSigner];
}

- (instancetype)initWithRequestSigner:(id<TCRequestSigner>)requestSigner {
    self = [super init];
    if (self) {
        _requestSigner = requestSigner;
    }
    return self;
}

#pragma mark - Operation execution

- (void)main {
    NSURLRequest * request = [self.requestSigner signRequest:self.request];
    
    [self completeOperationWithData:request error:nil];
}

#pragma mark - TCChainableOperationOutput

- (void)didCompleteChainableOperationWithOutputData:(id)outputData {
    NSAssert([outputData isKindOfClass:[NSURLRequest class]], @"The input data for the operation must be subclass of NSURLRequest");
    
    self.request = outputData;
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
