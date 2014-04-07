//
//  ELTaskEditionViewController.m
//  TaskManager
//
//  Created by Sergey Rakov on 25.03.14.
//  Copyright (c) 2014 Org. All rights reserved.
//


#import "ELTask.h"
#import "ELTaskEditionTextInputCell.h"
#import "ELTaskEditionDateInputCell.h"
#import "ELTaskEditionViewController.h"


@interface ELTaskEditionViewController () <
    ELTaskEditionDateInputCellDelegate,
    ELTaskEditionTextInputCellDelegate
>

@property (nonatomic) ELTask *task;

@end


@implementation ELTaskEditionViewController

enum : NSUInteger {
    kTableRowName = 0,
    kTableRowDescription,
    kTableRowDate,
    kTableRowCount
};

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];

    if (!self.task) {
        self.task = [ELTask new];
    }
}


#pragma mark - UI Events

- (IBAction)onDoneButtonPressed:(id)sender {
    [self.delegate taskEditionViewController:self didCreateTask:self.task];
}

#pragma mark - Table View

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return kTableRowCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case kTableRowName:
            return [self nameTextFieldForTableView:tableView atIndexPath:indexPath];
        case kTableRowDescription:
            return [self descriptionTextFieldForTableView:tableView atIndexPath:indexPath];
        case kTableRowDate:
            return [self dateFieldForTableView:tableView atIndexPath:indexPath];
        default:
            return nil;
    }
}

- (UITableViewCell *)descriptionTextFieldForTableView:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath {
    ELTaskEditionTextInputCell *cell = [tableView dequeueReusableCellWithIdentifier:@"textInputCell" forIndexPath:indexPath];
    cell.fieldName = @"Описание";
    cell.text = self.task.taskDescription;
    cell.delegate = self;

    return cell;
}

- (UITableViewCell *)nameTextFieldForTableView:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath {
    ELTaskEditionTextInputCell *cell = [tableView dequeueReusableCellWithIdentifier:@"textInputCell" forIndexPath:indexPath];

    cell.fieldName = @"Название";
    cell.text = self.task.name;
    cell.delegate = self;

    return cell;
}

- (UITableViewCell *)dateFieldForTableView:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath {
    ELTaskEditionDateInputCell *cell = [tableView dequeueReusableCellWithIdentifier:@"dateInputCell" forIndexPath:indexPath];

    cell.fieldName = @"Дата";
    cell.date = self.task.date;
    cell.delegate = self;

    return cell;
}

#pragma mark - Delegates

- (void)textInputCellDidReceiveText:(ELTaskEditionTextInputCell *)cell {
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    
    if (indexPath.row == kTableRowName) {
        self.task.name = cell.text;
    } else if (indexPath.row == kTableRowDescription) {
        self.task.taskDescription = cell.text;
    }
}

- (void)dateInputCellDidReceiveDate:(ELTaskEditionDateInputCell *)cell {
    self.task.date = cell.date;
}

@end
