//
//  ELTask.h
//  TaskManager
//
//  Created by Sergey Rakov on 25.03.14.
//  Copyright (c) 2014 Org. All rights reserved.
//


@import Foundation;


@interface ELTask : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic) NSDate *date;
@property (nonatomic, copy) NSString *taskDescription;
@property (nonatomic, copy) NSString *imageName;

@end
