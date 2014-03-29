//
//  ELAppDelegate.m
//  localNotificationsSample
//
//  Created by Alexey Storozhev on 29.03.14.
//  Copyright (c) 2014 e-legion. All rights reserved.
//

#import "ELAppDelegate.h"
#import "IIViewDeckController.h"
#import "YGGeoObject.h"

@implementation ELAppDelegate

- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSString *versionString = [[UIDevice currentDevice] systemVersion];
    NSComparisonResult comparisonResult
     = [versionString compare:@"7.0.2" options:NSNumericSearch];
    
    if (launchOptions[UIApplicationLaunchOptionsLocalNotificationKey]) {
        UILocalNotification *notification
        = launchOptions[UIApplicationLaunchOptionsLocalNotificationKey];
        
        [self processLocalNotification:notification];
    }
    
    UILocalNotification *notification = [UILocalNotification new];
    
    [notification setAlertBody:@"AlertBody"];
    [notification setAlertAction:@"AlertAction"];
    
    
    __unused UIImage *image = [UIImage imageNamed:@"LaunchImageGreen"];
    [notification setAlertLaunchImage:@"LaunchImageGreen"];
//    __unused UIImage *image = [UIImage imageNamed:@"Default_"];
//    [notification setAlertLaunchImage:@"Default_"];
    
    notification.applicationIconBadgeNumber = 2;
    
    [application cancelAllLocalNotifications];
    
    NSDate *currentDate = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *components = [NSDateComponents new];
    [components setSecond:5];
    
    NSDate *fireDate
    = [calendar dateByAddingComponents:components
                                toDate:currentDate
                               options:0];
    
    [notification setFireDate:fireDate];
    
    NSLog(@"before adding: %d", [[application scheduledLocalNotifications] count]);
    
    [application scheduleLocalNotification:notification];
    
    NSLog(@"after adding: %d", [[application scheduledLocalNotifications] count]);
    
//    [notifications enumerateObjectsUsingBlock:^(UILocalNotification *notification, NSUInteger index, BOOL *stop) {
//        [application cancelLocalNotification:notification];
//    }];
//    
//    [application cancelAllLocalNotifications];
    
//    [application presentLocalNotificationNow:notification];
//    [application cancelLocalNotification:notification];
    
    NSLog(@"after present: %d", [[application scheduledLocalNotifications] count]);
    
    return YES;
}

- (void)application:(UIApplication *)application
didReceiveLocalNotification:(UILocalNotification *)notification
{
//    NSLog(@"notification: %@", notification);
    
    [self processLocalNotification:notification];
}

- (void)processLocalNotification:(UILocalNotification *)notification
{
    NSString *alertTitle = NSLocalizedString(@"LocalizedText1", nil);
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:alertTitle
                                                        message:NSLocalizedString([notification alertBody], nil)
                                                       delegate:nil
                                              cancelButtonTitle:NSLocalizedString(@"Cancel", nil)
                                              otherButtonTitles:[notification alertAction], nil];
    [alertView show];
    
    [UIApplication sharedApplication].applicationIconBadgeNumber
        -= [notification applicationIconBadgeNumber];
}

@end
