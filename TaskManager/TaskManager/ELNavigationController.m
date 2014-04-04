//
//  ELNavigationController.m
//  TaskManager
//
//  Created by Sergey Rakov on 26.03.14.
//  Copyright (c) 2014 Org. All rights reserved.
//


#import "ELNavigationController.h"


@interface ELNavigationController ()

@end


@implementation ELNavigationController

- (BOOL)shouldAutorotate {
    if (self.topViewController && [self.topViewController respondsToSelector:@selector(shouldAutorotate)]) {
        return [self.topViewController shouldAutorotate];
    } else {
        return [super shouldAutorotate];
    }
}

- (NSUInteger)supportedInterfaceOrientations {
    if (self.topViewController && [self.topViewController respondsToSelector:@selector(supportedInterfaceOrientations)]) {
        return [self.topViewController supportedInterfaceOrientations];
    } else {
        return [super supportedInterfaceOrientations];
    }
}

@end
