//
//  ViewController.m
//  UITableview2
//
//  Created by geon hui kim on 2016. 10. 14..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "ViewController.h"
#import "IdolCell.h" //delegate로 사용하기때문에 import해 주어야한다.

@interface ViewController ()
<UITableViewDelegate,UITableViewDataSource> //프로토콜

@property UITableView *tvView;
@property NSArray *dataList;

@end

@implementation ViewController

//
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //bounds 자체가 cgrect를 담고있음
    self.tvView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tvView.delegate = self;
    self.tvView.dataSource = self;
    [self.view addSubview:self.tvView];
    
    //데이터
    self.dataList = @[@{@"title":@"A컵",@"image":@"a컵.jpg"},
                      @{@"title":@"B컵",@"image":@"b컵.jpg"},
                      @{@"title":@"C컵",@"image":@"c컵.jpg"},
                      @{@"title":@"D컵",@"image":@"d컵.jpg"},
                      @{@"title":@"E컵",@"image":@"e컵.jpg"}];
}

//세션만들기
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataList.count;
}

//셀만들기
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld",indexPath.row);
    //셀이 있을경우 큐에서 꺼내라
    IdolCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    //셀이 없을경우 셀을 생성
    if(cell == nil){
        cell = [[IdolCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    //data딕셔너리에 datalist의 딕셔너리를 가져옴
    NSDictionary *data = self.dataList[indexPath.row];
    //셀의 배경에는 딕셔너리의 image
    //셀의 타이틀에는 딕셔너리의 title
    [cell setBackgroundView:[data objectForKey:@"image"]];
    [cell setTitle:[data objectForKey:@"title"]];
    
    //cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    
    return cell;
}

//셀의 높이
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //return self.view.frame.size.height;
    return 100;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
