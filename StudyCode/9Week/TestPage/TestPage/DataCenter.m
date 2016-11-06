//
//  DataCenter.m
//  TestPage
//
//  Created by geon hui kim on 2016. 11. 2..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "DataCenter.h"

@implementation DataCenter

//싱글턴 만들기(클래스)
+ (instancetype)sharedManger
{
    //datacenter라는 싱글턴을 만든다
    static DataCenter *datacenter = nil;
    
    //dispatch_once_t 딱 한번만 실행
    static dispatch_once_t onceToken;
    
    //static DataCenter *datacenter = nil;가 nil이 아닐경우 싱글턴을 만들기위해 실행
    dispatch_once(&onceToken, ^{
        datacenter = [[self alloc] init];
    });
    return datacenter;
}

//가입데이터
- (BOOL)joinUserID:(NSString *)userID userPW:(NSString *)userPW
{

    NSUserDefaults *userdata = [NSUserDefaults standardUserDefaults];
    [userdata setObject:userID forKey:@"id"];
    [userdata setObject:userPW forKey:@"pw"];
    [userdata synchronize];
    return YES;

}

























//싱글턴 표시
- (void)print
{
    NSLog(@"싱글턴 만들어졌다");
}









@end
