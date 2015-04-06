//
//  RegistrationViewController.h
//  GoneVaca
//
//  Created by Griffin on 25/03/15.
//  Copyright (c) 2015 Griffin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReportCell.h"
@interface RegistrationViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,keyboardDelegate,UITextFieldDelegate>
{
     __weak UIView *_staticView;
}
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,retain)NSArray *arrPlaceHolder;
@property(nonatomic,retain)NSString *checkString;



@end
