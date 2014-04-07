//
//  ELContextProvider.h
//  TaskManager
//
//  Created by Dmitry Zakharov on 4/5/14.
//  Copyright (c) 2014 Org. All rights reserved.
//

@import Foundation;

@interface ELContextProvider : NSObject

- (instancetype)init NS_UNAVAILABLE;

+ (instancetype)sharedInstance;
- (NSManagedObjectContext *)context;

@end
