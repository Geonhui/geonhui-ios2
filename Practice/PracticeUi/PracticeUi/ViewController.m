//
//  ViewController.m
//  PracticeUi
//
//  Created by geon hui kim on 2016. 10. 24..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
<UITableViewDelegate, UITableViewDataSource>
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UITableView *tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    tableview.delegate = self;
    tableview.dataSource = self;
    [self.view addSubview:tableview];
    
}

//세션갯수
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

//로우갯수
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

//로우높이
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}

//헤더
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return [NSString stringWithFormat:@"Day 1"];
    }else {
        return [NSString stringWithFormat:@"Day 2"];
    }
}

//셀 만들기
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    if (indexPath.section == 0) {
        cell.textLabel.text = @"카카오톡 캐릭터 ㅎ";
        cell.detailTextLabel.text = @"이 캐릭터는 무지 입니다. \n이 캐릭터는 무지 입니다. \n이 캐릭터는 무지 입니다.";
        cell.imageView.image = [UIImage imageNamed:@"캐릭터_png"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }else {
        cell.textLabel.text = @"카카오톡 캐릭터 ㅋ";
        cell.detailTextLabel.text = @"이 캐릭터는 어피치 입니다. \n이 캐릭터는 어피치 입니다. \n이 캐릭터는 어피치 입니다.";
        cell.imageView.image = [UIImage imageNamed:@"캐릭터_어피치"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    //줄 나누기
    [cell.detailTextLabel setNumberOfLines:0];
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
