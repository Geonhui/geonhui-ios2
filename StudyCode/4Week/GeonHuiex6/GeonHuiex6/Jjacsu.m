//
//  Jjacsu.m
//  GeonHuiex6
//
//  Created by geon hui kim on 2016. 9. 26..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "Jjacsu.h"

@implementation Jjacsu
//어떤값을 넣었을때 짝수이면 1, 짝수가 아니면 0
+ (BOOL)isEvenNumber:(NSInteger)number
{   //처음엔 0이니깐 노
    BOOL isEven = NO;
    //2의 배수
    if (number%2 == 0) {
        //짝수
        isEven = YES;
    }else
    {   //홀수
        isEven = NO;
}
    return isEven;
}

//100보다 작고 90보다 크면 1, 90보다 작고 80보다 크면 2
+ (NSInteger)matchingGrade:(CGFloat)averige
{
    NSInteger gradeNum = 0;
    if (averige <= 100 && averige >= 90)
    {
        gradeNum = 1;
    }else if(averige <= 90 && averige >= 80)
    {
        gradeNum = 2;
    }
    return gradeNum;
}

//1이면 전액장학금, 2면 오십프로, 3이면 이십오프로 나머지는 없음
+ (void)scholarghipWithGrade:(NSInteger)grade
{   //메서드 안에서 로그를 출력하기 때문에 메인에서 로그찍을필요없다
    switch (grade) {
        case 1:
            NSLog(@"전액장학금");
            break;
            
        case 2:
            NSLog(@"50%%");
            break;
            
        case 3:
            NSLog(@"25%%");
            break;
        //마지막엔 디폴트
       default:
            NSLog(@"없음");
            break;
    }
}

//1,2,3,4월은 30일, 나머지월은 31일
+ (NSInteger)lastDayOfMonth:(NSInteger)month
{
    NSInteger lastDay = 0;
    // 케이스를 한번에 적어도 괜찬다
    switch (month) {
        case 1:
        case 2:
        case 3:
        case 4:
            lastDay = 30;
            break;
            
        default:
            lastDay = 31;
            break;
    }       //리턴은 중괄호 밑에
            return lastDay;
}

//0보다 작으면 -1을 곱해서 양수로 표현
+ (NSInteger)apsoluteValue:(NSInteger)value
{   //0보다 작다
    if (value < 0)
    {   //0보다 작으면 그값을 -1을 곱한다
        value = value * (-1);
    }
    return value;
}

//소수점이 들어가면 0.005를 하여 반올림하고
//그값을 100을 곱한 후 0.01곱해서 소수점 첫째 자리로 표현
+ (CGFloat)RoundsUp:(CGFloat)value
{
    CGFloat isValue = 0;
    isValue = value + 0.005;
    NSInteger sumValue = isValue * 100;
    CGFloat finishValue = sumValue *0.01;
    return finishValue;
}

//4이고 100아니면 참
//400이면 참
//4이고 400이면 참
+ (void)checkLeapYear:(NSInteger)Year
{
    NSString * yunYear = @"윤년";
    if ((Year %4 == 0 && Year %100 != 0) || Year %400 == 0) {
        //4년마다, 400년으로 떨어지는 윤년
        NSLog(@"%@입니다.", yunYear);
    }else {
        //100년마다는 윤년이 아니다
        NSLog(@"%@아닙니다.", yunYear);
    }
}








@end
