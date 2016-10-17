//
//  Login.m
//  FirstStoryboard
//
//  Created by geon hui kim on 2016. 10. 17..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "Login.h"

@interface Login ()  <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *idtext; //아이디텍스트필드
@property (weak, nonatomic) IBOutlet UITextField *pwtext; //비밀번호텍스트필드
@property (weak, nonatomic) IBOutlet UIButton *loginbt;  //로그인버튼
@property (weak, nonatomic) IBOutlet UIButton *autocheckbt; //체크박스

@end

@implementation Login

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//아이디와 비밀번호 입력후 그 입력값이 나오도록
- (IBAction)loginBtAction:(id)sender
{   //아이디의 텍스트필드, 비밀번호의 텍스트필드에 적힌 텍스트를 받아와 표시한다.
    NSLog(@"id는 %@, pw는 %@", self.idtext.text, self.pwtext.text);
}

//자동로그인 체크박스 눌렀을때 체크보기
- (IBAction)autologinbt:(id)sender
{   //체크박스를 눌렀을 경우
    if ([sender isKindOfClass:[UIButton class]]) {
        //자동로그인 체크박스를 누른상태(selected)에서 체크를 표시하기위해 !(반전)을 해준다.
        //체크가 없을 경우에는 체크가 나타나게, 체크가 있을 경우에는 체크를 없앤다.
        [self.autocheckbt setSelected:![self.autocheckbt isSelected]];
    }
}

//아이디 텍스트필드 입력후 패스워드텍스트로 넘어가는 메서드
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{   //아이디텍스트필드일때
    if (textField == self.idtext) {
        [self.pwtext becomeFirstResponder]; //아이디에서 텍스트로 넘어감
    }else if (textField == self.pwtext) { //패스워드텍스트필드일때
        [self.pwtext endEditing:YES];  //패스워드에서 리턴버튼누를경우 키패드를 마침
    }return YES;
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
