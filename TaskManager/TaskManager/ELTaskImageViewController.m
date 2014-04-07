//
//  ELTaskImageViewController.m
//  TaskManager
//
//  Created by Sergey Rakov on 25.03.14.
//  Copyright (c) 2014 Org. All rights reserved.
//


#import "ELTaskImageViewController.h"


@interface ELTaskImageViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end


@implementation ELTaskImageViewController


#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];

    self.imageView.image = [UIImage imageNamed:self.imageName];

    self.imageView.layer.borderColor = [UIColor redColor].CGColor;
    self.imageView.layer.borderWidth = 2.0f;
    self.imageView.layer.cornerRadius = 15.0f;
    self.imageView.layer.masksToBounds = YES;
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = self.imageView.bounds;
    shapeLayer.path = [UIBezierPath bezierPathWithOvalInRect:shapeLayer.bounds].CGPath;
    self.imageView.layer.mask = shapeLayer;

    UIPinchGestureRecognizer *pinchRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(onPinch:)];
    [self.view addGestureRecognizer:pinchRecognizer];
    
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTap:)];
    [self.view addGestureRecognizer:tapRecognizer];
}


#pragma mark - Gestures

- (void)onPinch:(UIPinchGestureRecognizer*)pinchRecognizer {
    CGFloat scale = pinchRecognizer.scale;
    self.imageView.transform = CGAffineTransformMakeScale(scale, scale);
}

- (void)onTap:(UITapGestureRecognizer*)tapRecognizer {
    [UIView animateKeyframesWithDuration:0.25
                                   delay:0
                                 options:UIViewKeyframeAnimationOptionAutoreverse
                              animations:^{
                                self.imageView.transform = CGAffineTransformMakeScale(2, 2);
                            } completion:^(BOOL _) {
                                self.imageView.transform = CGAffineTransformIdentity;
    }];
}

@end
