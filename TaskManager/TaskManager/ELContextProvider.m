//
//  ELContextProvider.m
//  TaskManager
//
//  Created by Dmitry Zakharov on 4/5/14.
//  Copyright (c) 2014 Org. All rights reserved.
//

@import CoreData;
#import "ELContextProvider.h"


@interface ELContextProvider ()

@property (nonatomic, readonly) NSPersistentStoreCoordinator *psc;

@end

@implementation ELContextProvider

- (instancetype)initInternal {
    self = [super init];
    if (self) {
        NSManagedObjectModel *model = [NSManagedObjectModel mergedModelFromBundles:nil];
        
        NSURL *applicationSupportURL = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject];
        
        NSURL *storeURL = [applicationSupportURL URLByAppendingPathComponent:@"DB.sqlite" isDirectory:NO];
        
        NSDictionary *options = @{
    NSInferMappingModelAutomaticallyOption : @YES,
    NSMigratePersistentStoresAutomaticallyOption : @YES};
        
        __autoreleasing NSError *error;
        _psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];
        if (![self.psc addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:options error:&error]) {
            NSLog(@"Error while creating PSC: %@", error);
            abort();
        }
    }
    
    return self;
}

+ (instancetype)sharedInstance {
    static ELContextProvider *instance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] initInternal];
    });
    
    return instance;
}

- (NSManagedObjectContext *)context {
    NSManagedObjectContext *result = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSConfinementConcurrencyType];
    [result setPersistentStoreCoordinator:self.psc];
    
    return result;
}

@end
