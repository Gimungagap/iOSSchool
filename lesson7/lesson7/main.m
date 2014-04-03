//
//  main.m
//  lesson7
//
//  Created by Alexey Storozhev on 02.04.14.
//  Copyright (c) 2014 e-legion. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ELAppDelegate.h"

@interface ELApplication : UIApplication
@end

@implementation ELApplication
{
    NSDate *_launchDate;
    NSDate *_lastTouchEventDate;
    NSTimer *_timer;
}

- (id)init
{
    self = [super init];
    if (self) {
        _launchDate = [NSDate date];
        _timer = [NSTimer scheduledTimerWithTimeInterval:1.0f
                                                  target:self
                                                selector:@selector(checkLastTouchEventDate)
                                                userInfo:nil
                                                 repeats:YES];
    }
    return self;
}

- (void)checkLastTouchEventDate
{
    NSDate *checkDate = _lastTouchEventDate ?: _launchDate;
    NSTimeInterval timeInterval = [[NSDate date] timeIntervalSinceDate:checkDate];
    if (timeInterval > 3) {
        
//        NSLog(@"did nothing");
    }
}

- (void)sendEvent:(UIEvent *)event
{
    [super sendEvent:event];
    
    if (event.type == UIEventTypeTouches) {
        _lastTouchEventDate = [NSDate date];
    }
}

@end


int main(int argc, char * argv[])
{
    @autoreleasepool {
        return UIApplicationMain(
                                 argc,
                                 argv,
                                 NSStringFromClass([ELApplication class]),
                                 NSStringFromClass([ELAppDelegate class])
                                 );
    }
}
