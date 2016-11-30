//
//  ImageViewController.m
//  CollectionViewTest
//
//  Created by geon hui kim on 2016. 11. 29..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "ImageViewController.h"
#import "ViewController.h"
#import "DataCenter.h"

@interface ImageViewController ()
<UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *readImegeView;
@property (weak, nonatomic) IBOutlet UILabel *storyLabel;

@end

@implementation ImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    self.storyLabel.text = [NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"addName"]];
//    self.storyLabel.text = [NSString stringWithUTF8String:[[NSUserDefaults standardUserDefaults] objectForKey:@"addName"]];
    
    
//    NSString *imagestory = [[NSUserDefaults standardUserDefaults] objectForKey:@"photoStory"];
//    
//    self.storyLabel.text = [NSString stringWithFormat:@"%@",imagestory];
//    
//    NSData *image = [[NSUserDefaults standardUserDefaults] objectForKey:@"photoImage"];
//    
//    self.readImegeView.image = [UIImage imageWithData:image];
    
    //노티
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(viewWillAppear:)
                                                 name:@"celldatasave"
                                               object:self.imageData];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSData *nameData = [[NSUserDefaults standardUserDefaults] objectForKey:@"addName"];
    NSString *nameString = [NSString stringWithFormat:@"%@", nameData];
    
    [self.storyLabel setText:nameString];
    self.readImegeView.image = [UIImage imageWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"photoImage"]];
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
