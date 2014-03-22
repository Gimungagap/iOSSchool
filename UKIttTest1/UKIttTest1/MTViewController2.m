//
//  MTViewController2ViewController.m
//  UKIttTest1
//
//  Created by Sergey Rakov on 19.03.14.
//  Copyright (c) 2014 Сергей Раков. All rights reserved.
//

#import "MTViewController2.h"

@interface MTViewController2 ()

@end

@implementation MTViewController2

- (void)viewDidLoad
{
    [super viewDidLoad];

    //Свойства button
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"title" forState:UIControlStateNormal];
    button.frame = CGRectMake(100, 100, 100, 100);
    [button addTarget:self
               action:@selector(onButtonPressed:)
     forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
}

- (void)onButtonPressed:(UIButton*)button
{
    //Переход назад вручную через navigation controller
    [self.navigationController popViewControllerAnimated:YES];
}

@end
