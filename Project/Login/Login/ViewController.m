//
//  ViewController.m
//  Login
//
//  Created by geon hui kim on 2016. 10. 12..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>

@property UIScrollView *mainScroll;
@property UITextField *idText;
@property UITextField *pwText;
//@property UIButton *loginbt;
//@property UIButton *pwbt;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //로그인 페이지 라벨 만들기
    UILabel *loginLabel = [[UILabel alloc]init];
    loginLabel.frame = CGRectMake(0, 80, self.view.frame.size.width, 40);
    loginLabel.font = [UIFont boldSystemFontOfSize:30];
    loginLabel.textAlignment = NSTextAlignmentCenter;
    loginLabel.text = @"I Love 귤";
    loginLabel.textColor = [UIColor orangeColor];
    [self.view addSubview:loginLabel];
    
    //스크롤뷰와 컨텐츠뷰
    self.mainScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(15, 200, self.view.frame.size.width - 30, 400)];
    [self.mainScroll setContentSize:CGSizeMake(0, self.mainScroll.frame.size.height + 120)];
    self.mainScroll.scrollEnabled = YES;
    self.mainScroll.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.mainScroll];
    
    //귤이미지뷰
    UIImageView *gulimage = [[UIImageView alloc]initWithFrame:CGRectMake(100, (self.mainScroll.frame.size.height / 2) - 100,
                                                                         self.mainScroll.frame.size.width - 200, 20)];
    [gulimage setImage:[UIImage imageNamed:@"gul.jpg"]];
    [gulimage setContentMode:UIViewContentModeScaleAspectFill];
    [self.mainScroll addSubview:gulimage];
    
    //텍스트필드추가하기
    //id 텍스트필드
    self.idText = [[UITextField alloc]initWithFrame:CGRectMake(50, (self.mainScroll.frame.size.height / 2),
                                                                       self.mainScroll.frame.size.width - 100, 40)];
    self.idText.font = [UIFont boldSystemFontOfSize:20];
    self.idText.textColor = [UIColor blackColor];
    self.idText.layer.borderWidth = 2.0f;
    self.idText.layer.borderColor = [[UIColor orangeColor]CGColor];
    self.idText.textAlignment = NSTextAlignmentCenter;
    self.idText.borderStyle = UITextBorderStyleLine;
    self.idText.placeholder = @"id를 입력해주십시오.";
    self.idText.delegate = self;
    [self.mainScroll addSubview:self.idText];
    
    //password 텍스트필드
    self.pwText = [[UITextField alloc]initWithFrame:CGRectMake(50, (self.mainScroll.frame.size.height / 2) + 50,
                                                                       self.mainScroll.frame.size.width - 100, 40)];
    self.pwText.font = [UIFont boldSystemFontOfSize:20];
    self.pwText.textColor = [UIColor blackColor];
    self.pwText.layer.borderWidth = 2.0f;
    self.pwText.layer.borderColor = [[UIColor orangeColor]CGColor];
    self.pwText.textAlignment = NSTextAlignmentCenter;
    self.pwText.borderStyle = UITextBorderStyleLine;
    self.pwText.secureTextEntry = YES;
    self.pwText.placeholder = @"pw를 입력해주십시오.";
    self.pwText.delegate = self;
    [self.mainScroll addSubview:self.pwText];
    
    //로그인 버튼
    UIButton *loginbt = [UIButton buttonWithType:UIButtonTypeCustom];
    loginbt.frame = CGRectMake(50, (self.mainScroll.frame.size.height /2) + 100, 100, 30);
    [loginbt setTitle:@"로그인" forState:UIControlStateNormal];
    [loginbt setTitle:@"로그인" forState:UIControlStateSelected];
    [loginbt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [loginbt setTitleColor:[UIColor darkGrayColor] forState:UIControlStateSelected];
    loginbt.backgroundColor = [UIColor orangeColor];
    loginbt.titleLabel.textAlignment = NSTextAlignmentCenter;
    [loginbt addTarget:self action:@selector(touchin:) forControlEvents:UIControlEventTouchUpInside];
    [self.mainScroll addSubview:loginbt];
    
    //회원가입 버튼
    UIButton *pwbt = [UIButton buttonWithType:UIButtonTypeCustom];
    pwbt.frame = CGRectMake(self.mainScroll.frame.size.width - 150, (self.mainScroll.frame.size.height /2) + 100, 100, 30);
    [pwbt setTitle:@"회원가입" forState:UIControlStateNormal];
    [pwbt setTitle:@"회원가입" forState:UIControlStateSelected];
    [pwbt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [pwbt setTitleColor:[UIColor darkGrayColor] forState:UIControlStateSelected];
    pwbt.backgroundColor = [UIColor orangeColor];
    pwbt.titleLabel.textAlignment = NSTextAlignmentCenter;
    [pwbt addTarget:self action:@selector(touchin:) forControlEvents:UIControlEventTouchUpInside];
    [self.mainScroll addSubview:pwbt];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


//아이디, 회원가입버튼 눌렀을 경우
- (void)touchin:(UIButton *)button
{
    if (button.selected) {
        button.selected = NO;
    }else {
        button.selected = YES;
    }
}

//텍스트필드를 처음눌렀을 경우에 동작하는 메서드
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{   //메인스크롤이 위로 올라감
    [self.mainScroll setContentOffset:CGPointMake(0, 40)];
    return YES;
}
//텍스트필드에서 작업을 종료했을 경우에 동작하는 메서드
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{   //메일스크롤이 원래위치로 돌아옴
    [self.mainScroll setContentOffset:CGPointMake(0, 0)];
    return YES;
}
//키보드의 리턴버튼을 눌렀을 경우 동작하는 메서드
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == self.idText) {
        [self.idText resignFirstResponder];    //리자인은 사퇴
        [self.pwText becomeFirstResponder];    //비컴은 불러오기
    }else if (textField ==self.pwText) {
        [self.view endEditing:YES];            //키보드해제
    }
        return YES;
}



@end
