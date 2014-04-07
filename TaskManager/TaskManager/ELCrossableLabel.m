//
//  ELCrossableLabel.m
//  TaskManager
//
//  Created by Sergey Rakov on 29.03.14.
//  Copyright (c) 2014 Org. All rights reserved.
//


#import "ELCrossableLabel.h"


@implementation ELCrossableLabel


#pragma mark - Public

- (void)setCrossed:(BOOL)crossed {
    _crossed = crossed;
    [self setNeedsDisplay];
}

#pragma mark - Drawing

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    if (self.crossed) {
        [[UIColor blackColor] setStroke];
        [[UIBezierPath bezierPathWithRect:CGRectMake(0.0f, rect.size.height / 2, rect.size.width, 1.0f)] stroke];
    }
}

@end
