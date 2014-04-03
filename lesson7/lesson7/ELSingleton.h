//
//  ELSingleton.h
//  lesson7
//
//  Created by Alexey Storozhev on 02.04.14.
//  Copyright (c) 2014 e-legion. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ELSingleton : NSObject

@property (nonatomic, assign) NSUInteger count;

+ (instancetype)sharedInstance;

@end
