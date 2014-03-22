//
//  MTViewController2.m
//  UIKitTest3
//
//  Created by Sergey Rakov on 22.03.14.
//  Copyright (c) 2014 Сергей Раков. All rights reserved.
//

#import "MTViewController2.h"

@interface MTViewController2 () <UICollectionViewDataSource, UICollectionViewDelegate>

@end

@implementation MTViewController2

- (void)viewDidLoad
{
    [super viewDidLoad];

    
}


#pragma mark - Collection

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell1" forIndexPath:indexPath];

    UILabel *label = (UILabel*)[cell viewWithTag:10];
    label.text = [NSString stringWithFormat:@"%d", indexPath.row];
    
    return cell;
}

@end
