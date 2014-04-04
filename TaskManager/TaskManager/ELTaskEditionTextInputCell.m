//
//  ELTaskEditionTextInputCell.m
//  TaskManager
//
//  Created by Sergey Rakov on 26.03.14.
//  Copyright (c) 2014 Org. All rights reserved.
//


#import "ELTaskEditionTextInputCell.h"


@interface ELTaskEditionTextInputCell () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *fieldTextLabel;
@property (weak, nonatomic) IBOutlet UITextField *fieldTextField;

@end

@implementation ELTaskEditionTextInputCell


#pragma mark - Public

- (void)setFieldName:(NSString *)fieldName {
    self.fieldTextLabel.text = fieldName;
}

- (void)setText:(NSString *)text {
    self.fieldTextField.text = text;
}

- (NSString *)fieldName {
    return self.fieldTextLabel.text;
}

- (NSString *)text {
    return self.fieldTextField.text;
}

#pragma mark - Text Field

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    self.text = textField.text;
    [self.delegate textInputCellDidReceiveText:self];
    [textField resignFirstResponder];

    return NO;
}

@end
