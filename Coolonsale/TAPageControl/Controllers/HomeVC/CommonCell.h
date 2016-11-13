//
//  SimpleTableCell.h
//  SimpleTable
//
//  Created by Simon Ng on 28/4/12.
//  Copyright (c) 2012 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommonCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *label_sort_type;
@property (strong, nonatomic) IBOutlet UIButton *btn_selected;
@end
