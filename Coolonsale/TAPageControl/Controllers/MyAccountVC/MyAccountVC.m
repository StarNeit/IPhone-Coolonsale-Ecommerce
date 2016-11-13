//
//  ViewController.m
//  TAPageControl
//
//  Created by Tanguy Aladenise on 2015-01-21.
//  Copyright (c) 2015 Tanguy Aladenise. All rights reserved.
//

// Controllers
#import "MyAccountVC.h"
#import "Common.h"
#import "ProductCell.h"
#import "WantletCell.h"
#import "HomeVC.h"
#import "ProductDetailsVC.h"
#import "SettingsVC.h"
#import "SearchVC.h"
#import "BrandsAndStoreVC.h"

@interface MyAccountVC ()
{
    IBOutlet UICollectionView *collectView;
    
    NSArray *productArray;
    
    IBOutlet UIButton *btn_bot_home;
    IBOutlet UIButton *btn_bot_search;
    IBOutlet UIButton *btn_bot_account;
    IBOutlet UIButton *btn_bot_other;
}
@end


@implementation MyAccountVC

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
    
    
    //---collectionView(topfinds product)---
    UINib *cellNib = [UINib nibWithNibName:@"ProductCell" bundle:nil];
    [collectView registerNib:cellNib forCellWithReuseIdentifier:@"ProductCell"];
    
    productArray = [NSArray arrayWithObjects:
                    @"product1.png",@"product2.png",@"product3.png",@"product4.png",@"product5.png",@"product6.png",
                    @"product1.png",@"product2.png",@"product3.png",@"product4.png",@"product5.png",@"product6.png",
                    @"product1.png",@"product2.png",@"product3.png",@"product4.png",@"product5.png",@"product6.png",
                    @"product1.png",@"product2.png",@"product3.png",@"product4.png",@"product5.png",@"product6.png",
                    @"product1.png",@"product2.png",@"product3.png",@"product4.png",@"product5.png",@"product6.png",nil];
    
}




//************************//
//*      UI Control      *//
//************************//
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
    
}
- (IBAction)clickOtherButton:(id)sender {
    BrandsAndStoreVC *vc = [[BrandsAndStoreVC alloc] init];
    [self.navigationController pushViewController:vc animated:NO];
}

- (IBAction)clickCancelButton:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)clickSettingsButton:(id)sender {
    SettingsVC *vc = [[SettingsVC alloc] init];
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
    cell.img_islike.image = [UIImage imageNamed:@"love.png"];
    
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    ProductDetailsVC *vc = [[ProductDetailsVC alloc] init];
    [self.navigationController pushViewController:vc animated:NO];

}

@end
