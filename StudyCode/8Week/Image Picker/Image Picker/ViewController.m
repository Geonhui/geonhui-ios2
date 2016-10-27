//
//  ViewController.m
//  Image Picker
//
//  Created by geon hui kim on 2016. 10. 27..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //이미지뷰 생성
    UIImageView *mainImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [mainImage setImage:[UIImage imageNamed:@"캐릭터_png"]];
    [mainImage setUserInteractionEnabled:YES];
    [self.view addSubview:mainImage];
    
    //탭 제스처 리코나이저 생성
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchesForView:)];
    [mainImage addGestureRecognizer:tap];
    
}

//탭 제스처 리코나이저 메서드
- (void)touchesForView:(id)sender
{
    //얼럿 컨트롤러 생성
    UIAlertController *mainAlert = [UIAlertController alertControllerWithTitle:@"사진소스선택"
                                                                       message:@"가져올사진의 소스를 선택하세요"
                                                                preferredStyle:UIAlertControllerStyleActionSheet];
    
    //얼럿 액션 생성
    UIAlertAction *mainAction = [UIAlertAction actionWithTitle:@"라이브러리" style:UIAlertActionStyleDefault handler:nil];
    UIAlertAction *mainAction1 = [UIAlertAction actionWithTitle:@"사진앨범" style:UIAlertActionStyleDefault handler:nil];
    UIAlertAction *mainAction2 = [UIAlertAction actionWithTitle:@"취소" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *mainAction3 = [UIAlertAction actionWithTitle:@"카메라" style:UIAlertActionStyleDefault handler:nil];
    
    //얼럿컨트롤러에 얼럿액션 추가
    [mainAlert addAction:mainAction];
    [mainAlert addAction:mainAction1];
    [mainAlert addAction:mainAction2];
    [mainAlert addAction:mainAction3];
    
    //얼럿컨트롤러 추가
    [self presentViewController:mainAlert animated:YES completion:nil];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
