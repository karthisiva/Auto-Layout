//
//  TestingViewController.h
//  GoneVaca
//
//  Created by Griffin on 01/04/15.
//  Copyright (c) 2015 Griffin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBMenuController.h"
@interface TestingViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,MBMenuControllerDelegate>
@property (nonatomic, strong) MBMenuController *menu;

@end
