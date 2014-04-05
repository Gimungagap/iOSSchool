//
//  ELTask.h
//  TaskManager
//
//  Created by Dmitry Zakharov on 4/5/14.
//  Copyright (c) 2014 Org. All rights reserved.
//

@import Foundation;
@import CoreData;


@class ELPerson;

@interface ELTask : NSManagedObject

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *taskDescription;
@property (nonatomic) NSDate *date;
@property (nonatomic) NSNumber *time;
@property (nonatomic) BOOL done;
@property (nonatomic) ELPerson *assignee;

- (void)toggleState;

@end
