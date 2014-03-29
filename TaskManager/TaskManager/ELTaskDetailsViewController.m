//
//  ELTaskDetailsViewController.m
//  TaskManager
//
//  Created by Sergey Rakov on 25.03.14.
//  Copyright (c) 2014 Org. All rights reserved.
//


#import "ELTask.h"
#import "ELTaskImageViewController.h"
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
    
    static NSDateFormatter *dateFormatter;
    if (!dateFormatter) {
        dateFormatter = [NSDateFormatter new];
    }

    self.taskImageView.image = [UIImage imageNamed:self.task.imageName];
    self.taskNameLabel.text = self.task.name;
    
//    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateStyle:NSDateFormatterFullStyle];
    [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
    NSLocale *locale = [NSLocale localeWithLocaleIdentifier:@"ru_RU"];
    [dateFormatter setLocale:locale];
    
    NSString *dateString = [dateFormatter stringFromDate:self.task.date];
    
    NSDate *date = [dateFormatter dateFromString:dateString];
    NSLog(@"date: %@", date);
    
    self.taskDateLabel.text = dateString;
    self.taskDescriptionLabel.text = self.task.taskDescription;
}


#pragma mark - Touches

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self performSegueWithIdentifier:@"photo" sender:nil];
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"photo"]) {
        ELTaskImageViewController *dest = (id)segue.destinationViewController;
        dest.imageName = self.task.imageName;
    }
}

//- (void)viewDidLayoutSubviews
//{
//    [super viewDidLayoutSubviews];
//    
//    UITableView *tableView = [self.view.subviews firstObject];
//    tableView.frame = self.view.bounds;
//}

@end
