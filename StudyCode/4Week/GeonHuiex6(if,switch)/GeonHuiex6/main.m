//
//  main.m
//  GeonHuiex6
//
//  Created by geon hui kim on 2016. 9. 26..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

/* 학점계산기 클래스 만들기
 프로퍼티 만들기
 메서드 만들기
 1. 과목 점수 더하는 함수
 2. 평균 구하는 함수 */

#import <Foundation/Foundation.h>
#import "ClassCalculator.h"
#import "DimensionalShapes.h"
#import "ToolBox.h"
#import "Jjacsu.h"


int main(int argc, const char * argv[]) {
    //--------------------------------------------------------------------------------------------------------------------

    //객체 생성, 초기화
    ClassCalculator *cal = [[ClassCalculator alloc] init];
    DimensionalShapes *dimOne = [[DimensionalShapes alloc] init];
    //점수 추가
    [cal addScore:30];
    [cal addScore:99];
    [cal addScore:60];
    //평균
    //CGFloat average  = [cal average];
    //NSLog(@"%lf가 평균입니다.", [cal average]);
    
    //--------------------------------------------------------------------------------------------------------------------
    
    //정사각형 넓이, 둘레
    NSLog(@"정사각형의 넓이는 %ld이다", [dimOne squreArea:2]);
    NSLog(@"정사각형의 둘레는 %ld이다", [dimOne squrePerimeter:4]);
    //직사각형 넓이, 둘레
    NSLog(@"직사각형의 넓이는 %ld이다",[dimOne rectangleArea:2 wide:2]);
    NSLog(@"직사각형의 둘레는 %ld이다",[dimOne rectanglePerimeter:2 wide:2]);
    //원의 넓이, 둘레
    NSLog(@"원의 넓이는 %lf이다", [dimOne circleArea:2]);
    NSLog(@"원의 둘레는 %lf이다", [dimOne circleCircumference:1]);
    //삼각형
    NSLog(@"삼각형의 넓이는 %lf이다", [dimOne triangleArea:2 high:2]);
    //사다리꼴
    NSLog(@"사다리꼴의 넓이는 %lf이다.", [dimOne trapezoidArea:2 bottom:2 high:2]);
    //큐브
    NSLog(@"큐브의 넓이는 %ld이다", [dimOne cubeVolume:1]);
    //직사각형 큐브
    NSLog(@"직사각형 큐브의 넓이는 %ld이다", [dimOne rectangularSolidVolume:1 wide:1 high:1]);
    //원통
    NSLog(@"원통의 부피는 %lf입니다.",[dimOne circularCylinderVolume:2 high:3]);
    //원형
    NSLog(@"원형의 부피는 %lf입니다.", [dimOne sphereVolume:1]);
    //원뿔
    NSLog(@"원뿔의 부피는 %lf입니다.", [dimOne coneVolume:2 high:3]);
    
    //--------------------------------------------------------------------------------------------------------------------
    
    //인치에서 센티미터
    NSLog(@"%lf",[ToolBox inchTo:1]);
    //센티미터에서 인치
    NSLog(@"%lf",[ToolBox cmTo:1]);
    //m2에서 평수
    NSLog(@"%lf", [ToolBox m2To:1]);
    //평수에서 m2
    NSLog(@"%lf", [ToolBox acreage:1]);
    //화씨에서 섭씨
    NSLog(@"%lf", [ToolBox FahrenheitTo:2]);
    //섭씨에서 화씨
    NSLog(@"%lf", [ToolBox celsiusTo:2]);
    //kb에서 mb
    NSLog(@"%ld", [ToolBox kbTo:10]);
    //mb에서 kb
    NSLog(@"%ld", [ToolBox mbTo:100000]);
 
    //--------------------------------------------------------------------------------------------------------------------
    
    //짝수일경우는 예스, 홀수일경우는 노
    NSLog(@"%d", [Jjacsu isEvenNumber:3]);
    //100~90은 1등급, 80~90은 2등급
    NSLog(@"%ld", [Jjacsu matchingGrade:89]);
    //1-전액장학금, 2-50%, 3-25%, 4-없음
    [Jjacsu scholarghipWithGrade:2];
    //1,2,3,4월 - 30일, 나머지 31일
    NSLog(@"%ld", [Jjacsu lastDayOfMonth:7]);
    //절대값 구하기 123은 123 -123은 123으로 표현
    NSLog(@"%ld", [Jjacsu apsoluteValue:-12]);
    //반올림 문제 3.41422 > 3.41로 표현됨
    NSLog(@"%lf", [Jjacsu RoundsUp:3.4141]);
    //윤년구하는문제, 4의 배수는 윤년, 100년마다는 윤년이 아님, 400년씩은 윤년
    [Jjacsu checkLeapYear:800];
    
    return 0;
}
