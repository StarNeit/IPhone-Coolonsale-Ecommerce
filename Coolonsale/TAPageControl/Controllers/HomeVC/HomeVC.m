//
//  ViewController.m
//  TAPageControl
//
//  Created by Tanguy Aladenise on 2015-01-21.
//  Copyright (c) 2015 Tanguy Aladenise. All rights reserved.
//

// Controllers
#import "HomeVC.h"
#import "Common.h"
#import "ProductCell.h"
#import "WantletCell.h"
#import "CommonCell.h"
#import "CommonCellWithImg.h"
#import "ProductDetailsVC.h"
#import "WantletDetailsVC.h"
#import "MyAccountVC.h"
#import "SearchVC.h"
#import "Define.h"
#import "BrandsAndStoreVC.h"

@interface HomeVC ()
{
    NSArray *productArray;
    NSArray *wantletArray;
    NSArray *sortTypeArray;
    NSArray *filterTypeArray;
    NSArray *filterTypeImgArray;
    NSArray *filterMaxPriceArray;
    NSArray *filterPriceOffArray;
    
    IBOutlet UIButton *btn_shoes;//----------------//
    IBOutlet UIButton *btn_bags;//----------------//
    IBOutlet UIButton *btn_all;//----------------//
    
    IBOutlet UIView *view_topfinds;//----------------//
    IBOutlet UIView *view_wantlets;//----------------//
    IBOutlet UIImageView *img_topbuttons;
    
    IBOutlet UITableView *tablelist_wantlet;//----------------//
    IBOutlet UIView *view_topfindsAndWantlets;
    IBOutlet UIView *view_bottom_controlbar;
    
    IBOutlet UITableView *tablelist_sort;//----------------//
    IBOutlet UIView *view_sortitems;
    
    
    IBOutlet UIView *view_filteritems;
    IBOutlet UITableView *tablelist_filtertype;//----------------//
    IBOutlet UIScrollView *scrollview_filteritems;
    IBOutlet UIView *scrollview_innerview;
    
    
    IBOutlet UITableView *tablelist_maxprice;//----------------//
    IBOutlet UITableView *tablelist_priceoff;//----------------//

    IBOutlet UIView *view_main_content;//----------------//
   
    
    IBOutlet UIButton *btn_bot_home;//----------------//
    IBOutlet UIButton *btn_bot_search;//----------------//
    IBOutlet UIButton *btn_bot_account;//----------------//
    IBOutlet UIButton *btn_bot_other;//----------------//
    
    
    
    IBOutlet UIButton *btn_top_finds_ipad;//----------------//
    IBOutlet UIButton *btn_wantlet_ipad;//----------------//
    IBOutlet UIImageView *img_selected_arrow_topfinds;//----------------//
    IBOutlet UIImageView *img_selected_arrow_wantlet;//----------------//
    
    
    IBOutlet UIView *view_sort_and_view_filter_ipad;//----------------//
    
    
    
}
@end


@implementation HomeVC

#pragma mark - Lifecycle
- (void)initialize
{
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}
-(BOOL)prefersStatusBarHidden{
    return YES;
}

//- (void)viewDidAppear:(BOOL)animated
//{
//    NSNumber *value = [NSNumber numberWithInt:UIInterfaceOrientationLandscapeLeft];
//    [[UIDevice currentDevice] setValue:value forKey:@"orientation"];
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
//---Initialize---
    [self initialize];
//---Gesture process---
    [self addGestureRecognizers];
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTap:)];
    singleTap.cancelsTouchesInView = NO;
    singleTap.delegate = self;
    [scrollview_filteritems addGestureRecognizer:singleTap];
    
    
//---collectionView(topfinds product)---
    UINib *cellNib = [UINib nibWithNibName:@"ProductCell" bundle:nil];
    [self.collectView registerNib:cellNib forCellWithReuseIdentifier:@"ProductCell"];
    
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
    
    
//---tableListView(sort)---
    sortTypeArray = [NSArray arrayWithObjects:
                    @"Latest",@"Price Low to High",@"Price High to Low",@"Most Discounted",@"Least Discounted",nil];
    tablelist_sort.tableFooterView = [[UIView alloc] init];
    tablelist_sort.tag = 3001;
    
//---tableListView(filters - type)---
    [scrollview_filteritems setContentSize:CGSizeMake(1, 900)];
    filterTypeArray = [NSArray arrayWithObjects:
                       @"Shoes",@"Bags",@"Everything",nil];
    filterTypeImgArray = [NSArray arrayWithObjects:
                          @"filter_shoes.png",@"filter_bag.png",@"",nil];
    tablelist_filtertype.tableFooterView = [[UIView alloc] init];
    tablelist_filtertype.tag = 3002;
    
