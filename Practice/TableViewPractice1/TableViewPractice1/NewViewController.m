//
//  NewViewController.m
//  TableViewPractice1
//
//  Created by geon hui kim on 2016. 11. 25..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "NewViewController.h"

@interface NewViewController ()
<UITableViewDelegate, UITableViewDataSource>

@end

@implementation NewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //__line__, __funcion__ 파일위치나 펑션위치등으로 로그로 찍어볼수있다.
    
    UITableView *subTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];

    [subTable setDelegate:self];
    [subTable setDataSource:self];
    [self.view addSubview:subTable];
    
//    [self.navigationController setNavigationBarHidden:YES];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {

        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
        
        cell.textLabel.text = @"So Sirius";
        cell.textLabel.textColor = [UIColor orangeColor];
        cell.imageView.image = [UIImage imageNamed:@"조커2.jpg"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.backgroundColor = [UIColor blackColor];
        cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
