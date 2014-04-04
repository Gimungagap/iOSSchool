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


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.taskImageView.image = [UIImage imageNamed:self.task.imageName];
    self.taskNameLabel.text = self.task.name;
    self.taskDateLabel.text = [[self dateFormatter] stringFromDate:self.task.date];
    self.taskDescriptionLabel.text = self.task.taskDescription;
}

#pragma mark - Touches

- (NSDateFormatter *)dateFormatter {
    static NSDateFormatter *dateFormatter;

    static dispatch_once_t token;
    dispatch_once(&token, ^{
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateStyle:NSDateFormatterFullStyle];
        [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
        [dateFormatter setLocale:[NSLocale localeWithLocaleIdentifier:@"ru_RU"]];
        [dateFormatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"MSK"]];
    });

    return dateFormatter;
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"photo"]) {
        ELTaskImageViewController *dest = segue.destinationViewController;
        dest.imageName = self.task.imageName;
    }
}

@end
