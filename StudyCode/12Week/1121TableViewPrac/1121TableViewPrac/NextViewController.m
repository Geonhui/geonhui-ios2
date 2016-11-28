//
//  NextViewController.m
//  1121TableViewPrac
//
//  Created by Dabu on 2016. 11. 21..
//  Copyright © 2016년 Dabu. All rights reserved.
//

#import "NextViewController.h"
#import "NextViewCell.h"

@interface NextViewController () <UITableViewDelegate, UITableViewDataSource>

@property UILabel *textLabel;
@property (weak, nonatomic) IBOutlet UITableView *nextTable;
@property UIImage *tempImage;

@end

@implementation NextViewController


#pragma mark - View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self downloadToGoogleImage];
    [self createViews];
    [self setSubViewLayout];
    
    [[NSNotificationCenter defaultCenter] addObserver:self.nextTable selector:@selector(reloadData) name:@"tableDataChanged" object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Custom Method

- (void)downloadToGoogleImage {
    
    NSString *urlString = @"http://wktvusa.com/wp-content/uploads/2013/01/%EB%B0%95%EA%B7%BC%ED%98%9C1.jpg";
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSURLSessionTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
       
        if (!data) {
            NSLog(@"error");
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
           
            _tempImage = [UIImage imageWithData:data];
//            [_nextTable reloadData];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"tableDataChanged" object:nil];
        });
    }];
    [task resume];
}

- (void)createViews {
    
    [self.navigationItem setTitle:_dataString];
    [self.view setBackgroundColor:[UIColor whiteColor]];
//    [self.view addSubview:self.textLabel];
}

- (void)setSubViewLayout {
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                  forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.view.backgroundColor = [UIColor clearColor];
    
}

#pragma mark - Table View Delegate Method

#pragma mark - Table View DataSource Method

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NextViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CustomCell" forIndexPath:indexPath];
    cell.teamTitle.text = [NSString stringWithFormat:@"%ld", indexPath.row];
    [cell.imageView setContentMode:UIViewContentModeScaleAspectFit];
    cell.cellImage.image = _tempImage;
    
    return cell;
    
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
