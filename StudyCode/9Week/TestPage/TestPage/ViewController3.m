//
//  ViewController3.m
//  TestPage
//
//  Created by geon hui kim on 2016. 11. 2..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "ViewController3.h"
#import "ViewController.h"
#import "ViewController2.h"

@interface ViewController3 ()
<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UILabel *changethelabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageview3;

@end

@implementation ViewController3

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //아이디에 따른 라벨 변경
    self.changethelabel.text = [NSString stringWithFormat:@"user id : %@",[[NSUserDefaults standardUserDefaults] objectForKey:@"id"]];
    
    UITableView *table = [[UITableView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    [table setDelegate:self];
    [table setDataSource:self];
    [self.imageview3 addSubview:table];
    
}

- (IBAction)logout:(id)sender
{
    //메인으로 화면전환
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc1 = [storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    [self.navigationController pushViewController:vc1 animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
