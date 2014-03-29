//
//  ELViewController.m
//  TaskManager
//
//  Created by Sergey Rakov on 25.03.14.
//  Copyright (c) 2014 Org. All rights reserved.
//


#import "ELCrossableLabel.h"
#import "ELTask.h"
#import "ELTaskDetailsViewController.h"
#import "ELTaskEditionViewController.h"
#import "ELTaskListViewController.h"


typedef NS_ENUM(NSUInteger, ELTaskListSection)
{
    ELTaskListSectionToDo = 0,
    ELTaskListSectionDone,
    ELTaskListSectionCount
};


@interface ELTaskListViewController ()
<
UITableViewDelegate,
UITableViewDataSource,
ELTaskEditionViewControllerDelegate
>

@property (strong, nonatomic) NSMutableArray *tasksToDo;
@property (strong, nonatomic) NSMutableArray *tasksDone;

@end


@implementation ELTaskListViewController


#pragma mark - Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self generateData];
}


#pragma mark - UI Events

- (IBAction)onTableSwiped:(UISwipeGestureRecognizer*)sender
{
    CGPoint location = [sender locationInView:self.tableView];
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:location];
    
    if (sender.direction == UISwipeGestureRecognizerDirectionLeft &&
        indexPath.section == ELTaskListSectionDone) {
        [self toggleStateForIndexPath:indexPath];
    } else if (sender.direction == UISwipeGestureRecognizerDirectionRight &&
               indexPath.section == ELTaskListSectionToDo) {
        [self toggleStateForIndexPath:indexPath];
    }
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
    
//    self.tasksToDo = [@[task1, task2] mutableCopy];
//    self.tasksDone = [NSMutableArray array];
    self.tasksDone = [@[task1, task2] mutableCopy];
    self.tasksToDo = [NSMutableArray array];
    
}


#pragma mark - Table View

- (ELTask*)taskAtIndexPath:(NSIndexPath*)indexPath
{
    if (indexPath.section == ELTaskListSectionToDo) {
        return self.tasksToDo[indexPath.row];
    } else if (indexPath.section == ELTaskListSectionDone) {
        return self.tasksDone[indexPath.row];
    } else {
        return nil;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return ELTaskListSectionCount;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == ELTaskListSectionToDo) {
        return [self.tasksToDo count];
    } else if (section == ELTaskListSectionDone) {
        return [self.tasksDone count];
    } else {
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"taskCell"];
    
    ELTask *task = [self taskAtIndexPath:indexPath];

    ELCrossableLabel *label = (id)[cell viewWithTag:17];
    label.crossed = indexPath.section == ELTaskListSectionDone;
    label.text = task.name;
    
//    cell.textLabel.text = task.name;
//    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", task.date];
//    cell.imageView.image = [UIImage imageNamed:task.imageName];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ELTask *task = [self taskAtIndexPath:indexPath];
    [self performSegueWithIdentifier:@"taskDetails" sender:task];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == ELTaskListSectionToDo) {
        return @"ToDo";
    } else if (section == ELTaskListSectionDone) {
        return @"Done";
    } else {
        return nil;
    }
}

- (void)toggleStateForIndexPath:(NSIndexPath*)indexPath
{
    ELTask *task = [self taskAtIndexPath:indexPath];
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    ELCrossableLabel *label = (id)[cell viewWithTag:17];
    
    [self.tableView beginUpdates];
    
    if (indexPath.section == ELTaskListSectionToDo) {
        [self.tasksToDo removeObject:task];
        [self.tasksDone addObject:task];
        [self.tableView moveRowAtIndexPath:indexPath toIndexPath:[NSIndexPath indexPathForRow:0 inSection:ELTaskListSectionDone]];
        label.crossed = YES;
    } else if (indexPath.section == ELTaskListSectionDone) {
        [self.tasksDone removeObject:task];
        [self.tasksToDo addObject:task];
        [self.tableView moveRowAtIndexPath:indexPath toIndexPath:[NSIndexPath indexPathForRow:0 inSection:ELTaskListSectionToDo]];
        label.crossed = NO;
    }
    
    [self.tableView endUpdates];
}


#pragma mark - Rotation

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
    [self.tasksToDo addObject:task];
    [self.tableView reloadData];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
