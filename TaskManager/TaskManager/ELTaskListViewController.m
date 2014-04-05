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
#import "ELContextProvider.h"


@interface ELTaskListViewController () <
    UITableViewDelegate,
    UITableViewDataSource,
    ELTaskEditionViewControllerDelegate,
    NSFetchedResultsControllerDelegate,
UISearchDisplayDelegate
>

@property (nonatomic) NSFetchedResultsController *frc;

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
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:NSStringFromClass([ELTask class])];
    [fetchRequest setSortDescriptors:@[ [NSSortDescriptor sortDescriptorWithKey:@"done" ascending:YES],  [NSSortDescriptor sortDescriptorWithKey:@"date" ascending:NO] ]];

    NSManagedObjectContext *context = [[ELContextProvider sharedInstance] context];
    
    self.frc = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:context sectionNameKeyPath:@"done" cacheName:nil];
    self.frc.delegate = self;
    if (![self.frc performFetch:NULL]) {
        NSLog(@"Error loading data");
    }
    
    NSLog(@"%@", [[self.frc.fetchedObjects firstObject] objectID]);
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
    NSManagedObjectContext *context = [[ELContextProvider sharedInstance] context];
    
    ELTask *task1 = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([ELTask class]) inManagedObjectContext:context];
    task1.name = @"Kill Alexei for those restrictions (once)";
    task1.taskDescription = @"Comment 1";
    
    ELTask *task2 = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([ELTask class]) inManagedObjectContext:context];

    task2.name = @"Kill Alexei for those restrictions (twice, to death)";
    task2.taskDescription = @"Comment 2";
    
    NSError *error;
    if (![context save:&error]) {
        NSLog(@"Error saving context: %@", error);
    }
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
//    if (self.searchDisplayController.searchResultsTableView == tableView) {
//        return 1;
//    } else {
        return [[self.frc sections] count];
    //    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    if (tableView == self.searchDisplayController.searchResultsTableView) {
//        return 0;
//    } else {
//    
    return [[self.frc sections][section] numberOfObjects];
//    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (tableView == self.searchDisplayController.searchResultsTableView) {
//        return nil;
//    } else {
    UITableViewCell *cell;
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"taskCell"];
        cell.textLabel.text = [[self.frc objectAtIndexPath:indexPath] name];
    } else {
    
        cell = [tableView dequeueReusableCellWithIdentifier:@"taskCell"];
    
    ELTask *task = [self.frc objectAtIndexPath:indexPath];

    ELCrossableLabel *label = (ELCrossableLabel *)[cell viewWithTag:17];
    label.crossed = indexPath.section == kSectionDone;
    label.text = task.name;
        NSLog(@"Time: %@", task.time);
    }
    
    
    return cell;
//    }
}

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {

}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath {
    
    [CATransaction setCompletionBlock:^{
        [self.tableView reloadRowsAtIndexPaths:@[ newIndexPath] withRowAnimation:UITableViewRowAnimationNone];
    }];
    [self.tableView moveRowAtIndexPath:indexPath toIndexPath:newIndexPath];
}

- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id<NSFetchedResultsSectionInfo>)sectionInfo atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type {
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ELTask *task = [self.frc objectAtIndexPath:indexPath];
    [self performSegueWithIdentifier:@"taskDetails" sender:task];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *result = [[self.frc sections][section] name];
    return [result isEqualToString:@"0"] ? @"Undone" : @"Done";
}

- (void)toggleStateForIndexPath:(NSIndexPath *)indexPath {
    ELTask *task = [self.frc objectAtIndexPath:indexPath];
    [task toggleState];
    
    NSLog(@"Done: %@", task.done ? @"YES" : @"NO");
    
    NSError *error;
    if (![self.frc.managedObjectContext save:&error]) {
        NSLog(@"Error saving data: %@", error);
    }
}

- (void)moveTask:(ELTask *)task fromList:(NSMutableArray *)fromList toList:(NSMutableArray *)toList {
    [fromList removeObject:task];
    [toList addObject:task];
}

- (void)markTask:(ELTask *)task done:(BOOL)done withLabel:(ELCrossableLabel *)label {
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
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString {
    NSFetchRequest *request = self.frc.fetchRequest;
    [request setPredicate:[NSPredicate predicateWithFormat:@"name LIKE %@", searchString]];
    [request setSortDescriptors:@[ [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES ]]];
    
    NSError *error;
    if (![self.frc performFetch:&error]) {
        NSLog(@"Error fetching search: %@", error);
    }
    
    [controller.searchResultsTableView reloadData];
    
    return YES;
}

- (void)searchDisplayController:(UISearchDisplayController *)controller didLoadSearchResultsTableView:(UITableView *)tableView {
    [tableView reloadData];
}

@end
