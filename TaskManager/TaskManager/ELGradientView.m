//
//  ELGradientView.m
//  TaskManager
//
//  Created by Sergey Rakov on 29.03.14.
//  Copyright (c) 2014 Org. All rights reserved.
//


#import <QuartzCore/QuartzCore.h>
#import "ELGradientView.h"


@implementation ELGradientView

+ (Class)layerClass
{
    return [CAGradientLayer class];
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    CAGradientLayer *layer = (id)self.layer;
    layer.colors = @[(id)[UIColor whiteColor].CGColor,
                     (id)[UIColor greenColor].CGColor];
    layer.startPoint = CGPointMake(0.0f, 0.0f);
    layer.endPoint = CGPointMake(1.0f, 1.0f);
}

@end
