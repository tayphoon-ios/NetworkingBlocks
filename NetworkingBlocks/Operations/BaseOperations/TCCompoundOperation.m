//
//  TCCompoundOperation.m
//  NetworkingBlocks
//
//  Created by Tayphoon on 23/09/2017.
//  Copyright © 2017 Tayphoon. All rights reserved.
//

#import "TCCompoundOperation.h"
#import "TCChainableOperation.h"

NSUInteger const TCDefaultMaxConcurrentOperationsCount = 3;

@interface TCCompoundOperation()

@property (nonatomic, strong) NSOperationQueue * queue;

@end

@implementation TCCompoundOperation

- (instancetype)init {
    self = [super init];
    if (self) {
        _queue = [[NSOperationQueue alloc] init];
        _queue.name = [NSString stringWithFormat:@"ru.NetworkingBlocks.%@-%@.queue", NSStringFromClass([self class]), [[NSUUID UUID] UUIDString]];
        _queue.maxConcurrentOperationCount = _maxConcurrentOperationsCount > 0 ?: TCDefaultMaxConcurrentOperationsCount;
        
        [_queue setSuspended:YES];
    }
    return self;
}

- (void)main {
    [self.queue setSuspended:NO];
}

- (void)cancel {
    [super cancel];
    
    [self.queue setSuspended:YES];
    [self.queue cancelAllOperations];
    [self completeOperationWithData:nil error:nil];
}

- (void)addOperation:(NSOperation<TCChainableOperation>*)operation {
    [self.queue addOperation:operation];
}

#pragma mark - Protocol ChainableOperationDelegate

- (void)didCompleteChainableOperationWithError:(NSError*)error {
    [self completeOperationWithData:nil error:error];
}

- (void)didCompleteChainableOperationWithOutputData:(id)outputData {
    [self completeOperationWithData:outputData error:nil];
}

#pragma mark - Private methods

- (void)completeOperationWithData:(id)data error:(NSError*)error {
    [self.queue setSuspended:YES];
    [self.queue cancelAllOperations];
    [self complete];
    
    if (self.completion) {
        self.completion(data, error);
    }
}

@end
