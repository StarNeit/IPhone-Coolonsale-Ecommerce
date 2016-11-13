//
//  ViewController.m
//  TAPageControl
//
//  Created by Tanguy Aladenise on 2015-01-21.
//  Copyright (c) 2015 Tanguy Aladenise. All rights reserved.
//

// Controllers
#import "BrandsAndStoreVC.h"
#import "Common.h"
#import "ProductCell.h"
#import "WantletCell.h"
#import "HomeVC.h"
#import "ProductDetailsVC.h"
#import "SearchVC.h"
#import "CommonCellWithImg.h"

@interface BrandsAndStoreVC ()
{
   
    IBOutlet UIView *view_stores;
    IBOutlet UIView *view_brands;
    
    IBOutlet UITableView *tablelist_brands;
    IBOutlet UITableView *tablelist_stores;
    
    IBOutlet UIImageView *img_top_buttons;
    
    IBOutlet UIButton *btn_az_store;
    IBOutlet UIButton *btn_top_stores;
    IBOutlet UIButton *btn_az_brands;
    IBOutlet UIButton *btn_top_brands;
    
    
    NSArray *iconlist;
    NSArray *iconlist2;
    NSArray *brands_list;
    NSArray *stores_list;
}
@end


@implementation BrandsAndStoreVC

#pragma mark - Lifecycle
- (void)initialize
{
    iconlist = [NSArray arrayWithObjects:@"1.png",@"2.png",@"3.png",@"4.png",@"5.png",@"6.png",@"7.png",@"8.png",@"9.png",nil];
    iconlist2 = [NSArray arrayWithObjects:@"6.png",@"7.png",@"8.png",@"9.png",@"1.png",@"2.png",@"3.png",@"4.png",@"5.png",nil];
    brands_list = [NSArray arrayWithObjects: @"Dansko",@"Anne Klein",@"Free People",@"Spring Step",@"Map Sand Art",@"Quadrata lpsu",@"Valentino",@"Dolce & Gabbana",@"Collor etta como",nil];
    stores_list = [NSArray arrayWithObjects:@"6pm.com", @"Amazon.com",@"Bllomindales",@"Bluefly",@"Planetshoes.com",@"Macy's",@"Nordstrom Rack",@"One Kings Land",@"The Real Real",nil];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
//---Initialize---
    [self initialize];
    
    tablelist_brands.tag = 5000;
    tablelist_stores.tag = 5001;
    
}




//************************//
//*      UI Control      *//
//************************//
- (IBAction)clickBrandsButton:(id)sender {
    img_top_buttons.image = [UIImage imageNamed:@"img_top_brands_btn.png"];
    view_brands.hidden = NO;
    view_stores.hidden = YES;
}
- (IBAction)clickStoresButton:(id)sender {
    img_top_buttons.image = [UIImage imageNamed:@"img_top_stores_btn.png"];
    view_brands.hidden = YES;
    view_stores.hidden = NO;
}
- (IBAction)clickTopBrandsButton:(id)sender {
    [btn_top_brands setImage:[UIImage imageNamed:@"btn_top_brands_on.png"] forState:UIControlStateNormal];
    [btn_az_brands setImage:[UIImage imageNamed:@"btn_az.png"] forState:UIControlStateNormal];

}
- (IBAction)clickAZButtonBrands:(id)sender {
    [btn_top_brands setImage:[UIImage imageNamed:@"btn_top_brands.png"] forState:UIControlStateNormal];
    [btn_az_brands setImage:[UIImage imageNamed:@"btn_az_on.png"] forState:UIControlStateNormal];

}
- (IBAction)clickAZButtonStores:(id)sender {
    [btn_top_stores setImage:[UIImage imageNamed:@"btn_top_stores.png"] forState:UIControlStateNormal];
    [btn_az_store setImage:[UIImage imageNamed:@"btn_az_on.png"] forState:UIControlStateNormal];
    
}
- (IBAction)clickTopStoresButton:(id)sender {
    [btn_top_stores setImage:[UIImage imageNamed:@"btn_top_stores_on.png"] forState:UIControlStateNormal];
    [btn_az_store setImage:[UIImage imageNamed:@"btn_az.png"] forState:UIControlStateNormal];
}
- (IBAction)clickApplyButton:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}




//************************//
//*      Table view      *//
//************************//
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView.tag == 5000) //brands
    {
        return [brands_list count];
    }else //if (tableView.tag == 5001) //stores
    {
        return [stores_list count];
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //if (tableView.tag == 5000,5001) //brands,stores
    {
        return 50;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag == 5000) //brands list
    {
        static NSString *simpleTableIdentifier = @"CommonCellWithImg";
        
        CommonCellWithImg *cell = (CommonCellWithImg *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
        if (cell == nil)
        {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CommonCellWithImg" owner:self options:nil];
            cell = [nib objectAtIndex:0];
        }
        
        cell.label_type.text = [brands_list objectAtIndex:indexPath.row];
        
        //---Photo Image---
        UIImage *holder = [UIImage imageNamed:[iconlist objectAtIndex:indexPath.row]];
        cell.img_type.image = holder;
        return cell;
    }else //if (tableView.tag == 5001) //stores list
    {
        static NSString *simpleTableIdentifier = @"CommonCellWithImg";
        
        CommonCellWithImg *cell = (CommonCellWithImg *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
        if (cell == nil)
        {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CommonCellWithImg" owner:self options:nil];
            cell = [nib objectAtIndex:0];
        }
        
        cell.label_type.text = [stores_list objectAtIndex:indexPath.row];
        
        //---Photo Image---
        UIImage *holder = [UIImage imageNamed:[iconlist2 objectAtIndex:indexPath.row]];
        cell.img_type.image = holder;
        return cell;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (tableView.tag == 5000) //brands list
    {
        for (NSInteger i = 0 ; i < [brands_list count]; i ++)
        {
            NSIndexPath *indPath = [NSIndexPath indexPathForItem:i inSection:0];
            [((CommonCellWithImg*)[tableView cellForRowAtIndexPath:indPath]).btn_selected setImage:[UIImage imageNamed:@"btn_deselected.png"] forState:UIControlStateNormal];
        }
        [((CommonCellWithImg*)cell).btn_selected setImage:[UIImage imageNamed:@"btn_selected.png"] forState:UIControlStateNormal];
    }else if (tableView.tag == 5001) //stores list
    {
        for (NSInteger i = 0 ; i < [stores_list count]; i ++)
        {
            NSIndexPath *indPath = [NSIndexPath indexPathForItem:i inSection:0];
            [((CommonCellWithImg*)[tableView cellForRowAtIndexPath:indPath]).btn_selected setImage:[UIImage imageNamed:@"btn_deselected.png"] forState:UIControlStateNormal];
        }
        [((CommonCellWithImg*)cell).btn_selected setImage:[UIImage imageNamed:@"btn_selected.png"] forState:UIControlStateNormal];
    }
}
- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"willSelectRowAtIndexPath");
    
    return indexPath;
}




@end
