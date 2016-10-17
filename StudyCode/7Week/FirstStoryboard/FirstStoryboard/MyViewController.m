//
//  MyViewController.m
//  FirstStoryboard
//
//  Created by geon hui kim on 2016. 10. 17..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "MyViewController.h"

@interface MyViewController ()

//스토리보드의 뷰들과 컨트롤러를 연결
@property IBOutlet UILabel *mylabel; //라벨
@property IBOutlet UIButton *mybutton; //버튼
@property IBOutlet UISegmentedControl *mycontrol; //세그먼트
@property IBOutlet UITextField *mytext; //텍스트필드
@property IBOutlet UISlider *myslider; //슬라이드
@property IBOutlet UISwitch *myswitch; //스위치
@property IBOutlet UIStepper *mystepper; //스태퍼

@property (weak, nonatomic) IBOutlet UIView *changeview;  //색상이 바뀌는 뷰
@property (weak, nonatomic) IBOutlet UISlider *redslider;  //빨강 슬라이드
@property (weak, nonatomic) IBOutlet UISlider *greenslider;  //초록 슬라이드
@property (weak, nonatomic) IBOutlet UISlider *blueslider;  //파랑 슬라이드

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 스토리보드의 뷰들이 우선적으로 표시됨, 스토리보드 > 코드
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//스토리보드의 버튼의 액션연결
- (IBAction)clickbutton:(id)sender
{   //sender가 버튼일 경우
    //isKindOfclass는 해당 클래스가 맞느냐
    if ([sender isKindOfClass:[UIButton class]]) {
        UIButton *button = sender;
        NSLog(@"button title : %@, tag : %ld", [[button titleLabel]text], [button tag]);
    //해당하는 버튼이 아닐 경우
    }else {
        NSLog(@"버튼이아님");
    }
}

//스토리보드의 슬라이드와 액션연결
- (IBAction)sliderValuechanged:(id)sender
{
    if ([sender isKindOfClass:[UISlider class]]) {
        UISlider *slider = sender;
        NSLog(@"slider value : %f", slider.value);
    }
}

//스토리보드의 세그먼트와 액션연결
- (IBAction)segmentaction:(id)sender
{
    if ([sender isKindOfClass:[UISegmentedControl class]]) {
        UISegmentedControl *segment = sender;
        NSLog(@"number : %ld", segment.selectedSegmentIndex);
    }
}

//스토리보드의 텍스트필드와 액션연결
- (IBAction)mytext:(id)sender
{
    if ([sender isKindOfClass:[UITextField class]]) {
        UITextField *textfield = sender;
        NSLog(@"%@", textfield.text);
    }
}

//RGB슬라이더로 인해 뷰색상바꾸기
- (IBAction)slideraction:(id)sender
{
    CGFloat redvalue = self.redslider.value; //빨강슬라이드의 값을 받아온다.
    CGFloat greenvalue = self.greenslider.value; //초록슬라이드의 값을 받아온다.
    CGFloat bluevalue = self.blueslider.value; //파랑슬라이드의 값을 받아온다.
    
    self.changeview.backgroundColor = [UIColor colorWithRed:redvalue    //레드에는 레드값
                                                      green:greenvalue  //초록에는 초록값
                                                       blue:bluevalue   //파랑에는 바랑값
                                                      alpha:1.0f];  //투명도
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
