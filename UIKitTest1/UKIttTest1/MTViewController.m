//
//  MTViewController.m
//  UKIttTest1
//
//  Created by Sergey Rakov on 19.03.14.
//  Copyright (c) 2014 Сергей Раков. All rights reserved.
//


#import "MTView.h"
#import "MTViewController.h"


@interface MTViewController ()

@property (weak, nonatomic) IBOutlet UIButton *button;

@end


@implementation MTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    //Свойства для навигации
    self.navigationItem.title = @"123123";
    //self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"bbb" style:UIBarButtonItemStylePlain target:nil action:NULL];
    
    //Иерархия и свойства view
//    MTView *subview = [[MTView alloc]
//                       initWithFrame:CGRectMake(100,
//                                                100,
//                                                100,
//                                                100)];
//    subview.backgroundColor = [UIColor colorWithWhite:0 alpha:1];
//    //subview.hidden = YES;
//    subview.clipsToBounds = YES;
////    subview.transform = CGAffineTransformMakeRotation(M_PI_4/2);
////    subview.transform = CGAffineTransformConcat(CGAffineTransformMakeRotation(M_PI_4/2), CGAffineTransformMakeRotation(M_PI_4/2));
//    
//    [self.view addSubview:subview];
    
//    UIView *subsubview = [[UIView alloc]
//                       initWithFrame:CGRectMake(10,
//                                                10,
//                                                200,
//                                                200)];
//    subsubview.backgroundColor = [UIColor greenColor];
//    [subview addSubview:subsubview];
//
    
//    self.button.userInteractionEnabled = NO;
    
}


#pragma mark - Логика Навигации

- (IBAction)onButtonPressed:(id)sender
{
    if (YES) {
        //Ручное управление VC
//        UIViewController *vc = [self.storyboard
//                                instantiateViewControllerWithIdentifier:@"vcID"];
//        [self.navigationController pushViewController:vc animated:YES];

        //Ручной запуск перехода по segue
        [self performSegueWithIdentifier:@"segue1" sender:self];
    }

    //Свойства Navigation Controller
//    UINavigationController *navigationController = self.navigationController;
//    navigationController.topViewController
//    navigationController.viewControllers
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //Конфигурация при переходе по segue
    if ([segue.identifier isEqualToString:@"segue1"]) {
//        NSLog(@"sourc:%@ dest:%@",
//              segue.sourceViewController,
//              segue.destinationViewController);
        [segue.destinationViewController view].backgroundColor = [UIColor cyanColor];
    }
}

@end













