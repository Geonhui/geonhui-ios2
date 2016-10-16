//
//  ViewController.m
//  UITableview2
//
//  Created by geon hui kim on 2016. 10. 14..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "ViewController.h"
#import "IdolCell.h"

@interface ViewController ()
<UITableViewDelegate,UITableViewDataSource>

@property UITableView *tvView;
@property NSArray *dataList;

@end

@implementation ViewController
//
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tvView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tvView.delegate = self;
    self.tvView.dataSource = self;
    [self.view addSubview:self.tvView];
    
    self.dataList = @[@{@"title":@"A컵",@"imageURL":@"a컵.jpg"},
                      @{@"title":@"B컵",@"imageURL":@"b컵.jpg"},
                      @{@"title":@"C컵",@"imageURL":@"c컵.jpg"},
                      @{@"title":@"D컵",@"imageURL":@"d컵.jpg"},
                      @{@"title":@"E컵",@"imageURL":@"e컵.jpg"}];
}

//
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataList.count;
}

//
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"%ld",indexPath.row);
    
    IdolCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if(cell == nil){
        cell = [[IdolCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    NSDictionary *data = self.dataList[indexPath.row];
    
    [cell setBackgroundView:[data objectForKey:@"imageURL"]];
    [cell setTitle:[data objectForKey:@"title"]];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    
    return cell;
}

//
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.view.frame.size.height;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
