//
//  ELViewController.m
//  TaskManager
//
//  Created by Sergey Rakov on 25.03.14.
//  Copyright (c) 2014 Org. All rights reserved.
//


#import "ELTask.h"
#import "ELTaskListViewController.h"


@interface ELTaskListViewController () <UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) NSArray *tasks;

@end


@implementation ELTaskListViewController


#pragma mark - Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self generateData];
}


#pragma mark - Logics

- (void)generateData
{
    ELTask *task1 = [ELTask new];
    task1.name = @"Task1";
    task1.date = [NSDate date];
    task1.taskDescription = @"Comment1";
    task1.imageName = @"av1";
    
    ELTask *task2 = [ELTask new];
    task2.name = @"Task2";
    task2.date = [NSDate date];
    task2.taskDescription = @"Comment2";
    task2.imageName = @"av2";
    
    self.tasks = @[task1, task2];
}


#pragma mark - Table View

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.tasks count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"taskCell"];
    
    ELTask *task = self.tasks[indexPath.row];
    
    cell.textLabel.text = task.name;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"taskDetails" sender:nil];
}

@end
