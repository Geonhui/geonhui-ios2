//
//  ViewController.m
//  TableView
//
//  Created by geon hui kim on 2016. 10. 13..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
<UITableViewDelegate, UITableViewDataSource> //프로토콜 연결

@property NSArray *carName;    //자동차 이름 배열
@property NSArray *animerName; //동물 이름 배열
@property NSArray *animerph;   //동물 사진 1 배열
@property NSArray *animerph2;  //동물 사진 2 배열
@property NSArray *info;  //디테일 설명 배열

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
                         
    self.carName = @[@"짬카", @"시발차", @"두돈반"]; //자동차이름 배열 리스트
    self.animerName = @[@"돼지", @"개", @"새"];  //동물이름 배열 리스트
    self.animerph = @[@"bear.jpg",@"cockatoo.jpg",@"pig.jpg"]; //동물사진 배열 리스트
    self.animerph2 = @[@"dog.jpg",@"donkey.jpg",@"duck.jpg"];  //동물사진 배열 리스트
    self.info = @[@"더러움",@"???",@"군용"]; //디테일 설명 배열 리스트
    
    //테이블 뷰 객체 생성, 초기화
    UITableView *tap = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)
                                                   style:UITableViewStyleGrouped]; //스타일은 plain, grouped 두가지가 있다.
    tap.dataSource = self;  //datasource와 프로토콜 연결
    tap.delegate = self;    //delegate와 프로토콜 연결
    [self.view addSubview:tap]; //self.view위에 tap이란 테이블뷰를 올린다.
}

//표현할 데이터의 총세션의 갯수
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2; //세션을 2개를 만든다.
}

//표현할 데이터에서 하나의 세션에 있는 로우(셀)의 갯수
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) { //세션이 0과 같을 경우
        return self.carName.count; //carname에 있는 배열리스트 전부
    }else {  //세션이 0이 아닐경우
        return self.animerName.count; //animername에 있는 배열리스트 전부
    }
}

//셀 만들기
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{   //셀이 있을경우는 "cell"이라는 큐에서 셀을 꺼내서 재사용한다는 말
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) { //셀이 nil일 경우(셀이 없다는말)
        //셀 생성, 초기화, 스타일 - subtitle이란 스타일, 재사용식별자 - "cell"이라는 큐
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    if (indexPath.section == 0) { //indexpath.section이 0일 경우(화면에서 제일 처음 세션에 들어갈때)
       cell.textLabel.text = self.carName[indexPath.row]; //셀에 텍스트를 넣을경우 = [indexpath.row]는 세션말고 로우(셀)에 들어갈 텍스트
       cell.detailTextLabel.text = self.info[indexPath.row]; //셀에 디테일텍스트를 넣을경우 = 위와 동일
       cell.imageView.image = [UIImage imageNamed:self.animerph[indexPath.row]]; //셀에 이미지를 넣을경우 = 이미지를 넣을 경우는[uiimage imagenamed:]사용
    }else { //indexpath.section이 0이 아닐경우
       cell.textLabel.text = self.animerName[indexPath.row]; //셀의 텍스트에 동물이름을 넣어줌
       cell.imageView.image = [UIImage imageNamed:self.animerph2[indexPath.row]]; //셀의 이미지에는 동물사진2를 넣어줌
    }return cell;
}

//셀 높이(셀의 높이를 조절할수있다.)
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60; //(높이값 60)
}

//세션에 헤더넣기
- (NSString *)tableView: (UITableView *)tableView titleForHeaderInSection: (NSInteger)section
{   //세션이 0일 경우
    if (section == 0) {
       return @"자동차";//[NSString stringWithFormat: @"자동차"]; //문자 "자동차"를 넣어줌, 방법이 2가지
    }else {//세션이 0이 아닐 경우
       return @"동물";//[NSString stringWithFormat: @"동물"]; //문자 "동물"을 넣어줌, 방법이 2가지
    }//       방법 1                  방법 2
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
