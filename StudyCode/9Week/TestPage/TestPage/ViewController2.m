//
//  ViewController2.m
//  TestPage
//
//  Created by geon hui kim on 2016. 10. 24..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "ViewController2.h"
#import "ViewController.h"
#import "ViewController3.h"

@interface ViewController2 ()
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *pw1;
@property (weak, nonatomic) IBOutlet UITextField *pw2;

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

//join버튼 누를경우 mainpage로 화면 전환
//join버튼 누르면 데이터 저장
- (IBAction)touchinjoin:(id)sender
{
    //패스워드가 틀릴때
    if (![self.pw1.text isEqualToString:self.pw2.text]) {
        UIAlertController *joinerror = [UIAlertController alertControllerWithTitle:@"가입실패"
                                                                           message:@"회원정보가 맞지않습니다."
                                                                    preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *joinerroraction = [UIAlertAction actionWithTitle:@"확인"
                                                                  style:UIAlertActionStyleDefault
                                                                handler:nil];
        
        [joinerror addAction:joinerroraction];
        [self presentViewController:joinerror animated:YES completion:nil];
    }

    //중복일때
    if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"id"]isEqualToString:self.email.text]) {
        
        UIAlertController *joinerror1 = [UIAlertController alertControllerWithTitle:@"중복가입"
                                                                           message:@"회원정보가 중복입니다."
                                                                    preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *joinerroraction1 = [UIAlertAction actionWithTitle:@"확인"
                                                                  style:UIAlertActionStyleDefault
                                                                handler:nil];
        
        [joinerror1 addAction:joinerroraction1];
        [self presentViewController:joinerror1 animated:YES completion:nil];
    }else {
        UIStoryboard *stroryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController *vc3 = [stroryboard instantiateViewControllerWithIdentifier:@"ViewController3"];
        
        [self.navigationController pushViewController:vc3 animated:YES];
        
        [[DataCenter sharedManger] joinUserID:self.email.text userPW:self.pw1.text];
    }
}

//이전화면 버튼눌렀을 경우 로그인페이지로 돌아가기
- (IBAction)touchoninsidebtn:(id)sender
{
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
