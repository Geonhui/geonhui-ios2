//
//  ViewController.m
//  GestureRecognizer
//
//  Created by geon hui kim on 2016. 10. 27..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

//클릭한 횟수, 클릭한 좌표값 라벨 프로퍼티
@property (weak, nonatomic) IBOutlet UILabel *pointcount;
@property (weak, nonatomic) IBOutlet UILabel *pointposition;

//클릭된 횟수를 알기위해 프로퍼티 생성
@property NSInteger tap;

@end

@implementation ViewController

//tap gesture ricogniger 메서드
- (IBAction)tapgesture:(id)sender
{
    //클릭한 횟수
    self.tap += 1;
    self.pointcount.text = [NSString stringWithFormat:@"%ld",self.tap];
    
    //클릭한 좌표값
    CGPoint pointposition = [sender locationInView:self.view];
    NSString *positionValue = [NSString stringWithFormat:@"%lf , %lf", pointposition.x, pointposition.y];
    self.pointposition.text = positionValue;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //tap이란 프로퍼티 값을 0으로 초기화 시켜준다.
    self.tap = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
