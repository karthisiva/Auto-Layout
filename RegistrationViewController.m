//
//  RegistrationViewController.m
//  GoneVaca
//
//  Created by Griffin on 25/03/15.
//  Copyright (c) 2015 Griffin. All rights reserved.
//
//http://stackoverflow.com/questions/664781/change-default-scrolling-behavior-of-uitableview-section-header

//http://stackoverflow.com/questions/1074006/is-it-possible-to-disable-floating-headers-in-uitableview-with-uitableviewstylep/4295687#4295687
#import "RegistrationViewController.h"
#import "IHKeyboardAvoiding.h"
@interface RegistrationViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomVerticalSpacerConstraint;
@end

@implementation RegistrationViewController
@synthesize arrPlaceHolder,checkString;
- (void)viewDidLoad
{
    if ([checkString isEqualToString:@"blogger"])
    {
        arrPlaceHolder=[[NSArray alloc]initWithObjects:@"First Name",@"Last Name",@"Blogger Name",@"Age", @"Email",@"City",@"State",@"Country",@"Blogger RSS Feed",nil];
        self.title=@"blogger registration";

    }
    else
    {
          arrPlaceHolder=[[NSArray alloc]initWithObjects:@"First Name",@"Last Name",@"Vaca Member Name",@"Age", @"Email",@"City",@"State",@"Country",nil];
        self.title=@"member registration";

    }
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:@"UIKeyboardWillShowNotification" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:@"UIKeyboardWillHideNotification" object:nil];
    
 
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

-(NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [arrPlaceHolder count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier=@"identifier";
    ReportCell *cell=(ReportCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell==nil)
    {
        cell=[[[NSBundle mainBundle]loadNibNamed:@"ReportCell" owner:self options:nil]objectAtIndex:0];
        cell.delegate=self;
    }
    cell.txtReport.tag=indexPath.row;
    cell.txtReport.attributedPlaceholder = [[NSAttributedString alloc] initWithString:[arrPlaceHolder objectAtIndex:indexPath.row] attributes:@{NSForegroundColorAttributeName:[UIColor blackColor]}];
    cell.txtReport.textColor=[UIColor blueColor];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
}
-(BOOL)leaveKeyboard:(ReportCell *)cell
{
    return [cell.txtReport  resignFirstResponder];
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}


-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSLog(@"%ld",(long)textField.tag);
    
}
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    NSLog(@"%@",textField.text);
    
}
-(void)actionSend
{
    
}
- (void)keyboardWillShow:(NSNotification *)sender {
    CGSize kbSize = [[[sender userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    NSTimeInterval duration = [[[sender userInfo] objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    CGFloat height = UIDeviceOrientationIsPortrait([[UIDevice currentDevice] orientation]) ? kbSize.height : kbSize.width;
    if ([[[UIDevice currentDevice]systemVersion]floatValue]>=8.0)
        height = kbSize.height;
    
    [UIView animateWithDuration:duration animations:^{
        UIEdgeInsets edgeInsets = [[self tableView] contentInset];
        edgeInsets.bottom = height;
        [[self tableView] setContentInset:edgeInsets];
        edgeInsets = [[self tableView] scrollIndicatorInsets];
        edgeInsets.bottom = height;
        [[self tableView] setScrollIndicatorInsets:edgeInsets];
    }];
}

- (void)keyboardWillHide:(NSNotification *)sender {
    NSTimeInterval duration = [[[sender userInfo] objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    [UIView animateWithDuration:duration animations:^{
        UIEdgeInsets edgeInsets = [[self tableView] contentInset];
        edgeInsets.bottom = 0;
        [[self tableView] setContentInset:edgeInsets];
        edgeInsets = [[self tableView] scrollIndicatorInsets];
        edgeInsets.bottom = 0;
        [[self tableView] setScrollIndicatorInsets:edgeInsets];
    }];
}
@end
