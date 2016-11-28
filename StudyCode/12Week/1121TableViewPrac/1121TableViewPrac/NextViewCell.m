//
//  NextViewCell.m
//  1121TableViewPrac
//
//  Created by Dabu on 2016. 11. 21..
//  Copyright © 2016년 Dabu. All rights reserved.
//

#import "NextViewCell.h"

@implementation NextViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    [self setSubLayout];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)setSubLayout {
    
    _cellImage.contentMode = UIViewContentModeScaleAspectFit;
}

- (IBAction)changedSliderValue:(id)sender {
    
    if ([sender isKindOfClass:[UISlider class]]) {
        
        UISlider *slider = (UISlider *)sender;
        _cellImage.alpha = slider.value;
    }
}


@end
