//
//  ViewController.m
//  TestPage
//
//  Created by geon hui kim on 2016. 10. 24..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button1 addTarget:self action:@selector(touchin:) forControlEvents:UIControlEventTouchUpInside];
    [button1 setFrame:CGRectMake(0, 0, 100, 44)];
    [button1 setTitle:@"Next" forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 44)];
    [label1 setText:@"main"];
    [label1 setTextAlignment:NSTextAlignmentCenter];
    [label1 setTextColor:[UIColor orangeColor]];
    
    UIBarButtonItem *bar1 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemUndo
                                                                         target:self
                                                                         action:@selector(touchonback:)];
    UIBarButtonItem *bar2 = [[UIBarButtonItem alloc]initWithCustomView:button1];
    
    
    
    
    self.navigationItem.titleView = label1;
    self.navigationItem.leftBarButtonItem = bar1;
    self.navigationItem.rightBarButtonItem = bar2;
    
    
    //애니메이션
    [self setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
}

//네비게이션 system undo액션 메서드
- (void)touchonback:(UIBarButtonItem *)sender
{
    NSLog(@"undo button");
}

//네비게이션 custom next액션 메서드
- (void)touchin:(UIBarButtonItem *)sender
{
    NSLog(@"next button");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//로그인화면에서 회원가입버튼눌렀을 경우 회원가입화면으로 넘어가는 화면전환
- (IBAction)touchupinsidebutton:(id)sender
{
    UIStoryboard *stroryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc2 = [stroryboard instantiateViewControllerWithIdentifier:@"ViewController2"];

    //회원가입버튼 누르면 화면전환
    //[self presentViewController:vc2 animated:YES completion:nil];
    
    //애니메이션
    //[vc2 setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    
    //네비게이션으로 화면이동
    [self.navigationController pushViewController:vc2 animated:YES];
}

@end
