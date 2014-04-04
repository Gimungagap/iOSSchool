//
//  ELTaskEditionDateInputCell.h
//  TaskManager
//
//  Created by Sergey Rakov on 26.03.14.
//  Copyright (c) 2014 Org. All rights reserved.
//


@import UIKit;


@protocol ELTaskEditionDateInputCellDelegate;

@interface ELTaskEditionDateInputCell : UITableViewCell

@property (nonatomic, weak) id<ELTaskEditionDateInputCellDelegate>delegate;
@property (nonatomic, copy) NSString *fieldName;
@property (nonatomic) NSDate *date;

@end

@protocol ELTaskEditionDateInputCellDelegate <NSObject>

- (void)dateInputCellDidReceiveDate:(ELTaskEditionDateInputCell *)cell;

@end
