//
//  MTView.m
//  UKIttTest1
//
//  Created by Sergey Rakov on 19.03.14.
//  Copyright (c) 2014 Сергей Раков. All rights reserved.
//

#import "MTView.h"

@implementation MTView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
      //  NSLog(@"self initialized");
    }
    return self;
}

- (void)willMoveToSuperview:(UIView *)newSuperview
{
 //   NSLog(@"%@", newSuperview);
}



@end
