//
//  ELWaitOperation.h
//  lesson7
//
//  Created by Alexey Storozhev on 02.04.14.
//  Copyright (c) 2014 e-legion. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef unsigned int ELWaitOperationDelay;

@interface ELWaitOperation : NSOperation

- (instancetype)initWithDelay:(ELWaitOperationDelay)delay
                   identifier:(NSString *)identifier;

+ (instancetype)operationWithDelay:(ELWaitOperationDelay)delay
                        identifier:(NSString *)identifier;


@end
