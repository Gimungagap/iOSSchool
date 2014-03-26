//
//  ELTaskDetailsViewController.h
//  TaskManager
//
//  Created by Sergey Rakov on 25.03.14.
//  Copyright (c) 2014 Org. All rights reserved.
//


#import <UIKit/UIKit.h>


@class ELTask;


@interface ELTaskDetailsViewController : UIViewController

@property (strong, nonatomic) ELTask *task;

@end
