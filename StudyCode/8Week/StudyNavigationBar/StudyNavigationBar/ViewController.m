//
//  ViewController.m
//  StudyNavigationBar
//
//  Created by geon hui kim on 2016. 10. 25..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic) UITabBarController * tap;

@property (weak, nonatomic) IBOutlet UITabBarItem *yellowtab;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //navigation custom버튼
    UIButton *itemBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [itemBtn addTarget:self action:@selector(onSelectedBtnItem:) forControlEvents:UIControlEventTouchUpInside];
    [itemBtn setFrame:CGRectMake(0, 0, 100, 44)];
    [itemBtn setTitle:@"custum" forState:UIControlStateNormal];
    [itemBtn setTintColor:[UIColor whiteColor]];
    [itemBtn setBackgroundColor:[UIColor redColor]];
    
    //uibarbuttonitem에 집어 넣는다는 말
    UIBarButtonItem *citem = [[UIBarButtonItem alloc]initWithCustomView:itemBtn];
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithTitle:@"hihi"
                                                            style:UIBarButtonItemStylePlain
                                                           target:self
                                                           action:@selector(onSelectedItem)];
    //우측 네비게이션 아이템
    self.navigationItem.rightBarButtonItem = item;
    //좌측 네비게이션 아이템
    self.navigationItem.leftBarButtonItem = citem;
    
    //스토리보드에서 탭바를 생성후 버튼을 커스텀으로 바꾼다
    UIImage *changeimage = [UIImage imageNamed:@"동물"];
    UITabBarItem *changeTabBarItem = [[UITabBarItem alloc]initWithTitle:@"동물" image:changeimage tag:0];
    self.yellowtab = changeTabBarItem;
    self.tabBarItem = self.yellowtab;
}

//커스텀버튼 액션 메서드
- (void)onSelectedBtnItem:(UIBarButtonItem *)sender
{
    NSLog(@"custom");
}

//네비게이션지정버튼 액션 메서드
- (void)onSelectedItem:(UIBarButtonItem *)sender
{
    NSLog(@"hihi");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
