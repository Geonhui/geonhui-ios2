//
//  ViewController.m
//  TableTest
//
//  Created by geon hui kim on 2016. 10. 23..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
<UITableViewDelegate, UITableViewDataSource>


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //테이블뷰 생성
    //큰 테이블뷰 위에 또 테이블뷰를 올려서 나눠야 하는건가?
    //인스타 참조
    UITableView *tableview1 = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 100) style:UITableViewStyleGrouped];
    [tableview1 setDelegate:self];
    [tableview1 setDataSource:self];
    [self.view addSubview:tableview1];
    
    UIImageView *image1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, tableview1.frame.size.width, tableview1.frame.size.height)];
    image1.image = [UIImage imageNamed:@"메인이미지.jpg"];
    [tableview1 addSubview:image1];
    
}

//세션 갯수
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

//세션안의 로우갯수
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

//셀 만들기
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
    }return cell;
}

//셀 높이
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

//


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
