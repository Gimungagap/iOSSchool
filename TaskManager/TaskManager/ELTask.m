//
//  ELTask.m
//  TaskManager
//
//  Created by Dmitry Zakharov on 4/5/14.
//  Copyright (c) 2014 Org. All rights reserved.
//

#import "ELTask.h"
#import "ELPerson.h"


@implementation ELTask

@dynamic name;
@dynamic taskDescription;
@dynamic date;
@dynamic time;
@dynamic done;
@dynamic assignee;

- (void)awakeFromInsert {
    self.date = [NSDate date];
}

- (void)toggleState {
    self.done = !self.done;
    self.time = @(arc4random());
}

@end
