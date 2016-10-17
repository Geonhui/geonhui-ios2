//
//  IdolCell.m
//  UITableview2
//
//  Created by geon hui kim on 2016. 10. 14..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "IdolCell.h"

@interface IdolCell()

@property UIImageView *backgroundImage;
@property UIView * coverView;
@property UILabel *titleLb;

@end

@implementation IdolCell

//재사용
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createView];
    }
    return self;
}

//
-(void)layoutSubviews
{
    [super layoutSubviews];
    [self updateLayout];
}

//뷰 생성
-(void)createView
{
    //배경이미지
    self.backgroundImage = [[UIImageView alloc]init];
    self.backgroundImage.contentMode = UIViewContentModeScaleAspectFill;
    self.backgroundImage.clipsToBounds = YES;
    [self addSubview:self.backgroundImage];
    
    //커버뷰
    self.coverView = [[UIView alloc]initWithFrame:CGRectMake(10, 10, self.frame.size.width-20, self.frame.size.height-20)];
    self.coverView.backgroundColor = [[UIColor alloc]initWithRed:30.f/255 green:30.f/255 blue:30.f/255 alpha:0.5];
    [self.backgroundImage addSubview:self.coverView];
    
    //타이틀
    self.titleLb = [[UILabel alloc]init];
    self.titleLb.font = [UIFont boldSystemFontOfSize:40];
    self.titleLb.textAlignment = NSTextAlignmentCenter;
    self.titleLb.textColor = [UIColor whiteColor];
    [self.coverView addSubview:self.titleLb];
}

//뷰들의 레이아웃
-(void)updateLayout
{
    self.backgroundImage.frame = self.bounds;
    self.coverView.frame = CGRectMake(10, 10, self.frame.size.width-20, self.frame.size.height-20);
    self.titleLb.frame = CGRectMake(0, 20, self.coverView.frame.size.width, self.coverView.frame.size.height-40);
}

//배경 이미지
-(void)setBackgroundImageName:(NSString *)name
{
    self.backgroundImage.image = [UIImage imageNamed:name];
}

//타이틀
-(void)setTitle:(NSString *)title
{
    self.titleLb.text = title;
}

//- (void)awakeFromNib {
//    [super awakeFromNib];
//    // Initialization code
//}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


@end
