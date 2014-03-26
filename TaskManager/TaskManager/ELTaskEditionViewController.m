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


typedef NS_ENUM(NSUInteger, ELTaskEditionTableRow)
{
    ELTaskEditionTableRowName = 0,
    ELTaskEditionTableRowDescription,
    ELTaskEditionTableRowDate,
    ELTaskEditionTableRowCount
};


@interface ELTaskEditionViewController ()
<
ELTaskEditionDateInputCellDelegate,
ELTaskEditionTextInputCellDelegate
>

@property (strong, nonatomic) ELTask *task;

@end


@implementation ELTaskEditionViewController


#pragma mark - Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    if (!self.task) {
        self.task = [ELTask new];
    }
}


#pragma mark - UI Events

- (IBAction)onDoneButtonPressed:(id)sender
{
    [self.delegate taskEditionviewController:self
                               didCreateTask:self.task];
}


#pragma mark - Table View

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return ELTaskEditionTableRowCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row)
    {
        case ELTaskEditionTableRowName:
        {
            ELTaskEditionTextInputCell *cell =
            [tableView dequeueReusableCellWithIdentifier:@"textInputCell"
                                            forIndexPath:indexPath];
            
            cell.fieldName = @"Название";
            cell.text = self.task.name;
            cell.delegate = self;
            
            return cell;
            break;
        }
        case ELTaskEditionTableRowDescription:
        {
            ELTaskEditionTextInputCell *cell =
            [tableView dequeueReusableCellWithIdentifier:@"textInputCell"
                                            forIndexPath:indexPath];
            
            cell.fieldName = @"Описание";
            cell.text = self.task.taskDescription;
            cell.delegate = self;
            
            return cell;
            break;
        }
        case ELTaskEditionTableRowDate:
        {
            ELTaskEditionDateInputCell *cell =
            [tableView dequeueReusableCellWithIdentifier:@"dateInputCell"
                                            forIndexPath:indexPath];
            
            cell.fieldName = @"Дата";
            cell.date = self.task.date;
            cell.delegate = self;
            
            return cell;
            break;
        }
        default:
        {
            return nil;
            break;
        }
    }
}


#pragma mark - Delegates

- (void)textInputCellDidReceiveText:(ELTaskEditionTextInputCell *)cell
{
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    
    if (indexPath.row == ELTaskEditionTableRowName) {
        self.task.name = cell.text;
    } else if (indexPath.row == ELTaskEditionTableRowDescription) {
        self.task.taskDescription = cell.text;
    }
}

- (void)dateInputCellDidReceiveDate:(ELTaskEditionDateInputCell *)cell
{
    self.task.date = cell.date;
}

@end
