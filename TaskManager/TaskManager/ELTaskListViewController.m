//
//  ELViewController.m
//  TaskManager
//
//  Created by Sergey Rakov on 25.03.14.
//  Copyright (c) 2014 Org. All rights reserved.
//


#import "ELTask.h"
#import "ELTaskDetailsViewController.h"
#import "ELTaskEditionViewController.h"
#import "ELTaskListViewController.h"


@interface ELTaskListViewController ()
<
UITableViewDelegate,
UITableViewDataSource,
ELTaskEditionViewControllerDelegate
>

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
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", task.date];
    cell.imageView.image = [UIImage imageNamed:task.imageName];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ELTask *task = self.tasks[indexPath.row];
    [self performSegueWithIdentifier:@"taskDetails" sender:task];
}


#pragma mark - Rtation

- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskLandscapeLeft;
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"taskDetails"]) {
        ELTaskDetailsViewController *target = segue.destinationViewController;
        target.task = sender;
    } else if ([segue.identifier isEqualToString:@"taskEdition"]) {
        UINavigationController *destination = segue.destinationViewController;
        ELTaskEditionViewController *editionVC =
                                    (id)destination.topViewController;
        editionVC.delegate = self;
    }
}


#pragma mark - Edition

- (void)taskEditionviewController:(ELTaskEditionViewController *)taskEditionViewController didCreateTask:(ELTask *)task
{
    self.tasks = [self.tasks arrayByAddingObject:task];
    [self.tableView reloadData];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
