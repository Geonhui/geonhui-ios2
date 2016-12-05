//
//  ViewController.m
//  ScrollViewTest
//
//  Created by geon hui kim on 2016. 12. 2..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
<UIScrollViewDelegate>
@property (strong, nonatomic) IBOutlet UIScrollView *scrollview;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scrollview.delegate = self;
    self.scrollview.pagingEnabled = YES;
    self.scrollview.contentSize = CGSizeMake(self.scrollview.bounds.size.width, self.scrollview.bounds.size.height);
//    self.scrollview.contentMode = UIViewContentModeScaleAspectFill;
    
    UIImageView *image = [[UIImageView alloc] init];
    [image setFrame:CGRectMake(0, 0, 283, 331)];
    [image setContentMode:UIViewContentModeScaleAspectFill];
    [image setImage:[UIImage imageNamed:@"giraffe.jpg"]];
    
    [self.scrollview addSubview:image];
    
    
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
