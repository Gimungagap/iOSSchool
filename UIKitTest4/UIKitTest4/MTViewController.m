//
//  MTViewController.m
//  UIKitTest4
//
//  Created by Sergey Rakov on 22.03.14.
//  Copyright (c) 2014 Сергей Раков. All rights reserved.
//

#import "MTNibView.h"
#import "MTXIBViewController.h"
#import "MTViewController.h"

@interface MTViewController ()

@end

@implementation MTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor redColor];

    UIImage *image = [UIImage imageNamed:@"1app"];
    //    image = [UIImage imageWithCGImage:image.CGImage
    //                                scale:2.0f
    //                          orientation:image.imageOrientation];
    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10)
                                  resizingMode:UIImageResizingModeStretch];

    
//    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
////    imageView.backgroundColor = [UIColor greenColor];
////    imageView.contentMode = UIViewContentModeCenter;
//    [self.view addSubview:imageView];
//    imageView.image = image;


    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 100, 100);
    [button setTitle:@"123" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [button setBackgroundImage:image forState:UIControlStateNormal];
    [button addTarget:self action:@selector(onButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    button.adjustsImageWhenHighlighted = YES;
    [self.view addSubview:button];
 
    
//    UINib *nib = [UINib nibWithNibName:@"XIBView" bundle:nil];
//    id nibObjects = [nib instantiateWithOwner:nil options:nil];
//    MTNibView *nibView = [nibObjects firstObject];
//    nibView.label.text = @"text";
//    [self.view addSubview:nibView];
}

- (void)onButtonPressed:(id)sender
{
    [self.navigationController pushViewController:[[MTXIBViewController alloc] initWithNibName:@"MTXIBViewController" bundle:nil]
                                         animated:YES];
//    MTXIBViewController *xibVC = [MTXIBViewController new];
//    [self presentViewController:xibVC
//                       animated:YES
//                     completion:^{
//                         [self dismissViewControllerAnimated:YES
//                                                  completion:nil];
//                     }];
}

@end
