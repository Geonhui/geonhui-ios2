//
//  NextViewCell.h
//  1121TableViewPrac
//
//  Created by Dabu on 2016. 11. 21..
//  Copyright © 2016년 Dabu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NextViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *cellImage;
@property (weak, nonatomic) IBOutlet UILabel *teamTitle;
@property (weak, nonatomic) IBOutlet UILabel *personalName;

@property (weak, nonatomic) IBOutlet UISlider *imageAlphaSlider;


@end
