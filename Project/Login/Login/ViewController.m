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
    UILabel *loginLabel = [[UILabel alloc]init]; //객체생성,초기화
    loginLabel.frame = CGRectMake(0, 80, self.view.frame.size.width, 40); //라벨사이즈
    loginLabel.font = [UIFont boldSystemFontOfSize:30]; //폰트 글씨체, 크기
    loginLabel.textAlignment = NSTextAlignmentCenter;  //텍스트 정렬
    loginLabel.text = @"My Login Page";  //문자지정
    loginLabel.textColor = [UIColor orangeColor];  //글씨색상
    [self.view addSubview:loginLabel];  //뷰 위에 생성
    
    //스크롤뷰와 컨텐츠뷰
    self.mainScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(15, 200, self.view.frame.size.width - 30, 400)]; //스크롤뷰크기지정
    [self.mainScroll setContentSize:CGSizeMake(0, self.mainScroll.frame.size.height + 120)];  //컨텐츠사이즈를 지정해주어야 스크롤 범위가 지정이된다.
    self.mainScroll.scrollEnabled = YES; //스크롤을 사용할것인가
    self.mainScroll.backgroundColor = [UIColor clearColor]; //스크롤뷰의 배경색상
    [self.view addSubview:self.mainScroll]; //뷰위에 스크롤 뷰 생성
    
    //귤이미지뷰
    //귤 이미지 뷰 객체 생성, 초기화, 사이즈지정
    UIImageView *gulimage = [[UIImageView alloc]initWithFrame:CGRectMake(100, (self.mainScroll.frame.size.height / 2) - 100,
                                                                         self.mainScroll.frame.size.width - 200, 20)];
    [gulimage setImage:[UIImage imageNamed:@"gul.jpg"]]; //이미지 지정
    [gulimage setContentMode:UIViewContentModeScaleAspectFill]; //이미지가 들어갈 사이즈지엉
    [self.mainScroll addSubview:gulimage];  //스크롤뷰에 생성
    
    //텍스트필드추가하기
    //id 텍스트필드
    self.idText = [[UITextField alloc]initWithFrame:CGRectMake(50, (self.mainScroll.frame.size.height / 2),
                                                                       self.mainScroll.frame.size.width - 100, 40)];
    self.idText.font = [UIFont boldSystemFontOfSize:20];  //폰트지정, 크기
    self.idText.textColor = [UIColor blackColor];  //글씨색상
    self.idText.layer.borderWidth = 2.0f; //테두리 크기
    self.idText.layer.borderColor = [[UIColor orangeColor]CGColor]; //테두리 색상
    self.idText.textAlignment = NSTextAlignmentCenter;  //텍스트 정렬
    self.idText.borderStyle = UITextBorderStyleLine;  //테두리 스타일
    self.idText.placeholder = @"id를 입력해주십시오.";  //테두리 안에 연하게 보이는 글짜
    self.idText.delegate = self;  //델리게이트와 연결
    [self.mainScroll addSubview:self.idText];  //스크롤뷰안에 생성
    
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
    UIButton *loginbt = [UIButton buttonWithType:UIButtonTypeCustom];  //버튼타입을 커스텀으로 생성
    loginbt.frame = CGRectMake(50, (self.mainScroll.frame.size.height /2) + 100, 100, 30);  //크기와 위치
    [loginbt setTitle:@"로그인" forState:UIControlStateNormal];  //평상시 상태를 노말
    [loginbt setTitle:@"로그인" forState:UIControlStateSelected];  //눌렀을 경우를 셀렉트
    [loginbt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];  //노말일경우 글자색상
    [loginbt setTitleColor:[UIColor darkGrayColor] forState:UIControlStateSelected];  //셀렉트일경우 글자색상
    loginbt.backgroundColor = [UIColor orangeColor];  //버튼배경색상
    loginbt.titleLabel.textAlignment = NSTextAlignmentCenter; //텍스트 정렬
    [loginbt addTarget:self action:@selector(touchin:) forControlEvents:UIControlEventTouchUpInside]; //버튼의 액션 (@selector)에는 메서드 선언해야함
    [self.mainScroll addSubview:loginbt]; //스크롤뷰위에 생성
    
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


//아이디, 회원가입버튼 눌렀을 경우, 버튼액션
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
    [self.mainScroll setContentOffset:CGPointMake(0, 60)];
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
        [self.idText resignFirstResponder];    //리자인은 사퇴, 되도록이면 안쓰는게 좋다
        [self.pwText becomeFirstResponder];    //비컴은 불러오기
    }else if (textField ==self.pwText) {
        [self.view endEditing:YES];            //키보드해제
    }
        return YES;
}



@end
