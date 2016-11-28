//
//  ViewController.m
//  1121TableViewPrac
//
//  Created by Dabu on 2016. 11. 21..
//  Copyright © 2016년 Dabu. All rights reserved.
//

#import "ViewController.h"
#import "NextViewController.h"
#import "CustomCell.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property UITableView *mainTable;
@property NSMutableArray *tableViewDataList;
@property NSInteger count;

@end

@implementation ViewController


#pragma mark - ViewLife Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createView];
    [self settingLayout];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Cutstom 

- (void)createView {
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height/5)];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"모듬튀김.jpg"]];
    [imageView setFrame:headerView.frame];
    [imageView setContentMode:UIViewContentModeScaleAspectFit];
    [headerView addSubview:imageView];
    
    UITableView *mainTableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.mainTable = mainTableView;
    [mainTableView setDelegate:self];
    [mainTableView setDataSource:self];
    [mainTableView setTableHeaderView:headerView];
    
    
    [self.view addSubview:mainTableView];
    
}

- (void)settingLayout {
    
    UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(onTouchAddButton:)];
    [self.navigationItem setLeftBarButtonItem:leftBarButton];
    
    self.tableViewDataList = [NSMutableArray array];
    
}

#pragma mark - Button Method

- (void)onTouchAddButton:(UIBarButtonItem *)sender {
    
    NSDateFormatter *today = [[NSDateFormatter alloc] init];
    [today setDateFormat:@"dd일 hh시 mm분 ss초"];
    
    [self.tableViewDataList addObject:[today stringFromDate:[NSDate date]]];
    [self.mainTable reloadData];
    
}

#pragma mark - TableView Delegate Method

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    NextViewController *nextVC = [story instantiateViewControllerWithIdentifier:@"NextVC"];
    [nextVC setDataString:[tableView cellForRowAtIndexPath:indexPath].textLabel.text];
    [self.navigationController pushViewController:nextVC animated:YES];
    [[tableView cellForRowAtIndexPath:indexPath] setSelected:NO animated:YES];
}

#pragma mark - TableView DataSource Method

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.tableViewDataList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = [[CustomCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }

    [cell.textLabel setText:[NSString stringWithFormat:@"%@", self.tableViewDataList[indexPath.row]]];
    [cell.imageView setImage:[UIImage imageNamed:@"페라리.png"]];
    [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
    
    return cell;
}

@end
