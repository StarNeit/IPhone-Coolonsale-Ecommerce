//
//  ViewController.m
//  TAPageControl
//
//  Created by Tanguy Aladenise on 2015-01-21.
//  Copyright (c) 2015 Tanguy Aladenise. All rights reserved.
//

// Controllers
#import "ConfirmEmailVC.h"
#import "Common.h"
#import "ResendEmailVC.h"

@interface ConfirmEmailVC ()
{
    IBOutlet UILabel *lb_registered_email;
}
@end


@implementation ConfirmEmailVC

#pragma mark - Lifecycle
- (void)initialize
{
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
//---Initialize---
    [self initialize];
    
    lb_registered_email.text = self.registered_email;
}


//---UI Control---
- (IBAction)clickOkayButton:(id)sender {
    ResendEmailVC *vc = [[ResendEmailVC alloc] init];
    vc.registered_email = self.registered_email;
    
    UINavigationController *navigationController = self.navigationController;
    NSMutableArray *activeViewControllers=[[NSMutableArray alloc] initWithArray: navigationController.viewControllers] ;
    [activeViewControllers removeLastObject];
    
    // Reset the navigation stack
    [navigationController setViewControllers:activeViewControllers];
    [navigationController pushViewController:vc animated:NO];
}
- (IBAction)clickEditButton:(id)sender {
    
}

@end
