//
//  ViewController.m
//  TAPageControl
//
//  Created by Tanguy Aladenise on 2015-01-21.
//  Copyright (c) 2015 Tanguy Aladenise. All rights reserved.
//

// Controllers
#import "RegisterEmailVC.h"
#import "Common.h"
#import "ConfirmEmailVC.h"

@interface RegisterEmailVC ()
{
    IBOutlet UITextField *txf_email;
}
@end


@implementation RegisterEmailVC

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
    
    [self addGestureRecognizers];
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTap:)];
    singleTap.cancelsTouchesInView = NO;
    singleTap.delegate = self;
    [self._srcMain addGestureRecognizer:singleTap];
    
    
    [self._srcMain setContentSize:CGSizeMake(1, 1000)];
}


//---Gesture Recognizer---
- (void)singleTap:(UIGestureRecognizer*)gestureRecognizer
{
    // Close keyboard for any text edit views that are children of the main view
    [gestureRecognizer.view endEditing:YES];
    [self._srcMain setContentOffset:CGPointMake(0, 0) animated:YES];
}
- (void)addGestureRecognizers {
    [[self view] addGestureRecognizer:[self panGestureRecognizer]];
}
- (UIPanGestureRecognizer *)panGestureRecognizer {
    UIPanGestureRecognizer *recognizer = [[UIPanGestureRecognizer alloc]
                                          initWithTarget:self action:@selector(handlePan:)];
    return recognizer;
}
- (void) handlePan:(UIPanGestureRecognizer *)recognizer {
    
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == txf_email)
    {
        [txf_email resignFirstResponder];
    }
    return true;
}


//---UI Control---
- (IBAction)clickRegisterButton:(id)sender {
    txf_email.text = [Common trimString:txf_email.text];
    if (txf_email.text.length == 0)
    {
        [Common showAlert:@"Email is empty"];
        return;
    }
    if (![Common checkEmailFormat:txf_email.text])
    {
        [Common showAlert:@"Invalid email format"];
        return;
    }
    
    //---redirecting---
    ConfirmEmailVC *vc = [[ConfirmEmailVC alloc] init];
    vc.registered_email = txf_email.text;
    [self.navigationController pushViewController:vc animated:NO];
}

- (IBAction)clickTellMeMoreButton:(id)sender {
    [Common showAlert:@"tell me more"];
}
@end
