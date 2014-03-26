//
//  ELTaskDetailsViewController.m
//  TaskManager
//
//  Created by Sergey Rakov on 25.03.14.
//  Copyright (c) 2014 Org. All rights reserved.
//


#import "ELTask.h"
#import "ELTaskDetailsViewController.h"


@interface ELTaskDetailsViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *taskImageView;
@property (weak, nonatomic) IBOutlet UILabel *taskNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *taskDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *taskDescriptionLabel;

@end


@implementation ELTaskDetailsViewController


#pragma mark - Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.taskImageView.image = [UIImage imageNamed:self.task.imageName];
    self.taskNameLabel.text = self.task.name;
    self.taskDateLabel.text = self.task.date.description;
    self.taskDescriptionLabel.text = self.task.taskDescription;
}


//- (void)viewDidLayoutSubviews
//{
//    [super viewDidLayoutSubviews];
//    
//    UITableView *tableView = [self.view.subviews firstObject];
//    tableView.frame = self.view.bounds;
//}

@end
