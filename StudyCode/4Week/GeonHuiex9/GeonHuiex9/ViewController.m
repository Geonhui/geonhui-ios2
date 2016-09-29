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
    UIView *newView = [[UIView alloc] initWithFrame:CGRectMake(15, 15, self.view.frame.size.width -30, self.view.frame.size.height -30)];
    //배경의 색깔은 초록색이다
    newView.backgroundColor = [UIColor greenColor];
    //배경의 투명도는 0.8이다.
    newView.alpha = 0.8;
    //self.view안에 newview를 만들겟다.
    [self.view addSubview:newView];
    //15간격의 그다음 사각형
    UIView *newSubView = [[UIView alloc] initWithFrame:CGRectMake (15, 15, self.view.frame.size.width -60, self.view.frame.size.height -60)];
    newSubView.backgroundColor = [UIColor blackColor];
    newSubView.alpha = 0.9;
    [newView addSubview:newSubView];
    //15간격의 그다음다음 사각형
    UIView *newDoubleView = [[UIView alloc] initWithFrame:CGRectMake(15, 15, self.view.frame.size.width -90, self.view.frame.size.height -90)];
    newDoubleView.backgroundColor = [UIColor yellowColor];
    newDoubleView.alpha = 0.9;
    [newSubView addSubview:newDoubleView];
    
    
    //사각형의 네 변에 각 띠를 두른다.
    //핸드폰의 정가운데 센터를 모르기때문에 뷰의 가로세로 넓이의 나누기 2를 해주면 센터를 잡을수있다.
    //센터에서 도형을 만들면 센터를 기준으로 도형이 만들어지기 때문에 도형의 센터를 옮겨주어야 한다. 크기만큼의 반을 x,y값을 바꿔준다.
    UIView *center = [[UIView alloc]initWithFrame:CGRectMake(50, self.view.frame.size.height /2 - 100,
                                                             self.view.frame.size.width -100, 200)];
    center.backgroundColor = [UIColor blackColor];
    center.alpha = 1;
    [self.view addSubview:center];
    //사각형의 위의 파란띠
    UIView *blue = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width -100, 20)];
    blue.backgroundColor = [UIColor blueColor];
    blue.alpha = 1;
    [center addSubview:blue];
    //사각형의 아래의 초록띠
    UIView *green = [[UIView alloc]initWithFrame:CGRectMake(0, 200, self.view.frame.size.width -100, 20)];
    green.backgroundColor = [UIColor greenColor];
    green.alpha = 1;
    [center addSubview:green];
    //사각형의 좌측의 빨간띠
    UIView *red = [[UIView alloc]initWithFrame:CGRectMake(0, 20, 20, 180)];
    red.backgroundColor = [UIColor redColor];
    red.alpha = 1;
    [center addSubview:red];
    //사각형의 우측의 노랑띠
    UIView *yellow = [[UIView alloc]initWithFrame:CGRectMake(self.view.frame.size.width -120, 20, 20, 180)];
    yellow.backgroundColor = [UIColor yellowColor];
    yellow.alpha = 1;
    [center addSubview:yellow];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
