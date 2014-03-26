//
//  ELTaskEditionTextInputCell.h
//  TaskManager
//
//  Created by Sergey Rakov on 26.03.14.
//  Copyright (c) 2014 Org. All rights reserved.
//


#import <UIKit/UIKit.h>


@class ELTaskEditionTextInputCell;


@protocol ELTaskEditionTextInputCellDelegate <NSObject>

@required
- (void)textInputCellDidReceiveText:(ELTaskEditionTextInputCell*)cell;

@end


@interface ELTaskEditionTextInputCell : UITableViewCell

@property (weak, nonatomic) id<ELTaskEditionTextInputCellDelegate>delegate;
@property (strong, nonatomic) NSString *fieldName;
@property (strong, nonatomic) NSString *text;

@end
