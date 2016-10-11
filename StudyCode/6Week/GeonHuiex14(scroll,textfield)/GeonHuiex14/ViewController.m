//
//  ViewController.m
//  GeonHuiex14
//
//  Created by geon hui kim on 2016. 10. 11..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>

@property UITextField *textField;
@property UIButton *button;
@property UILabel *label;
//@property UILabel *page;

@end

@implementation ViewController

//- (void)viewDidLoad {
//
//    [super viewDidLoad];
// 
//    UIScrollView *scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, 460)];
//    [scroll setContentSize:CGSizeMake(scroll.frame.size.width * 3, 460)];
//    scroll.delegate = self;
//    scroll.pagingEnabled = YES;
//    [self.view addSubview:scroll];
//    
//    UIView *newView1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 460)];
//    newView1.backgroundColor = [UIColor purpleColor];
//    [scroll addSubview:newView1];
//    
//    UIView *newView2 = [[UIView alloc]initWithFrame:CGRectMake(320, 0, 320, 460)];
//    newView2.backgroundColor = [UIColor redColor];
//    [scroll addSubview:newView2];
//
//    UIView *newView3 = [[UIView alloc]initWithFrame:CGRectMake(640, 0, 320, 460)];
//    newView3.backgroundColor = [UIColor greenColor];
//    [scroll addSubview:newView3];
//
//    self.page = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 300, 50)];
//    self.page.text = @"page : 1";
//    self.page.font = [UIFont systemFontOfSize:40];
//    self.page.textColor = [UIColor whiteColor];
//    self.page.textAlignment = NSTextAlignmentCenter;
//    [self.view addSubview:self.page];
//}

//텍스트필드
- (void)viewDidLoad {
    [super viewDidLoad];
 
    //텍스트필드
    self.textField = [[UITextField alloc]initWithFrame:CGRectMake(50, 50, 200, 30)];
    self.textField.font = [UIFont systemFontOfSize:30];
    self.textField.textColor = [UIColor blackColor];
    self.textField.textAlignment = NSTextAlignmentLeft;
    self.textField.borderStyle = UITextBorderStyleLine;
    self.textField.placeholder = @"입력";
    self.textField.delegate = self;
    [self.view addSubview:self.textField];
    
    //버튼
    self.button = [[UIButton alloc]initWithFrame:CGRectMake(300, 50, 50, 50)];
    [self.button setTitle:@"확인" forState:UIControlStateNormal];
    [self.button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.button addTarget:self action:@selector(touchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    self.button.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.button];
    
    //결과가 바뀌는 라벨
    self.label = [[UILabel alloc]initWithFrame:CGRectMake(50, 100, self.view.frame.size.width, 50)];
    self.label.text = @"결과";
    self.label.font = [UIFont systemFontOfSize:30];
    self.label.textColor = [UIColor blackColor];
    self.label.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:self.label];
}

////offset구해서 화면별로 페이지 정하기
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView
//{
//    //offset을 구해서 1번 offset일 경우에는 1번, 1번 offset을 벗어났을경우에는 2번, 2번 offset을 벗어났을경우는 3번을 표시
//    NSInteger pageLabel = scrollView.contentOffset.x / self.view.frame.size.width + 1;
//    self.page.text = [[NSString alloc]initWithFormat:@"page : %ld", pageLabel];
//}

- (void)touchUpInside:(UIButton *)button
{
    //텍스트필드에 문자를 입력 후 확인버튼을 누르면 아래의 라벨에 표시되도록 하기!
    NSString *labels = [[NSString alloc]initWithFormat:@"결과 : %@",self.textField.text];
    self.label.text = labels;
    [self.label resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
