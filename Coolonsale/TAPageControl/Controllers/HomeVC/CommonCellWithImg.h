//
//  SimpleTableCell.h
//  SimpleTable
//
//  Created by Simon Ng on 28/4/12.
//  Copyright (c) 2012 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommonCellWithImg: UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *label_type;
@property (strong, nonatomic) IBOutlet UIButton *btn_selected;
@property (strong, nonatomic) IBOutlet UIImageView *img_type;
@end
