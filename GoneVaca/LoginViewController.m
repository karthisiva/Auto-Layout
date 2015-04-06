//
//  LoginViewController.m
//  GoneVaca
//
//  Created by Griffin on 24/03/15.
//  Copyright (c) 2015 Griffin. All rights reserved.
//

#import "LoginViewController.h"
#import "IHKeyboardAvoiding.h"
#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define UIColorFromRGBA(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:0.8]


@interface LoginViewController ()


@end

@implementation LoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.btnMember setBackgroundColor:UIColorFromRGB(0X00a8ff)];
    [self.btnRegister setBackgroundColor:UIColorFromRGB(0X40beff)];
    
     self.txtUser.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Username" attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.txtPass.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Password" attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [self.containerView setBackgroundColor:UIColorFromRGBA(0X000000)];
    
    [IHKeyboardAvoiding setAvoidingView:self.view withTriggerView:self.containerView];
  
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.view endEditing:YES];
    return YES;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)registerMember:(id)sender
{
    RegistrationViewController *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"RegistrationViewController"];
    obj.checkString=@"member";
    [self.navigationController pushViewController:obj animated:YES];
    
}
- (IBAction)registerBlogger:(id)sender
{
    RegistrationViewController *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"RegistrationViewController"];
    obj.checkString=@"blogger";
    [self.navigationController pushViewController:obj animated:YES];
    
}
- (IBAction)loginPressed:(id)sender
{
}
@end
