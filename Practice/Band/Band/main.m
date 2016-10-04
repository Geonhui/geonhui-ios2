//
//  main.m
//  Band
//
//  Created by geon hui kim on 2016. 9. 20..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//
// 밴드 헤더파일 임포트
#import <Foundation/Foundation.h>
#import "Band.h"

int main(int argc, const char * argv[]) {
// 객체 생성, 객체 초기화
// 프로퍼티 셋팅
// 프로퍼티 값 가져오기
// 메서드 호출
    Band *no1 = [[Band alloc] init];
    no1.bandname = @"건희파";
    no1.username = @"김건희";
    no1.phonenumber = @"01020863648";
    no1.loginid = @"cptcpt123";
    NSLog(@"%@ : %@ : %@ : %@", no1.bandname, no1.username, no1.phonenumber, no1.loginid);
    [no1 connect:no1.bandname why:@"일정을 올려야하기"];
    [no1 serch:no1.bandname];
    [no1 chatting:@"박한서,임형석"];
    [no1 file:@"총각파티일정"
       howmany:@"한번만"];
    [no1 setting:@"알림"];
    
    Band *no2 = [[Band alloc] init];
    no2.bandname = @"한서파";
    no2.username = @"박한서";
    no2.phonenumber = @"0101234568";
    no2.loginid = @"hanseo";
    NSLog(@"%@ : %@ : %@ : %@", no2.bandname, no2.username, no2.phonenumber, no2.loginid);
    [no2 connect:no1.bandname why:@"일정확인과 댓글을 써야하기"];
    [no2 serch:no1.bandname];
    [no2 chatting:@"김건희,임형석"];
    [no2 file:@"댓글" howmany:@"많이"];
    [no2 setting:@"알림,진동"];
    
    Band *no3 = [[Band alloc] init];
    no3.bandname = @"형석파";
    no3.username = @"임형석";
    no3.phonenumber = @"01022223333";
    no3.loginid = @"hyangstone";
    NSLog(@"%@ : %@ : %@ : %@", no3.bandname, no3.username, no3.phonenumber, no3.loginid);
    [no3 connect:no1.bandname why:@"일정을 확인해야하기"];
    [no3 serch:@"건희파"];
    [no3 chatting:@"김건희,박한서"];
    [no3 file:@"여름에 놀러갔던 사진" howmany:@"100장"];
    [no3 setting:@"무음"];
    
    return 0;
}
