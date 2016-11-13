//
//  ViewController.m
//  TAPageControl
//
//  Created by Tanguy Aladenise on 2015-01-21.
//  Copyright (c) 2015 Tanguy Aladenise. All rights reserved.
//

// Controllers
#import "ProductDetailsVC.h"
#import "Common.h"
#import "ProductCell.h"
#import "WantletCell.h"
#import "MyAccountVC.h"
#import "HomeVC.h"
#import "WantletDetailsVC.h"
#import "SearchVC.h"
#import "BrandsAndStoreVC.h"
#import "Define.h"

@interface ProductDetailsVC ()
{
    IBOutlet UIImageView *img_topbuttons;
    IBOutlet UIView *view_topfinds;
    IBOutlet UIView *view_wantlets;
    IBOutlet UICollectionView *collectView;
    IBOutlet UITableView *tablelist_wantlet;
    
    IBOutlet UIScrollView *scroll_mainview;
    NSArray *productArray;
    NSArray *wantletArray;
    
    
    IBOutlet UIButton *btn_bot_home;
    IBOutlet UIButton *btn_bot_search;
    IBOutlet UIButton *btn_bot_account;
    IBOutlet UIButton *btn_bot_other;
    
    IBOutlet UIButton *btn_similar_products_ipad;
    IBOutlet UIButton *btn_similar_wantlets_ipad;
    
}
@end


@implementation ProductDetailsVC

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
    
    [scroll_mainview setContentSize:CGSizeMake([UIScreen mainScreen].bounds.size.width, 1600)];
    
    //---collectionView(topfinds product)---
    UINib *cellNib = [UINib nibWithNibName:@"ProductCell" bundle:nil];
    [collectView registerNib:cellNib forCellWithReuseIdentifier:@"ProductCell"];
    
    productArray = [NSArray arrayWithObjects:
                    @"product1.png",@"product2.png",@"product3.png",@"product4.png",@"product5.png",@"product6.png",
                    @"product1.png",@"product2.png",@"product3.png",@"product4.png",@"product5.png",@"product6.png",
                    @"product1.png",@"product2.png",@"product3.png",@"product4.png",@"product5.png",@"product6.png",
                    @"product1.png",@"product2.png",@"product3.png",@"product4.png",@"product5.png",@"product6.png",
                    @"product1.png",@"product2.png",@"product3.png",@"product4.png",@"product5.png",@"product6.png",nil];
    
    //---tableListView(wantlet)---
    wantletArray = [NSArray arrayWithObjects:
                    @"wantlet1.png",@"wantlet2.png",@"wantlet3.png",
                    @"wantlet1.png",@"wantlet2.png",@"wantlet3.png",
                    @"wantlet1.png",@"wantlet2.png",@"wantlet3.png",
                    @"wantlet1.png",@"wantlet2.png",@"wantlet3.png",
                    @"wantlet1.png",@"wantlet2.png",@"wantlet3.png",nil];
    tablelist_wantlet.tableFooterView = [[UIView alloc] init];
    tablelist_wantlet.separatorStyle = UITableViewCellSeparatorStyleNone;
    tablelist_wantlet.tag = 3000;
    
}




//************************//
//*      UI Control      *//
//************************//
- (IBAction)clickEmailLinkToYourselfButton:(id)sender {
    [Common showAlert:@"Email sent to yourself"];
}
- (IBAction)clickLikesButton:(id)sender {
    [Common showAlert:@"Likes"];
}
- (IBAction)clickShareButton:(id)sender {
    [Common showAlert:@"Share"];
}

