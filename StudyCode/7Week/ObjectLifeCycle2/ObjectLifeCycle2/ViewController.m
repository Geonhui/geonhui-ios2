//
//  ViewController.m
//  ObjectLifeCycle2
//
//  Created by geon hui kim on 2016. 10. 20..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

//뷰를 실행을 시켰을때 한번만 호출됨
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"인스턴스화 된 직후 호출");
}

//앱을 실행시켰고 메인 화면으로 들어가기전 뷰가 보이지 직전에 호출됨
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"뷰가 화면이 보여지기 직전에 호출");
}

//
- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    NSLog(@"뷰의 하위뷰들의 레이아웃이 결정되기 직전 호출");
}

//
- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    NSLog(@"뷰의 하위뷰들의 레이아웃이 결정된 후 호출");
}

//지정한 뷰가 보여진 직후에 호출됨
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"뷰가 화면에 보여진 직후에 호출");
}

//지금 있는 뷰가 해제되기 직전에 호출됨
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    NSLog(@"뷰가 화면에서 사라지기 직전에 호출");
}

//지금 있는 뷰가 화면에서 사라질때 호출됨
- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    NSLog(@"뷰가 화면에서 사라진 직후에 호출");
}

//메모리 관리
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
