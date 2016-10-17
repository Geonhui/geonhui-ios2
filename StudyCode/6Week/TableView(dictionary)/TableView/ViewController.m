//
//  ViewController.m
//  TableView
//
//  Created by geon hui kim on 2016. 10. 13..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
<UITableViewDelegate, UITableViewDataSource>
@property NSArray *carName;
@property NSArray *animerName;
@property NSArray *animerph;
@property NSArray *animerph2;
@property NSArray *info;
@property NSArray *info2;

@property NSArray *information;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //배열(테이블뷰) > 딕셔너리(헤더) > 배열(셀)
    self.information = @[@{@"title":@"자동차",@"name":@[@"마칸",@"레인지로버",@"미니쿠퍼"],
                                            @"detail":@[@"포르쉐",@"랜드로버",@"미니"],
                                            @"image":@[@"bear.jpg",@"cockatoo",@"pig.jpg"]},
                         @{@"title":@"동물",@"name":@[@"돼지",@"개",@"고양이"],
                                           @"detail":@[@"꿀꿀",@"멍멍",@"냐옹"],
                                           @"image":@[@"dog.jpg",@"donkey.jpg",@"duck.jpg"]}];
    
//    self.carName = @[@"짬카", @"시발차", @"두돈반"];
//    self.animerName = @[@"돼지", @"개", @"새"];
//    self.animerph = @[@"bear.jpg",@"cockatoo.jpg",@"pig.jpg"];
//    self.animerph2 = @[@"dog.jpg",@"donkey.jpg",@"duck.jpg"];
//    self.info = @[@"더러움",@"???",@"군용"];
//    self.info2 = @[@"꿀꿀",@"멍멍",@"짹짹"];
    
    //테이블 뷰 객체 생성, 초기화
    UITableView *tap = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)style:UITableViewStyleGrouped];
    tap.dataSource = self;  //datasource와 프로토콜 연결
    tap.delegate = self;    //delegate와 프로토콜 연결
    [self.view addSubview:tap];
}

//표현할 데이터의 총세션의 갯수
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

//표현할 데이터에서 하나의 세션에 있는 로우의 갯수
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return self.carName.count;
    }else {
        return self.animerName.count;
    }
}

//셀 만들기
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    if (indexPath.section == 0) {
        //셀에 이름넣기
        cell.textLabel.text = self.carName[indexPath.row];
        //셀의 이름의 설명
        cell.detailTextLabel.text = self.info[indexPath.row];
        //셀의 이미지
        cell.imageView.image = [UIImage imageNamed:self.animerph[indexPath.row]];
        //셀의 악세사리
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }else {
       cell.textLabel.text = self.animerName[indexPath.row];
       cell.imageView.image = [UIImage imageNamed:self.animerph2[indexPath.row]];
    }return cell;
}

//셀 높이
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

//세션에 헤더넣기
- (NSString *)tableView: (UITableView *)tableView titleForHeaderInSection: (NSInteger)section
{
    if (section == 0) {
       return [NSString stringWithFormat: @"자동차"];
    }else {
       return [NSString stringWithFormat: @"동물"];
    }
}

//셀눌렀을 경우 팝업창 띄우기
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
    UIAlertController *control = [UIAlertController alertControllerWithTitle:self.carName[indexPath.row]
                                                                     message:self.info[indexPath.row]
                                                              preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *btn = [UIAlertAction actionWithTitle:@"확인" style:UIAlertActionStyleCancel handler:nil];
    [control addAction:btn];
    [self presentViewController:control animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
    
@end
