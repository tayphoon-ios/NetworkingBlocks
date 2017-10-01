//
//  TCCommonNetworkClient.m
//  NetworkingBlocks
//
//  Created by Tayphoon on 23/09/2017.
//  Copyright © 2017 Tayphoon. All rights reserved.
//

#import "TCCommonNetworkClient.h"
#import "TCServerResponseModel.h"

@implementation TCCommonNetworkClient

- (instancetype)networkClientWithURLSession:(NSURLSession*)session {
    return [[[self class] alloc] initWithURLSession:session];
}

- (instancetype)initWithURLSession:(NSURLSession*)session {
    self = [super init];
    if (self) {
        _session = session;
    }
    return self;
}

#pragma mark - TCNetworkClient methods

- (void)sendRequest:(NSURLRequest*)request completion:(TCNetworkClientCompletion)completion {
    NSAssert(request != nil, @"NSURLRequest should not be nil");
    
    NSURLSessionDataTask *dataTask = [self.session dataTaskWithRequest:request completionHandler:^(NSData * data, NSURLResponse * response, NSError * error) {
        if (completion) {
            NSHTTPURLResponse * serverResponse = nil;
            if ([response isKindOfClass:[NSHTTPURLResponse class]]) {
                serverResponse = (NSHTTPURLResponse*)response;
            }
            
        
            TCServerResponseModel * responseModel;
            if(response || data) {
                responseModel = [[TCServerResponseModel alloc] initWithResponse:serverResponse
                                                                           data:data];
            }
            
            if(completion) {
                completion(responseModel, error);
            }
        }
    }];
    
    [dataTask resume];
}

@end
