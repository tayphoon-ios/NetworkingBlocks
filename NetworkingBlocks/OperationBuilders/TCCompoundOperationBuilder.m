//
//  TCCompoundOperationBuilder.m
//  NetworkingBlocks
//
//  Created by Tayphoon on 24/09/2017.
//  Copyright © 2017 Tayphoon. All rights reserved.
//

#import "TCCompoundOperationBuilder.h"
#import "TCChainableOperation.h"
#import "TCCompoundOperation.h"

@interface TCCompoundOperationBuilder()

@property (nonatomic, strong) NSMutableArray * operations;

@end

@implementation TCCompoundOperationBuilder

- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.operations = [NSMutableArray array];
    }
    
    return self;
}

- (void)addOperation:(NSOperation<TCChainableOperation>*)operation {
    [self.operations addObject:operation];
    NSUInteger operationIndex = [self.operations indexOfObject:operation];

    if (operationIndex > 0)  {
        NSUInteger previousOperationIndex = operationIndex - 1;
        NSOperation<TCChainableOperation> * parentOperation = self.operations[previousOperationIndex];
        
        [operation addDependency:parentOperation];
        
        parentOperation.output = (id)operation;
    }
}

- (TCCompoundOperation*)compoundOperation {
    TCCompoundOperation * compoundOperation = [[TCCompoundOperation alloc] init];
    compoundOperation.maxConcurrentOperationsCount = 1;
    
    for (NSOperation<TCChainableOperation> * operation in self.operations) {
        [compoundOperation addOperation:operation];
        operation.delegate = compoundOperation;
    }
    
    return compoundOperation;
}

@end
