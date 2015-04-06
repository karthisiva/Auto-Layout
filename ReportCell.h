//
//  ReportCell.h
//  myPackage
//
//  Created by GRIFFIN on 18/10/14.
//  Copyright (c) 2014 GRIFFIN. All rights reserved.
//
//@class ReportCell;
//@protocol keyboardDelegate <NSObject>
//
//@optional
//- (BOOL)leaveKeyboard:(ReportCell *)cell ;
//
//@end


#import <UIKit/UIKit.h>
@class ReportCell;
@protocol keyboardDelegate <NSObject>

@optional
- (BOOL)leaveKeyboard:(ReportCell *)cell ;

@end
@interface ReportCell : UITableViewCell<UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *imgReport;
@property (strong, nonatomic) IBOutlet UITextField *txtReport;
@property (strong, nonatomic) IBOutlet UIView *viewReport;
@property (nonatomic, assign) id <keyboardDelegate> delegate;

@end
