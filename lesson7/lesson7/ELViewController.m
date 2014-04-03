//
//  ELViewController.m
//  lesson7
//
//  Created by Alexey Storozhev on 02.04.14.
//  Copyright (c) 2014 e-legion. All rights reserved.
//

#import "ELViewController.h"
#import "ELWaitOperation.h"
#import "ELSingleton.h"

static NSString *const kELImageUrlString = @"http://www.wallpaperfunda.com/wp-content/uploads/2014/03/images-6.jpg";

@interface ELViewController ()

@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation ELViewController

- (IBAction)buttonTap:(id)sender
{
    [self startTimer];
    
//    [self performSelectorOnMainThread:@selector(startTimer)
//                           withObject:nil
//                        waitUntilDone:YES];
    
//    [self performSelectorInBackground:@selector(startTimer)
//                           withObject:nil];
}

- (void)startTimer
{
    if (![NSThread isMainThread]) {
        [self performSelectorOnMainThread:_cmd
                               withObject:nil
                            waitUntilDone:YES];
        
        return;
    }
    
    self.timer = ({
        NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.5f
                                                          target:self
                                                        selector:@selector(onTimerFired)
                                                        userInfo:nil
                                                         repeats:YES];
        timer;
    });
}

- (void)onTimerFired
{
    self.slider.value += 0.5;
}

- (IBAction)freeze:(id)sender
{
    NSLog(@"prepare to freeze");
    
    dispatch_queue_t queue = dispatch_queue_create("new queue", DISPATCH_QUEUE_CONCURRENT);
    
    __block BOOL isCancelled = NO;
    dispatch_async(queue, ^{
        if (isCancelled) {
            return;
        }
        NSLog(@"sleep 1");
    });
    
    isCancelled = YES;
    
    dispatch_sync(queue, ^{
        sleep(2);
    });
    
    dispatch_async(queue, ^{
        NSLog(@"sleep 2");
    });
    
    dispatch_sync(queue, ^{
        sleep(2);
    });
    
    NSLog(@"fdfasdf");
    
//    dispatch_sync(dispatch_get_main_queue(), ^{
//        sleep(2);
//    });
    
//    dispatch_sync(dispatch_get_global_queue(0, 0), ^{
//
//        
//        NSLog(@"sleep 1 done");
//        
//        dispatch_sync(dispatch_get_main_queue(), ^{
//            sleep(2);
//        });
//        
//        NSLog(@"sleep 2 done");
//    });
    
}

- (IBAction)operationsAction:(id)sender
{
//    NSOperationQueue *queue = [NSOperationQueue mainQueue];
    
    NSOperationQueue *queue = [NSOperationQueue new];
    [queue setMaxConcurrentOperationCount:2];
    NSLog(@"%d", [queue maxConcurrentOperationCount]);
    
//    NSMutableArray *operations = [NSMutableArray arrayWithCapacity:10];
//    
//    for (NSUInteger i=0; i<10; i++) {
//        NSString *operationIdentifier = [NSString stringWithFormat:@"operation %d", i];
//        ELWaitOperation *operation = [ELWaitOperation operationWithDelay:2
//                                                              identifier:operationIdentifier];
//        
//        [operation setCompletionBlock:^{
//            NSLog(@"%@ done", operationIdentifier);
//        }];
//        
//        if (i == 7) {
//            [operation setQueuePriority:NSOperationQueuePriorityVeryHigh];
//        }
//        if (i == 2) {
//            [operation setQueuePriority:NSOperationQueuePriorityVeryLow];
//        }
//        
//        [operations addObject:operation];
//    }
//    
//    [queue addOperations:operations waitUntilFinished:NO];
    
    ELWaitOperation *operation1 = [ELWaitOperation operationWithDelay:2
                                                           identifier:@"operation 1"];
    ELWaitOperation *operation2 = [ELWaitOperation operationWithDelay:5
                                                           identifier:@"operation 2"];
    ELWaitOperation *operation3 = [ELWaitOperation operationWithDelay:2
                                                           identifier:@"operation 3"];
    
    [operation3 addDependency:operation1];
    [operation3 addDependency:operation2];
    
    [queue addOperation:operation1];
    [[NSOperationQueue mainQueue] addOperation:operation2];
    
    [queue addOperation:operation3];
}

- (IBAction)loadImageSync:(id)sender
{
    self.imageView.image = nil;
    NSURL *url = [NSURL URLWithString:kELImageUrlString];
    NSData *imageData = [NSData dataWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:imageData];
    self.imageView.image = image;
}

- (IBAction)loadImageAsync:(id)sender
{
//    NSOperationQueue *backgroundQueue = [NSOperationQueue new];
    
    [self.activityIndicator startAnimating];
    
    self.imageView.image = nil;
    
    NSURL *url = [NSURL URLWithString:kELImageUrlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url
                                             cachePolicy:NSURLRequestUseProtocolCachePolicy
                                         timeoutInterval:0.5];
    
//    [NSURLConnection sendAsynchronousRequest:request
//                                       queue:backgroundQueue
//                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
//                               UIImage *image = [UIImage imageWithData:data];
//                               
//                               [[NSOperationQueue mainQueue] addOperationWithBlock:^{
//                                   self.imageView.image = image;
//                                   [self.activityIndicator stopAnimating];
//                               }];
//                           }];

//    dispatch_get_main_queue();
//    dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    dispatch_queue_create("my queue", DISPATCH_QUEUE_CONCURRENT);
    
    UIImageView *imageView = self.imageView;
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                               dispatch_queue_t backgroundQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
                               dispatch_async(backgroundQueue, ^{
                                   UIImage *image = [UIImage imageWithData:data];
                                   
                                   dispatch_async(dispatch_get_main_queue(), ^{
                                       imageView.image = image;
                                       [self.activityIndicator stopAnimating];
                                   });
                               });
                           }];

    NSLog(@"%@ exited", NSStringFromSelector(_cmd));
}

- (IBAction)testGCD:(id)sender
{
    __block NSString *string = [NSMutableString stringWithString:@"message"];
    
    __block BOOL boolValue = YES;
    
    dispatch_block_t block = ^{
        NSLog(@"addr: %p", string);
        NSLog(@"string: %@, bool: %d", string, boolValue);
    };
    
    string = @"test";
    boolValue = NO;
    
    block();
}

- (IBAction)testSingleton:(id)sender
{
    ELSingleton *singleton = [[ELSingleton alloc] init];
    singleton.count = 34567890;
    NSLog(@"%u", singleton.count);
}

@end
