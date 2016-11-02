//
//  ViewController.m
//  TestPage
//
//  Created by geon hui kim on 2016. 10. 24..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"
#import "ViewController3.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *mainemail;
@property (weak, nonatomic) IBOutlet UITextField *mainpw;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //싱글턴표시확인
    [[DataCenter sharedManger] print];
    
    //네비게이션 가림
    [self.navigationController setNavigationBarHidden:YES];
    
    //애니메이션
    [self setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
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
    
    //네비게이션으로 화면이동
    [self.navigationController pushViewController:vc2 animated:YES];
}

//로그인화면에서 로그인버튼눌렀을 경우 메인페이지로 넘어가는 화면전환
- (IBAction)loginbutton:(id)sender
{
    
    if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"id"] isEqualToString:self.mainemail.text],
        [[[NSUserDefaults standardUserDefaults] objectForKey:@"pw"] isEqualToString:self.mainpw.text]) {
        
        UIStoryboard *stroryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController *vc3 = [stroryboard instantiateViewControllerWithIdentifier:@"ViewController3"];
        
        [self.navigationController pushViewController:vc3 animated:YES];
    }else {
        
        UIAlertController *mainlogin = [UIAlertController alertControllerWithTitle:@"로그인 실패"
                                                                           message:@"이메일과 비번이틀렸습니다."
                                                                    preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *mainloginaction = [UIAlertAction actionWithTitle:@"오키"
                                                                  style:UIAlertActionStyleDefault
                                                                handler:nil];
        
        [mainlogin addAction:mainloginaction];
        [self presentViewController:mainlogin animated:YES completion:nil];
    }
}

@end
