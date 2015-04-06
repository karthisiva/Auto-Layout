//
//  LoginViewController.h
//  GoneVaca
//
//  Created by Griffin on 24/03/15.
//  Copyright (c) 2015 Griffin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RegistrationViewController.h"
@interface LoginViewController : UIViewController<UITextFieldDelegate>
- (IBAction)registerMember:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btnMember;
- (IBAction)registerBlogger:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btnRegister;
@property (strong, nonatomic) IBOutlet UITextField *txtUser;
@property (strong, nonatomic) IBOutlet UITextField *txtPass;
- (IBAction)loginPressed:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btnLogin;
@property (strong, nonatomic) IBOutlet UIView *containerView;

@end
