//
//  ELTaskEditionTextInputCell.h
//  TaskManager
//
//  Created by Sergey Rakov on 26.03.14.
//  Copyright (c) 2014 Org. All rights reserved.
//


@import UIKit;


@protocol ELTaskEditionTextInputCellDelegate;

@interface ELTaskEditionTextInputCell : UITableViewCell

@property (nonatomic, copy) NSString *fieldName;
@property (nonatomic, copy) NSString *text;

@property (nonatomic, weak) id<ELTaskEditionTextInputCellDelegate> delegate;

@end

@protocol ELTaskEditionTextInputCellDelegate <NSObject>

- (void)textInputCellDidReceiveText:(ELTaskEditionTextInputCell *)cell;

@end
