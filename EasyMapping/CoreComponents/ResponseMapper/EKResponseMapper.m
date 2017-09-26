//
//  EKResponseMapper.m
//  NetworkingBlocks
//
//  Created by Tayphoon on 26/09/2017.
//  Copyright © 2017 Tayphoon. All rights reserved.
//

#import <EasyMapping/EasyMapping.h>

#import "EKResponseMapper.h"
#import "EKManagedObjectMapping.h"
#import "EKObjectMappingProvider.h"

@interface EKResponseMapper()

@property (nonatomic, readwrite) id<EKObjectMappingProvider> mappingProvider;

@end

@implementation EKResponseMapper

- (instancetype)initWithMappingProvider:(id<EKObjectMappingProvider>)mappingProvider {
    self = [super init];
    if (self) {
        _mappingProvider = mappingProvider;
    }
    return self;
}

- (id)mapServerResponse:(id)response
     withMappingContext:(NSDictionary*)context
                  error:(NSError **)error {
    EKManagedObjectMapping * mapping = [self retreiveMappingForMappingContext:context];
    
    id result = [EKMapper objectFromExternalRepresentation:response
                                               withMapping:mapping];
    
    return result;
}

#pragma mark - Private methods

- (EKManagedObjectMapping*)retreiveMappingForMappingContext:(NSDictionary*)mappingContext {
    Class objectClass = NSClassFromString(mappingContext[TCMappingContextModelClassKey]);
    EKManagedObjectMapping * mapping = [self.mappingProvider mappingForObjectClass:objectClass];
    return mapping;
}

@end
