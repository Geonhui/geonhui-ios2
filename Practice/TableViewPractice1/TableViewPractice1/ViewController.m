//
//  ViewController.m
//  TableViewPractice1
//
//  Created by geon hui kim on 2016. 11. 23..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
<UITableViewDelegate, UITableViewDataSource, UINavigationControllerDelegate>

@property NSMutableArray *mainCell;
@property UITableView *mainTable;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mainTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    [self.mainTable setDelegate:self];
    [self.mainTable setDataSource:self];
    [self.view addSubview:self.mainTable];
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                               target:self
                                                                               action:@selector(addCell)];
    [self.navigationItem setLeftBarButtonItem:addButton];
    
    self.mainCell = [[NSMutableArray alloc] init];
    
    //버전 확인
    NSLog(@"%@", [[UIDevice currentDevice] systemVersion]);
    NSLog(@"%@", [[NSProcessInfo processInfo] operatingSystemVersionString]);
//    NSLog(@"%@", [[[NSProcessInfo processInfo] operatingSystemVersion.]);
    
    //애니메이션
//    [self setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    
}

//세션
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

//셀 추가
- (void)addCell
{
    NSString *add = [NSString stringWithFormat:@"add"];
    [self.mainCell addObject:add];
    
    [self.mainTable reloadData];
}

//로우
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.mainCell.count;
//    return 100;
}

//셀
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    
    if (indexPath.section == 0) {
        
        //0부터 시작하는것을 1부터 시작하도록 수정해야함, 원래 row순서가 0부터 시작한다.
        cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
        //cell 자체의 타입
        [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
        
    }
    return cell;
}

//셀 선택
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *newView = [storyboard instantiateViewControllerWithIdentifier:@"NewViewController"];
    
    [self.navigationController pushViewController:newView animated:YES];
}

//셀높이
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
