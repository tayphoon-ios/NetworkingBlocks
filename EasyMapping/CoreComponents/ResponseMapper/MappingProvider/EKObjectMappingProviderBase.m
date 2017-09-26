//
//  EKObjectMappingProviderBase.m
//  NetworkingBlocks
//
//  Created by Tayphoon on 26/09/2017.
//  Copyright © 2017 Tayphoon. All rights reserved.
//

#import <EasyMapping/EasyMapping.h>

#import "EKObjectMappingProviderBase.h"

@implementation EKObjectMappingProviderBase

- (EKObjectMapping*)mappingForObjectClass:(Class)objectClass {
    if ([objectClass conformsToProtocol:@protocol(EKMappingProtocol)]) {
        return [((id<EKMappingProtocol>)objectClass) objectMapping];
    }
    
    return nil;
}

@end
