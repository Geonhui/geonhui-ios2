//
//  ViewController.m
//  GeonHuiex9
//
//  Created by geon hui kim on 2016. 9. 29..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //15간격의 제일처음 사각형
    //좌표, 크기
    //cgrectmake는 x, y, wideth, height x,y 좌표값은 15이고, 사이즈는 첫번째뷰에서 x,y간격을 15로 하라 (양쪽으로 -30)
//    UIView *newView = [[UIView alloc] initWithFrame:CGRectMake(15, 15, self.view.frame.size.width -30, self.view.frame.size.height -30)];
//    //배경의 색깔은 초록색이다
//    newView.backgroundColor = [UIColor greenColor];
//    //배경의 투명도는 0.8이다.
//    newView.alpha = 0.8;
//    //self.view안에 newview를 만들겟다.
//    [self.view addSubview:newView];
//    //15간격의 그다음 사각형
//    UIView *newSubView = [[UIView alloc] initWithFrame:CGRectMake (15, 15, self.view.frame.size.width -60, self.view.frame.size.height -60)];
//    newSubView.backgroundColor = [UIColor blackColor];
//    newSubView.alpha = 0.9;
//    [newView addSubview:newSubView];
//    //15간격의 그다음다음 사각형
//    UIView *newDoubleView = [[UIView alloc] initWithFrame:CGRectMake(15, 15, self.view.frame.size.width -90, self.view.frame.size.height -90)];
//    newDoubleView.backgroundColor = [UIColor yellowColor];
//    newDoubleView.alpha = 0.9;
//    [newSubView addSubview:newDoubleView];
    
    
    //사각형의 네 변에 각 띠를 두른다.
    //핸드폰의 정가운데 센터를 모르기때문에 뷰의 가로세로 넓이의 나누기 2를 해주면 센터를 잡을수있다.
    //센터에서 도형을 만들면 센터를 기준으로 도형이 만들어지기 때문에 도형의 센터를 옮겨주어야 한다. 크기만큼의 반을 x,y값을 바꿔준다.
//    UIView *center = [[UIView alloc]initWithFrame:CGRectMake(50, self.view.frame.size.height /2 - 100,
//                                                             self.view.frame.size.width -100, 200)];
//    center.backgroundColor = [UIColor blackColor];
//    center.alpha = 1;
//    [self.view addSubview:center];
//    //사각형의 위의 파란띠
//    UIView *blue = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width -100, 20)];
//    blue.backgroundColor = [UIColor blueColor];
//    blue.alpha = 1;
//    [center addSubview:blue];
//    //사각형의 아래의 초록띠
//    UIView *green = [[UIView alloc]initWithFrame:CGRectMake(0, 200, self.view.frame.size.width -100, 20)];
//    green.backgroundColor = [UIColor greenColor];
//    green.alpha = 1;
//    [center addSubview:green];
//    //사각형의 좌측의 빨간띠
//    UIView *red = [[UIView alloc]initWithFrame:CGRectMake(0, 20, 20, 180)];
//    red.backgroundColor = [UIColor redColor];
//    red.alpha = 1;
//    [center addSubview:red];
//    사각형의 우측의 노랑띠
//    UIView *yellow = [[UIView alloc]initWithFrame:CGRectMake(self.view.frame.size.width -120, 20, 20, 180)];
//    yellow.backgroundColor = [UIColor yellowColor];
//    yellow.alpha = 1;
//    [center addSubview:yellow];

    //UILabel
//    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, 20, 100, 35)];
//    [label setText:@"생각이없다."];
//    [label setTextColor:[UIColor redColor]];
//    [label setHighlightedTextColor:[UIColor greenColor]];
//    [label setHighlighted:YES];
//    [label setTextAlignment:NSTextAlignmentCenter];
//    [self.view addSubview:label];
//    
//    UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(200, 40, 100, 35)];
//    [label2 setText:@"왜냐하면"];
//    [label2 setTextColor:[UIColor blueColor]];
//    [label2 setTextAlignment:NSTextAlignmentCenter];
//    [self.view addSubview:label2];
//    
//    UIView *box = [[UIView alloc]initWithFrame:CGRectMake(20, 80, 200, 200)];
//    box.backgroundColor = [UIColor blackColor];
//    box.alpha = 1;
//    [self.view addSubview:box];
//    
//    UILabel *label3 = [[UILabel alloc]initWithFrame:CGRectMake(100, 150, 100, 35)];
//    [label3 setText:@"아무생각이"];
//    [label3 setTextColor:[UIColor whiteColor]];
//    [label3 setTextAlignment:NSTextAlignmentCenter];
//    [box addSubview:label3];
//    
//    UILabel *label4 = [[UILabel alloc]initWithFrame:CGRectMake(100, 280, 100, 35)];
//    [label4 setText:@"없으니깐!"];
//    [label4 setTextColor:[UIColor purpleColor]];
//    [label4 setTextAlignment:NSTextAlignmentCenter];
//    [self.view addSubview:label4];
    
    //UI를 이용해 뷰만들어보기
    //view
