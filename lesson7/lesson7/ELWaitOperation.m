//
//  ELWaitOperation.m
//  lesson7
//
//  Created by Alexey Storozhev on 02.04.14.
//  Copyright (c) 2014 e-legion. All rights reserved.
//

#import "ELWaitOperation.h"

@interface ELWaitOperation()

@property (nonatomic, assign) ELWaitOperationDelay delay;
@property (nonatomic, copy) NSString *identifier;

@end

@implementation ELWaitOperation

- (instancetype)initWithDelay:(ELWaitOperationDelay)delay identifier:(NSString *)identifier
{
    self = [super init];
    if (self) {
        _delay = delay;
        _identifier = [identifier copy];
    }
    return self;
}

+ (instancetype)operationWithDelay:(ELWaitOperationDelay)delay identifier:(NSString *)identifier
{
    return [[self alloc] initWithDelay:delay identifier:identifier];
}

- (void)main
{
    NSLog(@"Operation %@ started", self.identifier);
    sleep(self.delay);
    NSLog(@"Operation %@ done", self.identifier);
}


@end
