//
//  MTAppDelegate.m
//  UIKitTest4
//
//  Created by Sergey Rakov on 22.03.14.
//  Copyright (c) 2014 Сергей Раков. All rights reserved.
//

#import "MTAppDelegate.h"

@implementation MTAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self applyAppearance];
    
    return YES;
}


- (void)applyAppearance
{
//    [[UIView appearance] setBackgroundColor:[UIColor purpleColor]];
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"clock"]
                                       forBarMetrics:UIBarMetricsDefault];
//    [[UIImageView appearance] setBackgroundColor:[UIColor yellowColor]];
//    [[UIImageView appearanceWhenContainedIn:[UINavigationBar class], nil]
//     setBackgroundColor:[UIColor yellowColor]];
}

@end
