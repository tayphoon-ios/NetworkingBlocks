//
//  TCJSONResponseDeserializer.m
//  TCNetworkingBlocks
//
//  Created by Tayphoon on 25/09/2017.
//  Copyright © 2017 Tayphoon. All rights reserved.
//

#import "TCJSONResponseDeserializer.h"

@implementation TCJSONResponseDeserializer

- (id)responseObjectForResponse:(NSURLResponse*)response
                           data:(NSData*)data
                          error:(NSError**)error {
    id responseObject = nil;
    NSError * serializationError = nil;
    NSStringEncoding stringEncoding = self.stringEncoding;

    NSString * responseString = [[NSString alloc] initWithData:data encoding:stringEncoding];
    if (responseString && ![responseString isEqualToString:@" "]) {
        // Workaround for a bug in NSJSONSerialization when Unicode character escape codes are used instead of the actual character
        // See http://stackoverflow.com/a/12843465/157142
        data = [responseString dataUsingEncoding:NSUTF8StringEncoding];
        
        if (data) {
            if ([data length] > 0) {
                responseObject = [NSJSONSerialization JSONObjectWithData:data options:self.readingOptions error:&serializationError];
            } else {
                return nil;
            }
        } else {
            NSDictionary *userInfo = @{
                                       NSLocalizedDescriptionKey: NSLocalizedStringFromTable(@"Data failed decoding as a UTF-8 string", @"TCNetworkingBlocks", nil),
                                       NSLocalizedFailureReasonErrorKey: [NSString stringWithFormat:NSLocalizedStringFromTable(@"Could not decode string: %@", @"TCNetworkingBlocks", nil), responseString]
                                       };
            
            serializationError = [NSError errorWithDomain:TCResponseSerializationErrorDomain
                                                     code:NSURLErrorCannotDecodeContentData
                                                 userInfo:userInfo];
        }
    }

    return responseObject;
}

@end
