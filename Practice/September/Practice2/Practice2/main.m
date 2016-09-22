//
//  main.m
//  Practice2
//
//  Created by geon hui kim on 2016. 9. 22..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//
// 임폴트는 클래스의 모든 값들을 불러옴 클래스,객체,프로퍼티,매체변수,메서드 전부
#import <Foundation/Foundation.h>
#import "Person.h"
#import "Student.h"
#import "Player.h"
#import "Deveroper.h"
#import "Singer.h"

int main(int argc, const char * argv[]) {

//   인간클래스의 맨변수를 객체생성 초기화시킨다.
    Person *man = [[Person alloc] init];
//   맨 변수의 프로퍼티에 값을 넣어준다.
    man.name = @"건희";
    man.sex = @"남자";
    man.jobName = @"최고";
    
//   학생클래스의 초변수를 객체생성 초기화시킨다.
    Student *cho = [[Student alloc] init];
//   초 변수의 프로퍼티 값을 넣어준다.
    cho.name = @"초딩건희";
    cho.sex = @"남자";
    cho.jobName = @"초딩";
    
//   선수 클래스의 야구변수를 객체생성 초기화 시킨다.
    Player *baseball = [[Player alloc] init];
//   야구 변수의 프로퍼티 값을 넣어준다.
    baseball.name = @"야구";
    baseball.sex = @"다같이";
    baseball.jobName = @"야구선수";
    
//   개발자 클래스에 아이오에스변수를 객체생성 초기화 한다.
    Deveroper *ios = [[Deveroper alloc] init];
//   아이오에스변수에 프로퍼티 값을 넣어준다.
    ios.name = @"아이폰개발자";
    ios.sex = @"아무나";
    ios.jobName = @"아이폰최고";
    
//   가수 클래스에 가수원변수를 객체생성, 초기화 한다.
    Singer *singerOne = [[Singer alloc] init];
//   가수원 변수의 프로퍼티 값을 넣어준다.
    singerOne.name = @"초고수";
    singerOne.sex = @"남자";
    singerOne.jobName = @"가수";
    
//   메서드 호출
//   선수클래스의 야구변수를 어떤메서드로 어디에 구현할것인가
    [baseball howMany:ios];
    [baseball life:man];
    
    return 0;
}
