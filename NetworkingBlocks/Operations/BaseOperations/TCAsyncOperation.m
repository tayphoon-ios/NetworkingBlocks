//
//  TCAsyncOperation.m
//  TCNetworkingBlocks
//
//  Created by Tayphoon on 23/09/2017.
//  Copyright © 2017 Tayphoon. All rights reserved.
//

#import "TCAsyncOperation.h"

@interface TCAsyncOperation() {
    BOOL _finished;
    BOOL _executing;
}

@end

@implementation TCAsyncOperation

- (instancetype)init {
    self = [super init];
    
    if (self) {
        _executing = NO;
        _finished = NO;
    }
    
    return self;
}

- (BOOL)isAsynchronous {
    return YES;
}

- (void)start {
    /**
     Always check, if the operation was cancelled before the start
     */
    if ([self isCancelled]) {
        [self setFinishedValue:YES];
        return;
    }
    
    [NSThread detachNewThreadSelector:@selector(main) toTarget:self withObject:nil];
    [self setExecutingValue:YES];
}

- (void)main {
    [NSException raise:NSInternalInconsistencyException
                format:@"You must override the method %@ in a subclass", NSStringFromSelector(_cmd)];
}

- (void)complete {
    /**
     We should always manually setup finished and executing flags after the operation is complete
     */
    [self setExecutingValue:NO];
    [self setFinishedValue:YES];
}

#pragma mark - Accessories

- (BOOL)isExecuting {
    return _executing;
}

- (void)setExecutingValue:(BOOL)executing {
    [self willChangeValueForKey:@"isExecuting"];
    _executing = executing;
    [self didChangeValueForKey:@"isExecuting"];
}

- (BOOL)isFinished {
    return _finished;
}

- (void)setFinishedValue:(BOOL)finished {
    [self willChangeValueForKey:@"isFinished"];
    _finished = finished;
    [self didChangeValueForKey:@"isFinished"];
}

@end
