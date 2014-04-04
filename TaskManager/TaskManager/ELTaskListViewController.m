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


@interface ELTaskListViewController () <
    UITableViewDelegate,
    UITableViewDataSource,
    ELTaskEditionViewControllerDelegate
>

@property (nonatomic) NSMutableArray *tasksToDo;
@property (nonatomic) NSMutableArray *tasksDone;

@end


@implementation ELTaskListViewController

enum : NSUInteger {
    kSectionToDo = 0,
    kSectionDone,
    kSectionCount
};

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];

    [self generateData];
}

#pragma mark - UI Events

- (IBAction)onTableSwiped:(UISwipeGestureRecognizer *)sender {
    CGPoint location = [sender locationInView:self.tableView];
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:location];
    
    if (sender.direction == UISwipeGestureRecognizerDirectionLeft && indexPath.section == kSectionDone) {
        [self toggleStateForIndexPath:indexPath];
    } else if (sender.direction == UISwipeGestureRecognizerDirectionRight && indexPath.section == kSectionToDo) {
        [self toggleStateForIndexPath:indexPath];
    }
}

#pragma mark - Logics

- (void)generateData {
    ELTask *task1 = [[ELTask alloc] init];
    task1.name = @"Task1";
    task1.date = [NSDate date];
    task1.taskDescription = @"Comment1";
    task1.imageName = @"av1";
    
    ELTask *task2 = [[ELTask alloc] init];
    task2.name = @"Task2";
    task2.date = [NSDate date];
    task2.taskDescription = @"Comment2";
    task2.imageName = @"av2";
    
    self.tasksDone = [NSMutableArray arrayWithArray:@[ task1, task2 ]];
    self.tasksToDo = [NSMutableArray array];
}


#pragma mark - Table View

- (ELTask *)taskAtIndexPath:(NSIndexPath*)indexPath {
    NSUInteger index = (NSUInteger) indexPath.row;

    ELTask *result;
    switch (indexPath.section) {
        case kSectionToDo:
            result = self.tasksToDo[index];
            break;
        case kSectionDone:
            result = self.tasksDone[index];
            break;
        default:
            NSAssert(NO, @"Unknown type of section: %d", indexPath.section);
    }

    return result;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return kSectionCount;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger result = 0;

    switch (section) {
        case kSectionToDo:
            result = [self.tasksToDo count];
            break;
        case kSectionDone:
            result = [self.tasksDone count];
            break;
        default:
            NSAssert(NO, @"Unknown type of section: %d", section);
    }

    return result;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"taskCell"];
    
    ELTask *task = [self taskAtIndexPath:indexPath];

    ELCrossableLabel *label = (ELCrossableLabel *)[cell viewWithTag:17];
    label.crossed = indexPath.section == kSectionDone;
    label.text = task.name;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ELTask *task = [self taskAtIndexPath:indexPath];
    [self performSegueWithIdentifier:@"taskDetails" sender:task];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *result;

    switch (section) {
        case kSectionToDo:
            result = @"To Do";
            break;
        case kSectionDone:
            result = @"Done";
            break;
        default:
            NSAssert(NO, @"Unknown type of section: %d", section);
    }

    return result;
}

- (void)toggleStateForIndexPath:(NSIndexPath *)indexPath {
    ELTask *task = [self taskAtIndexPath:indexPath];
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    ELCrossableLabel *label = (ELCrossableLabel *)[cell viewWithTag:17];
    
    [self.tableView beginUpdates];
    
    if (indexPath.section == kSectionToDo) {
        [self markTask:task done:YES withLabel:label];
    } else if (indexPath.section == kSectionDone) {
        [self markTask:task done:NO withLabel:label];
    }
    [self.tableView moveRowAtIndexPath:indexPath toIndexPath:[NSIndexPath indexPathForRow:0 inSection:kSectionDone]];

    [self.tableView endUpdates];
}

- (void)moveTask:(ELTask *)task fromList:(NSMutableArray *)fromList toList:(NSMutableArray *)toList {
    [fromList removeObject:task];
    [toList addObject:task];
}

- (void)markTask:(ELTask *)task done:(BOOL)done withLabel:(ELCrossableLabel *)label {
    NSMutableArray *from = done ? self.tasksToDo : self.tasksDone;
    NSMutableArray *to = done ? self.tasksDone : self.tasksToDo;
    [self moveTask:task fromList:from toList:to];
    label.crossed = done;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"taskDetails"]) {
        ELTaskDetailsViewController *target = segue.destinationViewController;
        target.task = sender;
    } else if ([segue.identifier isEqualToString:@"taskEdition"]) {
        UINavigationController *destination = segue.destinationViewController;
        ELTaskEditionViewController *editionVC = (ELTaskEditionViewController *)destination.topViewController;
        editionVC.delegate = self;
    }
}


#pragma mark - Edition

- (void)taskEditionViewController:(ELTaskEditionViewController *)taskEditionViewController didCreateTask:(ELTask *)task {
    [self.tasksToDo addObject:task];
    [self.tableView reloadData];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
