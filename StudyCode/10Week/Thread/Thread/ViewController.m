//
//  ViewController.m
//  Thread
//
//  Created by geon hui kim on 2016. 11. 11..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated
{
    //스레드 생성하지 않고 실행
    [self countLog];
    
    //스레드 생성
//    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(countLog) object:nil];
//    [thread start];
}

- (void)countLog
{
    for (NSInteger i=0; i<100000; i++) {
        for (NSInteger j=0; j<1000000; j++) {
            
        }
        NSLog(@"count log %ld",i);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
