//
//  ELTaskEditionDateInputCell.h
//  TaskManager
//
//  Created by Sergey Rakov on 26.03.14.
//  Copyright (c) 2014 Org. All rights reserved.
//


#import <UIKit/UIKit.h>


@class ELTaskEditionDateInputCell;


@protocol ELTaskEditionDateInputCellDelegate <NSObject>

@required
- (void)dateInputCellDidReceiveDate:(ELTaskEditionDateInputCell*)cell;

@end


@interface ELTaskEditionDateInputCell : UITableViewCell

@property (weak, nonatomic) id<ELTaskEditionDateInputCellDelegate>delegate;
@property (strong, nonatomic) NSString *fieldName;
@property (strong, nonatomic) NSDate *date;

@end
