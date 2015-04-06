//
//  ReportCell.m
//  myPackage
//
//  Created by GRIFFIN on 18/10/14.
//  Copyright (c) 2014 GRIFFIN. All rights reserved.
//

#import "ReportCell.h"

@implementation ReportCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    [_delegate leaveKeyboard:self];
    [self.superview endEditing:YES];
	[super touchesBegan:touches withEvent:event];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.txtReport resignFirstResponder];
    return YES;
}
@end