//    UIView *newView = [[UIView alloc] initWithFrame:CGRectMake(15, 15, self.view.frame.size.width -30, 300)];
//    newView.backgroundColor = [UIColor greenColor];
//    newView.alpha = 1;
//    [self.view addSubview:newView];
    
    //box1
    //좌측상단 박스에 뷰, 이미지, 라벨넣기
    //뷰
//    UIView *box1 = [[UIView alloc]initWithFrame:CGRectMake(10, 10, newView.frame.size.width /2 - 20,
//                                                                   130)];
//    box1.backgroundColor = [UIColor blackColor];
//    box1.alpha = 1;
//    [newView addSubview:box1];
//    //이미지뷰
//    UIImageView *image1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, box1.frame.size.width, 100)];
//    image1.image = [UIImage imageNamed:@"람보르기니.jpg"];
//    [image1 setContentMode:UIViewContentModeScaleToFill];
//    [box1 addSubview:image1];
//    //라벨
//    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(10, 100, 100, 30)];
//    label1.text = @"1000클릭";
//    label1.textColor = [UIColor redColor];
//    label1.textAlignment = NSTextAlignmentCenter;
//    [box1 addSubview:label1];
    
    //box2
    //우측상단 박스에 뷰, 이미지, 라벨넣기
//    UIView *box2 = [[UIView alloc]initWithFrame:CGRectMake(newView.frame.size.width /2 + 10, 10,
//                                                           newView.frame.size.width /2 - 20,
//                                                           130)];
//    box2.backgroundColor = [UIColor blackColor];
//    box2.alpha = 1;
//    [newView addSubview:box2];
//    UIImageView *image2 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, box2.frame.size.width, 100)];
//    image2.image = [UIImage imageNamed:@"오토바이.jpg"];
//    [image2 setContentMode:UIViewContentModeScaleToFill];
//    [box2 addSubview:image2];
//    UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(10, 100, 100, 30)];
//    label2.text = @"무한클릭";
//    label2.textColor = [UIColor redColor];
//    label2.textAlignment = NSTextAlignmentCenter;
//    [box2 addSubview:label2];
    
    //box3
    //좌측하단 박스에 뷰, 이미지, 라벨넣기
//    UIView *box3 = [[UIView alloc]initWithFrame:CGRectMake(10, 160, newView.frame.size.width /2 - 20,
//                                                           130)];
//    box3.backgroundColor = [UIColor blackColor];
//    box3.alpha = 1;
//    [newView addSubview:box3];
//    UIImageView *image3 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, box3.frame.size.width, 100)];
//    image3.image = [UIImage imageNamed:@"포드.jpg"];
//    [image3 setContentMode:UIViewContentModeScaleToFill];
//    [box3 addSubview:image3];
//    UILabel *label3 = [[UILabel alloc]initWithFrame:CGRectMake(10, 100, 100, 30)];
//    label3.text = @"8000클릭";
//    label3.textColor = [UIColor redColor];
//    label3.textAlignment = NSTextAlignmentCenter;
//    [box3 addSubview:label3];
    
    //box4
    //우측하단 박스에 뷰, 이미지, 라벨넣기
//    UIView *box4 = [[UIView alloc]initWithFrame:CGRectMake(newView.frame.size.width /2 +10, 160,
//                                                           newView.frame.size.width /2 - 20,
//                                                           130)];
//    box4.backgroundColor = [UIColor blackColor];
//    box4.alpha = 1;
//    [newView addSubview:box4];
//    UIImageView *image4 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, box4.frame.size.width, 100)];
//    image4.image = [UIImage imageNamed:@"포르쉐.jpg"];
//    [image4 setContentMode:UIViewContentModeScaleToFill];
//    [box4 addSubview:image4];
//    UILabel *label4 = [[UILabel alloc]initWithFrame:CGRectMake(10, 100, 100, 30)];
//    label4.text = @"5000클릭";
//    label4.textColor = [UIColor redColor];
//    label4.textAlignment = NSTextAlignmentCenter;
//    [box4 addSubview:label4];
    
    //box5
//    UIView *box5 = [[UIView alloc]initWithFrame:CGRectMake(15, 340, self.view.frame.size.width -30, 100)];
//    box5.backgroundColor = [UIColor blackColor];
//    box5.alpha = 1;
//    [self.view addSubview:box5];
//    UILabel *label5 = [[UILabel alloc]initWithFrame:CGRectMake(box5.frame.size.width /2 , 0, 100, 100)];
//    label5.text = @"횟수 : 0회";
//    label5.textColor = [UIColor whiteColor];
//    label5.textAlignment = NSTextAlignmentRight;
//    [box5 addSubview:label5];
    
    //box6
//    UIView *box6 = [[UIView alloc]initWithFrame:CGRectMake(15, 460, self.view.frame.size.width -30, 100)];
//    box6.backgroundColor = [UIColor blackColor];
//    box6.alpha = 1;
//    [self.view addSubview:box6];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
