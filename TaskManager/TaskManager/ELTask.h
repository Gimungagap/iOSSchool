//
//  ELTask.h
//  TaskManager
//
//  Created by Sergey Rakov on 25.03.14.
//  Copyright (c) 2014 Org. All rights reserved.
//


#import <Foundation/Foundation.h>


@interface ELTask : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSDate *date;
@property (strong, nonatomic) NSString *taskDescription;
@property (strong, nonatomic) NSString *imageName;

@end
