//
//  FirstTableViewCell.m
//  TableView-UITextField
//
//  Created by LBJames on 2019/2/25.
//  Copyright © 2019年 LBJames. All rights reserved.
//

#import "FirstTableViewCell.h"


@interface FirstTableViewCell ()<UITextFieldDelegate>
@end

@implementation FirstTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.textField.delegate = self;
    [self.textField addTarget:self action:@selector(changeText:) forControlEvents:UIControlEventEditingChanged];
    
}


- (void)changeText:(UITextField *)textField{
    if ([self.delegate respondsToSelector:@selector(selectFirstTableViewCellWithTextField:indexPath:)]) {
        [self.delegate selectFirstTableViewCellWithTextField:textField.text indexPath:self.indexPath];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
