//
//  ViewController.m
//  DataSave
//
//  Created by geon hui kim on 2016. 11. 7..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //파일불러오기
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *bastpaths = [paths objectAtIndex:0];
    
    NSString *docupath = [bastpaths stringByAppendingPathComponent:@"파일이름"];

    //document folder에 파일 있는지 확인
    NSFileManager *filemanager = [NSFileManager defaultManager];
    if (![filemanager fileExistsAtPath:docupath])
    {
        //bundle에 있는 파일 document에 복사
        NSString *bundlepath = [[NSBundle mainBundle] pathForResource:@"파일이름" ofType:@"파일타입"];
        [filemanager copyItemAtPath:bundlepath toPath:docupath error:nil];
    }
    
    //파일 path를 통해 객체로 변환, 데이터 불러오기
    //docupath에는 파일이 존재한다!!!
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:docupath];
    
    //writh to file메소드를 통해 파일 저장
    //저장
    [dic writeToFile:docupath atomically:NO];
    //데이터 변경
    //[dic setObject:추가데이터 forkey:키값];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
