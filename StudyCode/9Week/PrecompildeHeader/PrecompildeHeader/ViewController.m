//
//  ViewController.m
//  PrecompildeHeader
//
//  Created by geon hui kim on 2016. 10. 31..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "ViewController.h"
//#import "MySingleturn.h" pch파일에 따로 정의되어있기 때문에 따로 적어줄 필요가 없다.

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //prefixheader.pch파일에 지정해 놓으면 어떤 구현파일에서든 사용이 가능하다.
    [[MySingleturn sharedInstance] justMethod];
    NSLog(@"%@", MyName);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
