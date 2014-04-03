//
//  ELSingleton.m
//  lesson7
//
//  Created by Alexey Storozhev on 02.04.14.
//  Copyright (c) 2014 e-legion. All rights reserved.
//

#import "ELSingleton.h"

@implementation ELSingleton

+ (instancetype)sharedInstance
{
    static ELSingleton *_instance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _instance = [[super allocWithZone:nil] init];
    });
    
    return _instance;
}

- (NSUInteger)retainCount
{
    return NSUIntegerMax-1;
}

- (oneway void)release { }

- (id)retain
{
    return self;
}

+ (id)allocWithZone:(struct _NSZone *)zone
{
    return [self sharedInstance];
}

- (id)init
{
    return self;
}

@end
