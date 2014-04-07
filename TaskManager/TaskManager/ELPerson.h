//
//  ELPerson.h
//  TaskManager
//
//  Created by Dmitry Zakharov on 4/5/14.
//  Copyright (c) 2014 Org. All rights reserved.
//

@import Foundation;
@import CoreData;


@class ELTask;

@interface ELPerson : NSManagedObject

@property (nonatomic) NSString *name;
@property (nonatomic) NSSet *tasks;

@end

@interface ELPerson (CoreDataGeneratedAccessors)

- (void)addTasksObject:(ELTask *)value;
- (void)removeTasksObject:(ELTask *)value;
- (void)addTasks:(NSSet *)values;
- (void)removeTasks:(NSSet *)values;

@end