- (IBAction)clickTopFindsButton:(id)sender {
    if (IS_IPAD)
    {
        [btn_similar_products_ipad setImage:[UIImage imageNamed:@"btn_similar_product_on_ipad.png"] forState:UIControlStateNormal];
        [btn_similar_wantlets_ipad setImage:[UIImage imageNamed:@"btn_similar_wantlet_ipad.png"] forState:UIControlStateNormal];
    }else{
        img_topbuttons.image = [UIImage imageNamed:@"btn_topfinds.png"];
    }
    
    view_topfinds.hidden = NO;
    view_wantlets.hidden = YES;
}
- (IBAction)clickWantletButton:(id)sender {
    if (IS_IPAD)
    {
        [btn_similar_products_ipad setImage:[UIImage imageNamed:@"btn_similar_product_ipad.png"] forState:UIControlStateNormal];
        [btn_similar_wantlets_ipad setImage:[UIImage imageNamed:@"btn_similar_wantlet_on_ipad.png"] forState:UIControlStateNormal];
    }else{
        img_topbuttons.image = [UIImage imageNamed:@"btn_wantlets.png"];
    }
    view_topfinds.hidden = YES;
    view_wantlets.hidden = NO;
}
- (IBAction)clickCancelButton:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)clickShopDomainButton:(id)sender {
    [Common showAlert:@"Shop Click"];
}
- (IBAction)clickHomeButton:(id)sender {
    HomeVC *vc = [[HomeVC alloc] init];
    UINavigationController *navigationController = self.navigationController;
    NSMutableArray *activeViewControllers=[[NSMutableArray alloc] initWithArray: navigationController.viewControllers] ;
    [activeViewControllers removeLastObject];
    
    // Reset the navigation stack
    [navigationController setViewControllers:activeViewControllers];
    [navigationController pushViewController:vc animated:NO];
}
- (IBAction)clickSearchButton:(id)sender {
    SearchVC *vc = [[SearchVC alloc] init];
    UINavigationController *navigationController = self.navigationController;
    NSMutableArray *activeViewControllers=[[NSMutableArray alloc] initWithArray: navigationController.viewControllers] ;
    [activeViewControllers removeLastObject];
    
    // Reset the navigation stack
    [navigationController setViewControllers:activeViewControllers];
    [navigationController pushViewController:vc animated:NO];
}
- (IBAction)clickAccountButton:(id)sender {
    MyAccountVC *vc = [[MyAccountVC alloc] init];
    UINavigationController *navigationController = self.navigationController;
    NSMutableArray *activeViewControllers=[[NSMutableArray alloc] initWithArray: navigationController.viewControllers] ;
    [activeViewControllers removeLastObject];
    
    // Reset the navigation stack
    [navigationController setViewControllers:activeViewControllers];
    [navigationController pushViewController:vc animated:NO];
}
- (IBAction)clickOtherButton:(id)sender {
    BrandsAndStoreVC *vc = [[BrandsAndStoreVC alloc] init];
    [self.navigationController pushViewController:vc animated:NO];
}


//************************//
//*    Collection view   *//
//************************//
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [productArray count];
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"ProductCell";
    
    ProductCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    UIImage *holder = [UIImage imageNamed:[productArray objectAtIndex:indexPath.row]];
    cell.imgCell.image = holder;
    
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
   
    ProductDetailsVC *vc = [[ProductDetailsVC alloc] init];
    [self.navigationController pushViewController:vc animated:NO];
}


//************************//
//*      Table view      *//
//************************//
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //if (tableView.tag == 3000) //wantlet
    {
        return [wantletArray count];
    }
}
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (tableView.tag == 3000) //wantlet
//    {
//        return 300;
//    }else /*if (tableView.tag == 3001,3002,3003,3004)*/ //sort, filter-type, filter-maxprice, filter-priceoff
//    {
//        return 50;
//    }
//}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //if (tableView.tag == 3000) //wantlet list
    {
        static NSString *simpleTableIdentifier = @"WantletCell";
        
        WantletCell *cell = (WantletCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
        if (cell == nil)
        {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"WantletCell" owner:self options:nil];
            cell = [nib objectAtIndex:0];
        }
        
        //---Photo Image---
        UIImage *holder = [UIImage imageNamed:[wantletArray objectAtIndex:indexPath.row]];
        cell.thumbnails.image = holder;
        return cell;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (tableView.tag == 3000) //wantlet list
    {
        WantletDetailsVC *vc = [[WantletDetailsVC alloc] init];
        [self.navigationController pushViewController:vc animated:NO];
    }
}
- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"willSelectRowAtIndexPath");
    
    return indexPath;
}

@end
