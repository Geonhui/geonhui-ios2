//
//  ImageViewController.m
//  NetworkingMiniProject2
//
//  Created by geon hui kim on 2016. 11. 16..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController ()

@property (nonatomic) IBOutlet UIImageView *loadimage;

@end

@implementation ImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setLoadimage:) name:@"displayImage" object:nil];
    
}

- (void)setLoadimage:(UIImageView *)loadimage
{
    self.loadimage.image = loadimage.image;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