//---tableListView(filters - maxprice)---
    filterMaxPriceArray = [NSArray arrayWithObjects:
                       @"$50",@"$100",@"$200",@"$500",@"Over $500",nil];
    tablelist_maxprice.tableFooterView = [[UIView alloc] init];
    tablelist_maxprice.tag = 3003;
    
    
//---tableListView(filters - maxprice)---
    filterPriceOffArray = [NSArray arrayWithObjects:
                           @"25% off",@"50% off",@"75% off",nil];
    tablelist_priceoff.tableFooterView = [[UIView alloc] init];
    tablelist_priceoff.tag = 3004;
    
    
}



//************************//
//*      Gesture         *//
//************************//
- (void)singleTap:(UIGestureRecognizer*)gestureRecognizer
{
    // Close keyboard for any text edit views that are children of the main view
    [gestureRecognizer.view endEditing:YES];
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



//************************//
//*      UI Control      *//
//************************//
- (IBAction)clickShoes:(id)sender//----------------//
{
    if (IS_IPAD)
    {
        [btn_shoes setImage:[UIImage imageNamed:@"btn_shoes_on_ipad.png"] forState:UIControlStateNormal];
        [btn_bags setImage:[UIImage imageNamed:@"btn_bags_ipad.png"] forState:UIControlStateNormal];
        [btn_all setImage:[UIImage imageNamed:@"btn_all_ipad.png"] forState:UIControlStateNormal];
    }else{
        [btn_shoes setImage:[UIImage imageNamed:@"btn_shoes_on.png"] forState:UIControlStateNormal];
        [btn_bags setImage:[UIImage imageNamed:@"btn_bags.png"] forState:UIControlStateNormal];
        [btn_all setImage:[UIImage imageNamed:@"btn_all.png"] forState:UIControlStateNormal];
    }
}
- (IBAction)clickBags:(id)sender//----------------//
{
    if (IS_IPAD)
    {
        [btn_shoes setImage:[UIImage imageNamed:@"btn_shoes_ipad.png"] forState:UIControlStateNormal];
        [btn_bags setImage:[UIImage imageNamed:@"btn_bags_on_ipad.png"] forState:UIControlStateNormal];
        [btn_all setImage:[UIImage imageNamed:@"btn_all_ipad.png"] forState:UIControlStateNormal];
    }else{
        [btn_shoes setImage:[UIImage imageNamed:@"btn_shoes.png"] forState:UIControlStateNormal];
        [btn_bags setImage:[UIImage imageNamed:@"btn_bags_on.png"] forState:UIControlStateNormal];
        [btn_all setImage:[UIImage imageNamed:@"btn_all.png"] forState:UIControlStateNormal];
    }
}
- (IBAction)clickAll:(id)sender//----------------//
{
    if (IS_IPAD)
    {
        [btn_shoes setImage:[UIImage imageNamed:@"btn_shoes_ipad.png"] forState:UIControlStateNormal];
        [btn_bags setImage:[UIImage imageNamed:@"btn_bags_ipad.png"] forState:UIControlStateNormal];
        [btn_all setImage:[UIImage imageNamed:@"btn_all_on_ipad.png"] forState:UIControlStateNormal];
    }else{
        [btn_shoes setImage:[UIImage imageNamed:@"btn_shoes.png"] forState:UIControlStateNormal];
        [btn_bags setImage:[UIImage imageNamed:@"btn_bags.png"] forState:UIControlStateNormal];
        [btn_all setImage:[UIImage imageNamed:@"btn_all_on.png"] forState:UIControlStateNormal];
    }
}
- (IBAction)clickTopFindsButton:(id)sender//----------------//
{
    if (IS_IPAD)
    {
        [btn_top_finds_ipad setImage:[UIImage imageNamed:@"label_topfinds_on_ipad.png"] forState:UIControlStateNormal];
        [btn_wantlet_ipad setImage:[UIImage imageNamed:@"label_wantlets_ipad.png"] forState:UIControlStateNormal];
        img_selected_arrow_topfinds.hidden = NO;
        img_selected_arrow_wantlet.hidden = YES;
    }else{
        img_topbuttons.image = [UIImage imageNamed:@"btn_topfinds.png"];
    }
    
    view_topfinds.hidden = NO;
    view_wantlets.hidden = YES;
}
- (IBAction)clickWantletButton:(id)sender//----------------//
{
    if (IS_IPAD)
    {
        [btn_top_finds_ipad setImage:[UIImage imageNamed:@"label_topfinds_ipad.png"] forState:UIControlStateNormal];
        [btn_wantlet_ipad setImage:[UIImage imageNamed:@"label_wantlets_on_ipad.png"] forState:UIControlStateNormal];
        img_selected_arrow_topfinds.hidden = YES;
        img_selected_arrow_wantlet.hidden = NO;
    }else{
        img_topbuttons.image = [UIImage imageNamed:@"btn_wantlets.png"];
    }
    
    view_topfinds.hidden = YES;
    view_wantlets.hidden = NO;
}
- (IBAction)clickFilterButton:(id)sender {
    view_filteritems.hidden = NO;
}
- (IBAction)clickSortButton:(id)sender {
    view_sortitems.hidden = NO;
}
- (IBAction)clickCloseSortView:(id)sender {
    view_sortitems.hidden = YES;
}
- (IBAction)clickApplySort:(id)sender {
    view_sortitems.hidden = YES;
}
- (IBAction)clickCloseFilterView:(id)sender {
    view_filteritems.hidden = YES;
}
- (IBAction)clickApplyFilter:(id)sender {
     view_filteritems.hidden = YES;
}
- (IBAction)clickResetFiltersButton:(id)sender {
    if (IS_IPAD)
    {
        for (NSInteger i = 0 ; i < [sortTypeArray count]; i ++)
        {
            NSIndexPath *indPath = [NSIndexPath indexPathForItem:i inSection:0];
            [((CommonCell*)[tablelist_sort cellForRowAtIndexPath:indPath]).btn_selected setImage:[UIImage imageNamed:@"btn_deselected.png"] forState:UIControlStateNormal];
        }
    }
    for (NSInteger i = 0 ; i < [filterTypeArray count]; i ++)
    {
        NSIndexPath *indPath = [NSIndexPath indexPathForItem:i inSection:0];
        [((CommonCellWithImg*)[tablelist_filtertype cellForRowAtIndexPath:indPath]).btn_selected setImage:[UIImage imageNamed:@"btn_deselected.png"] forState:UIControlStateNormal];
    }
    for (NSInteger i = 0 ; i < [filterMaxPriceArray count]; i ++)
    {
        NSIndexPath *indPath = [NSIndexPath indexPathForItem:i inSection:0];
        [((CommonCell*)[tablelist_maxprice cellForRowAtIndexPath:indPath]).btn_selected setImage:[UIImage imageNamed:@"btn_deselected.png"] forState:UIControlStateNormal];
    }
    for (NSInteger i = 0 ; i < [filterPriceOffArray count]; i ++)
    {
        NSIndexPath *indPath = [NSIndexPath indexPathForItem:i inSection:0];
        [((CommonCell*)[tablelist_priceoff cellForRowAtIndexPath:indPath]).btn_selected setImage:[UIImage imageNamed:@"btn_deselected.png"] forState:UIControlStateNormal];
    }
}
- (IBAction)clickHomeButton:(id)sender {
    
}
- (IBAction)clickSearchButton:(id)sender {
    SearchVC *vc = [[SearchVC alloc] init];
    [self.navigationController pushViewController:vc animated:NO];
}
- (IBAction)clickAccountButton:(id)sender {
    MyAccountVC *vc = [[MyAccountVC alloc] init];
    [self.navigationController pushViewController:vc animated:NO];
}
- (IBAction)clickOtherButton:(id)sender {
    BrandsAndStoreVC *vc = [[BrandsAndStoreVC alloc] init];
    [self.navigationController pushViewController:vc animated:NO];
}
//---ipad---
- (IBAction)clickSortAndFilterButton:(id)sender {
    view_sort_and_view_filter_ipad.hidden = NO;
}
- (IBAction)clickResetOnFilterSortIpad:(id)sender {
    
}
- (IBAction)clickApplyFiltersButtonIpad:(id)sender {
    view_sort_and_view_filter_ipad.hidden = YES;
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
    if (tableView.tag == 3000) //wantlet
    {
        return [wantletArray count];
    }else if (tableView.tag == 3001) //sort
    {
        return [sortTypeArray count];
    }else if (tableView.tag == 3002) //filter type
    {
        return [filterTypeArray count];
    }else if (tableView.tag == 3003) //filter maxsize
    {
        return [filterMaxPriceArray count];
    }else /*if (tableView.tag == 3004)*/ //filter priceoff
    {
        return [filterPriceOffArray count];
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
    if (tableView.tag == 3000) //wantlet list
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
    }else if (tableView.tag == 3001) //sort list
    {
        static NSString *simpleTableIdentifier = @"CommonCell";
        
        CommonCell *cell = (CommonCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
        if (cell == nil)
        {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CommonCell" owner:self options:nil];
            cell = [nib objectAtIndex:0];
        }
        
        cell.label_sort_type.text = [sortTypeArray objectAtIndex:indexPath.row];
        return cell;
    }else if (tableView.tag == 3002) //filter type
    {
        static NSString *simpleTableIdentifier = @"CommonCellWithImg";
        
        CommonCellWithImg *cell = (CommonCellWithImg *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
        if (cell == nil)
        {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CommonCellWithImg" owner:self options:nil];
            cell = [nib objectAtIndex:0];
        }
        
        cell.label_type.text = [filterTypeArray objectAtIndex:indexPath.row];
        cell.img_type.image = [UIImage imageNamed:[filterTypeImgArray objectAtIndex:indexPath.row]];
        return cell;
    }else if (tableView.tag == 3003) //filter maxprice
    {
        static NSString *simpleTableIdentifier = @"CommonCell";
        
        CommonCell *cell = (CommonCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
        if (cell == nil)
        {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CommonCell" owner:self options:nil];
            cell = [nib objectAtIndex:0];
        }
        
        cell.label_sort_type.text = [filterMaxPriceArray objectAtIndex:indexPath.row];
        return cell;
    }else /*if (tableView.tag == 3004)*/ //filter priceoff
    {
        static NSString *simpleTableIdentifier = @"CommonCell";
        
        CommonCell *cell = (CommonCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
        if (cell == nil)
        {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CommonCell" owner:self options:nil];
            cell = [nib objectAtIndex:0];
        }
        
        cell.label_sort_type.text = [filterPriceOffArray objectAtIndex:indexPath.row];
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
    }else if (tableView.tag == 3001) //sort list
    {
        for (NSInteger i = 0 ; i < [sortTypeArray count]; i ++)
        {
            NSIndexPath *indPath = [NSIndexPath indexPathForItem:i inSection:0];
            [((CommonCell*)[tableView cellForRowAtIndexPath:indPath]).btn_selected setImage:[UIImage imageNamed:@"btn_deselected.png"] forState:UIControlStateNormal];
        }
        [((CommonCell*)cell).btn_selected setImage:[UIImage imageNamed:@"btn_selected.png"] forState:UIControlStateNormal];
    }else if (tableView.tag == 3002) //filter type list
    {
        for (NSInteger i = 0 ; i < [filterTypeArray count]; i ++)
        {
            NSIndexPath *indPath = [NSIndexPath indexPathForItem:i inSection:0];
            [((CommonCellWithImg*)[tableView cellForRowAtIndexPath:indPath]).btn_selected setImage:[UIImage imageNamed:@"btn_deselected.png"] forState:UIControlStateNormal];
        }
        [((CommonCellWithImg*)cell).btn_selected setImage:[UIImage imageNamed:@"btn_selected.png"] forState:UIControlStateNormal];
    }else if (tableView.tag == 3003) //filter maxprice list
    {
        for (NSInteger i = 0 ; i < [filterMaxPriceArray count]; i ++)
        {
            NSIndexPath *indPath = [NSIndexPath indexPathForItem:i inSection:0];
            [((CommonCell*)[tableView cellForRowAtIndexPath:indPath]).btn_selected setImage:[UIImage imageNamed:@"btn_deselected.png"] forState:UIControlStateNormal];
        }
        [((CommonCell*)cell).btn_selected setImage:[UIImage imageNamed:@"btn_selected.png"] forState:UIControlStateNormal];
    }else /*if (tableView.tag == 3004)*/ //filter priceoff list
    {
        for (NSInteger i = 0 ; i < [filterPriceOffArray count]; i ++)
        {
            NSIndexPath *indPath = [NSIndexPath indexPathForItem:i inSection:0];
            [((CommonCell*)[tableView cellForRowAtIndexPath:indPath]).btn_selected setImage:[UIImage imageNamed:@"btn_deselected.png"] forState:UIControlStateNormal];
        }
        [((CommonCell*)cell).btn_selected setImage:[UIImage imageNamed:@"btn_selected.png"] forState:UIControlStateNormal];
    }
}
- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"willSelectRowAtIndexPath");
    
    return indexPath;
}


@end
