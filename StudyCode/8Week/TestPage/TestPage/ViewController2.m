//
//  ViewController2.m
//  TestPage
//
//  Created by geon hui kim on 2016. 10. 24..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "ViewController2.h"
#import "ViewController.h"

@interface ViewController2 ()

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    //애니메이션
    [self setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//이전화면 버튼눌렀을 경우 로그인페이지로 돌아가기
- (IBAction)touchoninsidebtn:(id)sender
{
    //이전화면 버튼눌렀을경우 로그인페이지로 화면전환
    //[self dismissViewControllerAnimated:YES completion:nil];
    
    //애니메이션
    //[self setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    
    //네비게이션으로 화면이동
    [self.navigationController popViewControllerAnimated:YES];
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
