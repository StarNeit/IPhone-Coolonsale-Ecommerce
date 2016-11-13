//
//  ViewController.m
//  TAPageControl
//
//  Created by Tanguy Aladenise on 2015-01-21.
//  Copyright (c) 2015 Tanguy Aladenise. All rights reserved.
//

// Controllers
#import "ResendEmailVC.h"
#import "Common.h"
#import "SendingEmailVC.h"

@interface ResendEmailVC ()
{
    
}
@end


@implementation ResendEmailVC

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
    
}


//---UI Control---
- (IBAction)clickResendEmail:(id)sender {
    
    SendingEmailVC *vc = [[SendingEmailVC alloc] init];
    vc.registered_email = self.registered_email;
    
    UINavigationController *navigationController = self.navigationController;
    NSMutableArray *activeViewControllers=[[NSMutableArray alloc] initWithArray: navigationController.viewControllers] ;
    [activeViewControllers removeLastObject];
    
    // Reset the navigation stack
    [navigationController setViewControllers:activeViewControllers];
    [navigationController pushViewController:vc animated:NO];
}

- (IBAction)clickSkipFornow:(id)sender {
    
    SendingEmailVC *vc = [[SendingEmailVC alloc] init];
    vc.registered_email = self.registered_email;
    self.navigationItem.hidesBackButton = YES;
    
    
    UINavigationController *navigationController = self.navigationController;
    NSMutableArray *activeViewControllers=[[NSMutableArray alloc] initWithArray: navigationController.viewControllers] ;
    [activeViewControllers removeLastObject];
    
    // Reset the navigation stack
    [navigationController setViewControllers:activeViewControllers];
    [navigationController pushViewController:vc animated:NO];
}

- (IBAction)clickEditEmail:(id)sender {
    [Common showAlert:@"edit email"];
}

@end
