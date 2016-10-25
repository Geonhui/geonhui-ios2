//
//  ViewController1.m
//  StudyNavigationBar
//
//  Created by geon hui kim on 2016. 10. 25..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "ViewController1.h"

@interface ViewController1 ()

@property (weak, nonatomic) IBOutlet UITabBarItem *pinktab;

@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    
     //탭바 커스텀 버튼 누를경우 바뀜
     UITabBarItem *changeTabBarItem1 = [[UITabBarItem alloc]initWithTitle:@"여행" image:[UIImage imageNamed:@"여행"] tag:1];
     self.pinktab = changeTabBarItem1;
     self.tabBarItem = self.pinktab;
    
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
