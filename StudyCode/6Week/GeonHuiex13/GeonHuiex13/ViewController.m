//
//  ViewController.m
//  GeonHuiex13
//
//  Created by geon hui kim on 2016. 10. 10..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

//UIlabel에 직접적으로 접근할수없기때문에 프로퍼티를 만들어서 접근
@property UILabel *label;
//UIbutton
@property UIButton *beforBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //메인 뷰
    UIView *main = [[UIView alloc]initWithFrame:CGRectMake(15, 15, self.view.frame.size.width - 30, 300)];
    [main setBackgroundColor:[UIColor whiteColor]];
    [main setAlpha:0.8];
    [self.view addSubview:main];
    
    //텍스트
    //버튼선택시 몇번 버튼이 선택되엇는지 표시해주는 라벨
    //위의 프로퍼티도 label이었고 메서드에서 객체도 uilabel이어서 겹침문제 발생 self.label로 수정함
    self.label = [[UILabel alloc]initWithFrame:CGRectMake(0, 150, main.frame.size.width, 30)];
    //[self.label setText:@""];
    [self.label setTextColor:[UIColor blackColor]];
    [self.label setTextAlignment:NSTextAlignmentCenter];
    [main addSubview:self.label];
    
    //버튼 1번
    //nomal 평상시
    //highlighted 눌려있을 경우
    //selected 클릭완료
    UIButton *ok = [UIButton buttonWithType:UIButtonTypeCustom];
    ok.frame = CGRectMake(15, 15, 150, 35);
    [ok setBackgroundColor:[UIColor orangeColor]];
    [ok setTitle:@"1번선택" forState:UIControlStateNormal];
    [ok setTitle:@"1번이 선택되었습니다." forState:UIControlStateHighlighted];
    [ok setTitle:@"선택완료" forState:UIControlStateSelected];
    [ok setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [ok setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    
    ok.titleLabel.font = [UIFont systemFontOfSize:20];
    ok.tag = 1;
    [ok addTarget:self action:@selector(touchUpInsideok:) forControlEvents:UIControlEventTouchUpInside];
    [main addSubview:ok];
    
    //버튼 2번
    UIButton *no = [UIButton buttonWithType:UIButtonTypeCustom];
    no.frame = CGRectMake(170, 15, 150, 35);
    [no setBackgroundColor:[UIColor orangeColor]];
    [no setTitle:@"2번선택" forState:UIControlStateNormal];
    [no setTitle:@"2번이 선택되었습니다." forState:UIControlStateHighlighted];
    [no setTitle:@"선택완료" forState:UIControlStateSelected];
    [no setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [no setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];

    no.titleLabel.font = [UIFont systemFontOfSize:20];
    no.tag = 2;
    [no addTarget:self action:@selector(touchUpInsideok:) forControlEvents:UIControlEventTouchUpInside];
    [main addSubview:no];
    
    //버튼 3번
    UIButton *okok = [UIButton buttonWithType:UIButtonTypeCustom];
    okok.frame = CGRectMake(15, 80, 150, 35);
    [okok setBackgroundColor:[UIColor orangeColor]];
    [okok setTitle:@"3번선택" forState:UIControlStateNormal];
    [okok setTitle:@"3번이 선택되었습니다." forState:UIControlStateHighlighted];
    [okok setTitle:@"선택완료" forState:UIControlStateSelected];
    [okok setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [okok setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    
    okok.titleLabel.font = [UIFont systemFontOfSize:20];
    okok.tag = 3;
    [okok addTarget:self action:@selector(touchUpInsideok:) forControlEvents:UIControlEventTouchUpInside];
    [main addSubview:okok];

    //버튼 4번
    UIButton *nono = [UIButton buttonWithType:UIButtonTypeCustom];
    nono.frame = CGRectMake(170, 80, 150, 35);
    [nono setBackgroundColor:[UIColor orangeColor]];
    [nono setTitle:@"4번선택" forState:UIControlStateNormal];
    [nono setTitle:@"4번이 선택되었습니다." forState:UIControlStateHighlighted];
    [nono setTitle:@"선택완료" forState:UIControlStateSelected];
    [nono setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [nono setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    
    nono.titleLabel.font = [UIFont systemFontOfSize:20];
    nono.tag = 4;
    [nono addTarget:self action:@selector(touchUpInsideok:) forControlEvents:UIControlEventTouchUpInside];
    [main addSubview:nono];
}

////버튼누를때마다 해당버튼 눌림 표시
//- (void)touchUpInsideok:(UIButton *)sender
//    {   //버튼마다 지정된 태그값을 받아 온다.
//        NSInteger tagValue = sender.tag;
//        if (sender.selected) {
//            //버튼을 누르지 안았을때
//            sender.selected = NO;
//        }else {
//            //버튼을 눌렀을때
//            sender.selected = YES;
//        }
//        //
//        [self.label setText:[NSString stringWithFormat:@"%ld번 입니다.", sender.tag]];
//        NSLog(@"버튼클릭완료");
//    }

//버튼누르면 해당버튼눌렀다는 표시와 해제할경우 이전상태로 표시해줌
- (void)touchUpInsideok:(UIButton*)sender
{    //샌더의 셀렉티드 일때
     if(sender.selected) {
     //sender.selected에 NO값을 넣어준다.
     sender.selected = NO;
     //self.beforBtn에 nil값을 넣어준다.
     self.beforBtn = nil;
     //self.label.text에 문자를 입력해준다.
     self.label.text = @"버튼클릭전입니다.";
     }else {
     //self.beforBtn.selected에 NO값을 넣어준다.
     self.beforBtn.selected = NO;
     //text객체에 sender.titlelabel.text를 넣어준다.
     NSString *text = sender.titleLabel.text;
     //self.label.text에 text를 넣어준다.
     self.label.text = text;
     //sender.selected를 yes로 바꾼다.
     sender.selected = YES;
     //self.beforBtn에 sender값을 넣어준다.
     self.beforBtn = sender;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
   }


@end
