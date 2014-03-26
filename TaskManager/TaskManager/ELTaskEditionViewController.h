//
//  ELTaskEditionViewController.h
//  TaskManager
//
//  Created by Sergey Rakov on 25.03.14.
//  Copyright (c) 2014 Org. All rights reserved.
//


#import <UIKit/UIKit.h>


@class ELTask;
@class ELTaskEditionViewController;


@protocol ELTaskEditionViewControllerDelegate <NSObject>

@required
- (void)taskEditionviewController:(ELTaskEditionViewController*)taskEditionViewController didCreateTask:(ELTask*)task;

@end


@interface ELTaskEditionViewController : UITableViewController

@property (weak, nonatomic) IBOutlet id<ELTaskEditionViewControllerDelegate> delegate;

@end
