//
//  ViewController.m
//  TAPageControl
//
//  Created by Tanguy Aladenise on 2015-01-21.
//  Copyright (c) 2015 Tanguy Aladenise. All rights reserved.
//

// Controllers
#import "ViewController.h"
// Views
#import "TAPageControl.h"
#import "Common.h"
#import "ConfirmEmailVC.h"
#import "RegisterEmailVC.h"
#import "HomeVC.h"
#import "Define.h"

@interface ViewController () <UIScrollViewDelegate, TAPageControlDelegate>
{
    int wc_page_index;    
}

@property (strong, nonatomic) TAPageControl *customPageControl3;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView3;
@property (weak, nonatomic) IBOutlet UIView *wrapper3;
@property (strong, nonatomic) NSArray *imagesData;
@end


@implementation ViewController


#pragma mark - Lifecycle

- (void)initialize
{
    wc_page_index = 0;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.hidesBackButton = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//---Initialize---
    [self initialize];
    
//---Welcome Image Scroll View---
    if (IS_IPAD)
    {
        self.imagesData = @[@"welcome_page1_iPad.png", @"welcome_page2_iPad.png", @""];
    }else{
        self.imagesData = @[@"welcome_page1.png", @"welcome_page2.png", @""];
    }
    
    [self setupScrollViewImages];
    self.scrollView3.delegate = self;
    
    self.customPageControl3                 = [[TAPageControl alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.scrollView3.frame) - 80, CGRectGetWidth(self.scrollView3.frame), 40)];
    self.customPageControl3.numberOfPages   = self.imagesData.count;
    self.customPageControl3.dotImage        = [UIImage imageNamed:@"dotInactive"];
    self.customPageControl3.currentDotImage = [UIImage imageNamed:@"dotActive"];
    
    [self.wrapper3 addSubview:self.customPageControl3];
}


//---Scroll View---
- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    self.scrollView3.contentSize = CGSizeMake(CGRectGetWidth(self.scrollView3.frame) * self.imagesData.count, 1.0f);
    
}
#pragma mark - ScrollView delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSInteger pageIndex = scrollView.contentOffset.x / CGRectGetWidth(scrollView.frame);
    self.customPageControl3.currentPage = pageIndex;
    wc_page_index = (long)pageIndex;
    
    NSLog(@"%d", wc_page_index);
    if (wc_page_index == 2) //3rd page
    {
        RegisterEmailVC *vc = [[RegisterEmailVC alloc] init];
        [self.navigationController pushViewController:vc animated:NO];
    }else{
        
    }
}
#pragma mark - Utils
- (void)setupScrollViewImages
{
        [self.imagesData enumerateObjectsUsingBlock:^(NSString *imageName, NSUInteger idx, BOOL *stop) {
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.scrollView3.frame) * idx, 0, CGRectGetWidth(self.scrollView3.frame), CGRectGetHeight(self.scrollView3.frame))];
            imageView.contentMode = UIViewContentModeScaleAspectFill;
            imageView.image = [UIImage imageNamed:imageName];
            [self.scrollView3 addSubview:imageView];
        }];
}

- (IBAction)clickToMyPage:(id)sender {
    HomeVC *vc = [[HomeVC alloc] init];
    [self.navigationController pushViewController:vc animated:NO];
}



@end
