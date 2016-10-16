//
//  ViewController.m
//  UITableView1
//
//  Created by geon hui kim on 2016. 10. 14..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
<UITableViewDelegate,UITableViewDataSource>  //프로토콜 연결

@property NSArray *information;  //데이터 어레이 프로퍼티

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //배열(인포메이션,전체) > 딕셔너리(세션) > 배열(로우)
    //세션 : 헤더 - 자동차, 셀 - 이름,상세,이미지
    //얼록 : 타이틀 - bigtitle, 메세지 - shottitle
    //딕셔너리안에 키들 안에 데이터가 있는데 데이터들 배열의 갯수는 모두 같게 정해주어야 한다.
    self.information = @[@{@"title":@"자동차",@"name":@[@"마칸",@"레인지",@"미니"],
                                          @"detail":@[@"포르쉐",@"랜드로버",@"미니"],
                                           @"image":@[@"cockatoo.jpg",@"bear.jpg",@"dog.jpg"],
                                        @"bigtitle":@[@"김건희 자차 List",@"김건희 자차 List",@"김건희 자차 List"],
                                       @"shottitle":@[@"집에갈때 타는차",@"여행갈때 타는차",@"마트갈때 타는차"]},
                         
                         @{@"title":@"동물",@"name":@[@"돼지",@"개",@"고양이"],
                                         @"detail":@[@"꿀꿀",@"멍멍",@"냐옹"],
                                          @"image":@[@"donkey.jpg",@"duck.jpg",@"pig.jpg"],
                                       @"bigtitle":@[@"건희 애완동물 List",@"건희 애완동물 List",@"건희 애완동물 List"],
                                      @"shottitle":@[@"뚱뚱한애",@"귀여운애",@"안키워봐서모르고~"]}];
    //테이블뷰 생성, 초기화
    UITableView *table = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)
                                                     style:UITableViewStyleGrouped];
    table.delegate = self;    // delegate연결
    table.dataSource = self;   //datasorce연결
    [self.view addSubview:table]; //self.view위에 테이블 생성
}

//section 지정 (세션을 지정할수있다, 갯수)
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.information.count; //배열안에 딕셔너리가 있기때문에 딕셔너리가 늘어나게되면 배열도 늘어남 (count는 전체)
}

//header 지정 (세션위의 이름을 지정할수있다.)
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{

    return [self.information[section] objectForKey:@"title"]; //딕셔너리의 title을 가져온다
}

//row 지정 (세션의 열들을 지정해준다, cell갯수)
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

//cell 생성
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //셀이 존재 할 경우 cell이란 큐에서 재사용한다는 말
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    //cell이 nil일 경우 (셀이 없을 경우)
    if (cell == nil) {
        //cell을 생성, 초기화                                        셀스타일을 정할수있다.
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    
    NSDictionary *dic = self.information[indexPath.section]; //dic이란 변수에 self.information
    NSArray *nameArray = [dic objectForKey:@"name"];  //받아온 딕셔너리를 key를 이용해 값들을 nameArray로 저장한다.
    NSArray *detailArray = [dic objectForKey:@"detail"];  //key값을 이용해 값들을 detailArray로 저장한다.
    NSArray *imageArray = [dic objectForKey:@"image"];  //key값을 이용해 값들을 imageArray로 저장한다.
    
    cell.textLabel.text = nameArray[indexPath.row];  //textlabel.text는 셀의 텍스트를 넣을수있다.
    cell.detailTextLabel.text = detailArray[indexPath.row];  //detailtextlabel은 텍스트아래의 상세텍스트를 넣을수있다.
    cell.imageView.image = [UIImage imageNamed:imageArray[indexPath.row]];  //imageview.image는 셀 좌측에 이미지를 넣을수있다.
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;  //accessorytype는 셀 우측에 악세사리를 넣을수있다.
    return cell; //리턴은 셀
}

//셀 눌렀을 경우에 팝업창띄우기
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    NSDictionary *dic1 = self.information[indexPath.section];  //dic1이란 변수에 self.information의 [indexpath.section]을 가져온다, 위의 딕셔너리참조
    NSArray *bigtitleArray = [dic1 objectForKey:@"bigtitle"];  //key값을 이용해서 딕셔너리의 bigtitle을 가져온다.
    NSArray *shottitleArray = [dic1 objectForKey:@"shottitle"]; //key값을 이용해서 딕셔너리의 shottitle를 가져온다.
    
    //alertcontroller - 팝업창 띄울경우 title, message를 지정할수있고, 컨트롤러 스타일도 지정할수있다.
    UIAlertController *pop = [UIAlertController alertControllerWithTitle:bigtitleArray[indexPath.row]
                                                                 message:shottitleArray[indexPath.row]
                                                          preferredStyle:UIAlertControllerStyleAlert];
    //alertaction - 띄운 팝업창에 액션을 준다, title, style, handler를 지정해줄수있다.
    UIAlertAction *popAction = [UIAlertAction actionWithTitle:@"확인" style:UIAlertActionStyleCancel handler:nil];
    [pop addAction:popAction]; //pop이란 controller에 popaction이란 액션시킨다.
    [self presentViewController:pop animated:YES completion:nil]; //controller가 있는 변수, 액션있냐?, 완료후엔
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
