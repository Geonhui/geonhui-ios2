//
//  main.m
//  FormatSpecifier
//
//  Created by geon hui kim on 2016. 9. 21..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {


    // 형식 지정자
    // 형식지정자 찾아보기
    // %-5ld
    // %5ld
    // %-04ld
    // %4ld
    // %+3ld
    // %5.2f
    // %-10.3f
    // %10.0f
    // %.3f
    
    NSLog(@"%-5ld", 10); //  우측으로 최소5폭 띄움
    NSLog(@"%5ld", 10);  // 좌측으로 최소5폭 띄움
    NSLog(@"%-04ld", 10); // 4칸지정, 값이 달라지기 때문에 우측으로는 채워줄수없음
    NSLog(@"%4ld", 10);  // 4칸지정, 좌측으로 채워줄 값을 지정해주지 않아서 값이안들어감
    NSLog(@"%3ld", 1000);  // 3칸지정, 3칸보다 값이 클경우는 알아서처리하고, 3자리 아래로는 공백처리나 지정된 값으로 처리
    NSLog(@"%5.2f", 10.00); // 5칸지정.소수점자리
    NSLog(@"%-10.3f", 10.000); // 10칸지정.소수점자리
    NSLog(@"%.3f", 10.00); // 소수점자리이고, 남은자리는 0으로 채운다
    
    
    
    return 0;
}
