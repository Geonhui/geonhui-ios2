//
//  CustomCell.m
//  1121TableViewPrac
//
//  Created by Dabu on 2016. 11. 21..
//  Copyright © 2016년 Dabu. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    [self setSubViewConfig];
}

#pragma mark - Custom Method 

- (void)setSubViewConfig {
    
    [self.imageView setClipsToBounds:YES];
    self.imageView.layer.cornerRadius = roundf(self.imageView.frame.size.width/2.0f);
    [self.imageView.layer setBorderWidth:1.f];
    [self.imageView setContentMode:UIViewContentModeScaleAspectFit];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
