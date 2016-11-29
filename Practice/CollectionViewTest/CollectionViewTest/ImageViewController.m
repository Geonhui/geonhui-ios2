//
//  ImageViewController.m
//  CollectionViewTest
//
//  Created by geon hui kim on 2016. 11. 29..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController ()
<UINavigationControllerDelegate>

@property IBOutlet UIImageView *readImegeView;
@property IBOutlet UILabel *storyLabel;

@end

@implementation ImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageInfo = [[NSMutableArray alloc] init];
    //어레이로 셀의 순서를 받아야됨
//    NSLog(@"%@", self.imageInfo[0][@"photoImage"]);
    
    
    
//    NSArray *imageData = [[NSArray alloc] init];
//    [imageData objectAtIndex:self.imageInfo.count];
    
    //이미지뷰 접근
//    [self.readImegeView setUserInteractionEnabled:YES];
//    
//    [self.readImegeView setImage:[[NSUserDefaults standardUserDefaults] objectForKey:@"photoImage"]];
//    [self.readImegeView setContentMode:UIViewContentModeScaleToFill];
//    [self.view addSubview:self.readImegeView];
//    
//    [self.storyLabel setText:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"photoStory"]]];
//    [self.view addSubview:self.storyLabel];
    
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"%@", self.imageInfo[0][@"photoImage"]);
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
