//
//  ViewController2.m
//  StudyNavigationBar
//
//  Created by geon hui kim on 2016. 10. 25..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()

@property (weak, nonatomic) IBOutlet UITabBarItem *orangetab;

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //탭바 커스텀 버튼 누를경우 바뀜
    UITabBarItem *changeTabBarItem2 = [[UITabBarItem alloc]initWithTitle:@"사랑" image:[UIImage imageNamed:@"사랑"] tag:2];
    self.orangetab = changeTabBarItem2;
    self.tabBarItem = self.orangetab;
    
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
