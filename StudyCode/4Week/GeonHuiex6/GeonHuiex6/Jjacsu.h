//
//  Jjacsu.h
//  GeonHuiex6
//
//  Created by geon hui kim on 2016. 9. 26..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Jjacsu : NSObject
//클래스 메서드
//숫자 한개를 받아서 그 수가 짝수인지 확인하는 메소드
+ (BOOL)isEvenNumber:(NSInteger)number;

//성적 평균을 입력시 해당 평균의 성적 등급을 매긴다.
+ (NSInteger)matchingGrade:(CGFloat)averige;

//성적등급에 따라 장학금 주기
+ (void)scholarghipWithGrade:(NSInteger)grade;

//달을 입력받으면 해당 달의 마지막 날을 반환 해준다.
+ (NSInteger)lastDayOfMonth:(NSInteger)month;

//절대값 구하기
+ (NSInteger)apsoluteValue:(NSInteger)value;

//반올림 문제 : 소수점 3째 자리에서 반올림 하는 함수를 만드세요
+ (CGFloat)RoundsUp:(CGFloat)value;

//윤년 구하는 문제 : 윤년은 기본적으로 매 4년마다 돌아오나, 100으로 나눠떨어지는 해는 윤년이 아니며 또 그중 400으로 나눠 떨어지는 해는 윤년이다.
+ (void)checkLeapYear:(NSInteger)afterCheckLeapYear;

@end
