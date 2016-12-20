//
//  main.m
//  CodingPractice
//
//  Created by geon hui kim on 2016. 12. 21..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {

    //1번 문제
    NSLog(@"in objective-c, lowercase letters are significant.");
    NSLog(@"main is where program execution begins.");
    NSLog(@"open and closed braces enclose program statements in a routine");
    NSLog(@"all program statements must be terminated by a semicolon");
    
    //2번 문제
    NSInteger i = 1;
    NSLog(@"=========================");
    NSLog(@"integer : %ld",i);
    NSLog(@"integer : %ld",i + 1);
    NSLog(@"integer : %ld",i + 2);
    
    //3번 문제
    NSInteger a = 87;
    NSInteger b = 15;
    NSLog(@"=========================");
    NSLog(@"87 - 15 = %ld", a - b);
    
    //4번 문제
    NSInteger sum;
    sum = (25 + 37) - 19;
    NSLog(@"=========================");
    NSLog(@"the answer : %ld", sum);
    
    //5번 문제
    NSInteger answer;
    NSInteger result;
    answer = 100;
    result = answer - 10;
    NSLog(@"=========================");
    NSLog(@"answer : %ld, result : %ld", answer, result);
    NSLog(@"the result value : %ld", result + 5);
}
