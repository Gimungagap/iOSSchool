//
//  MTViewController.m
//  UIKitTest3
//
//  Created by Sergey Rakov on 22.03.14.
//  Copyright (c) 2014 Сергей Раков. All rights reserved.
//

#import "MTViewController.h"

@interface MTViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSArray *objects;

@end

@implementation MTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.objects = @[@[@"01", @"02", @"03"],
                     @[@"11", @"12"],
                     @[@"21", @"22", @"23", @"24"]];
}


#pragma mark - UITableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.objects count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.objects[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
    cell.textLabel.text = self.objects[indexPath.section][indexPath.row];
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
//    return @"123";
    return [NSString stringWithFormat:@"%d", section];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%@", self.objects[indexPath.section][indexPath.row]);
}

@end
