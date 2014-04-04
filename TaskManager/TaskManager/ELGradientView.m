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

+ (Class)layerClass {
    return [CAGradientLayer class];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    CAGradientLayer *layer = (CAGradientLayer *) self.layer;
    layer.colors = @[ (__bridge id)[UIColor whiteColor].CGColor, (__bridge id)[UIColor greenColor].CGColor ];
    layer.startPoint = CGPointZero;
    layer.endPoint = CGPointMake(1.0f, 1.0f);
}

@end
