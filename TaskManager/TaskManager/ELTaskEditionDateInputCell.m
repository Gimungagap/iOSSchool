//
//  ELTaskEditionDateInputCell.m
//  TaskManager
//
//  Created by Sergey Rakov on 26.03.14.
//  Copyright (c) 2014 Org. All rights reserved.
//


#import "ELTaskEditionDateInputCell.h"


@interface ELTaskEditionDateInputCell ()

@property (weak, nonatomic) IBOutlet UILabel *fieldTextLabel;
@property (weak, nonatomic) IBOutlet UITextField *fieldTextField;
@property (weak, nonatomic) UIDatePicker *datePicker;

@end


@implementation ELTaskEditionDateInputCell


#pragma mark - Life Cycle

- (void)awakeFromNib {
    [super awakeFromNib];

    UIDatePicker *picker = [[UIDatePicker alloc] init];
    self.fieldTextField.inputView = picker;
    self.datePicker = picker;
    
    UIButton *okButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 164)];
    [okButton setBackgroundColor:[UIColor greenColor]];
    [okButton setTitle:@"OK" forState:UIControlStateNormal];
    [okButton addTarget:self action:@selector(onDatePicked:) forControlEvents:UIControlEventTouchUpInside];
    self.fieldTextField.inputAccessoryView = okButton;
}


#pragma mark - Public

- (void)setFieldName:(NSString *)fieldName {
    self.fieldTextLabel.text = fieldName;
}

- (NSString *)fieldName {
    return self.fieldTextLabel.text;
}

- (void)setDate:(NSDate *)date {
    self.fieldTextField.text = [date description];
    _date = date;
}

#pragma mark - Date

- (void)onDatePicked:(UIButton *)button {
    self.date = self.datePicker.date;
    [self.fieldTextField resignFirstResponder];
    [self.delegate dateInputCellDidReceiveDate:self];
}

@end
