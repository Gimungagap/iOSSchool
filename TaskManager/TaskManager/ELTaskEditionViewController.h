//
//  ELTaskEditionViewController.h
//  TaskManager
//
//  Created by Sergey Rakov on 25.03.14.
//  Copyright (c) 2014 Org. All rights reserved.
//


@import UIKit;


@class ELTask;
@protocol ELTaskEditionViewControllerDelegate;


@interface ELTaskEditionViewController : UITableViewController

@property (weak, nonatomic) IBOutlet id<ELTaskEditionViewControllerDelegate> delegate;

@end

@protocol ELTaskEditionViewControllerDelegate <NSObject>

- (void)taskEditionViewController:(ELTaskEditionViewController *)taskEditionViewController didCreateTask:(ELTask *)task;

@end
