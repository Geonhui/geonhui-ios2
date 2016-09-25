//
//  main.m
//  GeonHuiex5
//
//  Created by geon hui kim on 2016. 9. 23..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Student.h"
int main(int argc, const char * argv[]) {

    // 객체 생성, 초기화
    // 각각 프로퍼티 지정
    Person *jack = [[Person alloc] init];
    jack.name = @"집밥";
    jack.age = 50;
    jack.mobileNumber = @"010-2000-0220";
    jack.city = @"홍콩";

    // 객체 생성, 초기화시 쓰고자 하는 프로퍼트 값을 바로 지정해 줄수 있다.
    Person *rose = [[Person alloc] initWithName:@"로즈" age:30];
    
    NSLog(@" 이름 : %@, 나이는? : %ld", rose.name, rose.age);
    
    // 객체 생성, 초기화시 쓰고자 하는 프로퍼트 값을 바로 지정해 줄수 있다.
    Student *mini = [[Student alloc] initWithName:@"학식" city:@"서울" school:@"고등학교" grade:3];

    NSLog(@" 이름 : %@, 지역 : %@, 등급 : %@, 학년 : %ld", mini.name, mini.city, mini.school, mini.grade);
    
    //[jack eat];
    //[mini eat];
    
    return 0;
}
