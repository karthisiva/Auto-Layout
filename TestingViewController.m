//
//  TestingViewController.m
//  GoneVaca
//
//  Created by Griffin on 01/04/15.
//  Copyright (c) 2015 Griffin. All rights reserved.
//

#import "TestingViewController.h"
#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
@interface TestingViewController ()
- (IBAction)tableAnimation:(id)sender;
@property (strong, nonatomic) IBOutlet UITableView *tableVIew;
- (IBAction)testingmenu:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *backGroundView;
@property (strong, nonatomic) IBOutlet UITextField *testTxt;

@end

@implementation TestingViewController
//http://code.tutsplus.com/tutorials/working-with-the-nsoperationqueue-class--mobile-14993
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.backGroundView setBackgroundColor:UIColorFromRGB(0Xa5a5a5)];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier=@"identifier";
   UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:identifier]
    ;
    
    if (cell==nil)
    {
       cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        
    }
    cell.textLabel.text=[NSString stringWithFormat:@"%ld",(long)indexPath.row];
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
- (IBAction)tableAnimation:(id)sender
{
    self.tableVIew.delegate=self;
    self.tableVIew.dataSource=self;
    CGFloat height=50*5;
    [UIView animateWithDuration:0.5 animations:^{
        self.tableVIew.frame=CGRectMake(self.tableVIew.bounds.origin.x, self.tableVIew.bounds.origin.y
                                        , self.tableVIew.bounds.size.width, height);
[NSLayoutConstraint constraintWithItem:self.tableVIew attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:height];    }];
    }
- (IBAction)testingmenu:(id)sender

{
    CGFloat sendPoint=self.testTxt.bounds.origin.y+510;
    
    if (![self menu]) {
        
        NSMutableArray *arrrObject=[NSMutableArray array];
        for(int i=0;i<15;i++)
        {
            NSString *tmp=[NSString stringWithFormat:@"%d",i];
            [arrrObject addObject:tmp];
        }
        NSArray *temp=(NSArray *)arrrObject;
       _menu = [[MBMenuController alloc] initWithButtonTitles:temp];
//        _menu = [[MBMenuController alloc] initWithButtonTitles:temp stratingPoint:sendPoint];

        [_menu setDelegate:self];
        //[_menu setCancelButtonIndex:[[_menu buttonTitles]count]-1];
    }
    
    [[self menu] showInView:[self view]];

}
- (void)buttonMenuViewController:(MBMenuController *)buttonMenu buttonTappedAtIndex:(NSUInteger)index
{
    //
    //  Hide the menu
    //
    
    [buttonMenu hide];
    
    //
    //  Create a title
    //
    
    NSString *title = [[self menu] buttonTitles][index];
    
    NSString *message = [NSString stringWithFormat:@"You chose %@", title];
    self.testTxt.text=message;
    
   }

- (void)buttonMenuViewControllerDidCancel:(MBMenuController *)buttonMenu
{
    [buttonMenu hide];
}

@end
