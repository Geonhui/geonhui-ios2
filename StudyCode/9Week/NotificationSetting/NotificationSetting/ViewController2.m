//
//  ViewController2.m
//  NotificationSetting
//
//  Created by geon hui kim on 2016. 11. 1..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()
@property (weak, nonatomic) IBOutlet UILabel *previewlaber;
@property (weak, nonatomic) IBOutlet UISlider *pink;
@property (weak, nonatomic) IBOutlet UISlider *orange;
@property (weak, nonatomic) IBOutlet UISlider *oldgreen;
@property (weak, nonatomic) IBOutlet UISegmentedControl *fontsize;

@end

@implementation ViewController2
- (IBAction)adjustslider:(id)sender
{
    CGFloat pinkvalue = self.pink.value;
    CGFloat orangevalue = self.orange.value;
    CGFloat oldgreenvalue = self.oldgreen.value;
    
    [self.previewlaber setTextColor:[UIColor colorWithRed:pinkvalue
                                                    green:orangevalue
                                                     blue:oldgreenvalue
                                                    alpha:1.f]];
}

- (IBAction)adjustsize:(id)sender
{
    
    switch (self.fontsize.selectedSegmentIndex) {
        case 0:
            [self.previewlaber setFont:[UIFont systemFontOfSize:30]];
            break;
        case 1:
            [self.previewlaber setFont:[UIFont systemFontOfSize:40]];
            break;
        case 2:
            [self.previewlaber setFont:[UIFont systemFontOfSize:50]];
            break;
        default:
            break;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
