//
//  ViewController.m
//  TAPageControl
//
//  Created by Tanguy Aladenise on 2015-01-21.
//  Copyright (c) 2015 Tanguy Aladenise. All rights reserved.
//

// Controllers
#import "SendingEmailVC.h"
#import "Common.h"
#import "HomeVC.h"

@interface SendingEmailVC ()
{
    
    IBOutlet UILabel *label_registered_email;
}
@end


@implementation SendingEmailVC

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
    
    label_registered_email.text = self.registered_email;
}


//---UI Control---
- (IBAction)clickContinueButton:(id)sender {
    HomeVC *vc = [[HomeVC alloc] init];
    UINavigationController *navigationController = self.navigationController;
    NSMutableArray *activeViewControllers=[[NSMutableArray alloc] initWithArray: navigationController.viewControllers] ;
    [activeViewControllers removeLastObject];
    
    // Reset the navigation stack
    [navigationController setViewControllers:activeViewControllers];
    [navigationController pushViewController:vc animated:NO];
}

- (IBAction)clickEditEmailButton:(id)sender {
    [Common showAlert:@"click edit email"];
}


@end
