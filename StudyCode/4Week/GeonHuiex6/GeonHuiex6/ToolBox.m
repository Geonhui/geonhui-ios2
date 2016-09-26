//
//  ToolBox.m
//  GeonHuiex6
//
//  Created by geon hui kim on 2016. 9. 26..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "ToolBox.h"

@implementation ToolBox
//인치 > 센티미터
+ (CGFloat)inchTo:(CGFloat)cm
{
    return 0.393701 * cm;
}

//센티미터 > 인치
+ (CGFloat)cmTo:(CGFloat)inch
{
    return 2.54 * inch;
}

//미터퍼제곱 > 평수
+ (CGFloat)m2To:(CGFloat)acreage
{
    return 0.3025 * acreage;
}

//평수 > 미터퍼제곱
+ (CGFloat)acreage:(CGFloat)m2
{
    return 3.305785 * m2;
}

//화씨 > 섭씨
+ (CGFloat)FahrenheitTo:(CGFloat)celsius
{
    return celsius * 1.8 + 32;
}

//섭씨 > 화씨
+ (CGFloat)celsiusTo:(CGFloat)fahrenheit
{
    return (fahrenheit - 32) / 1.8;
}

//킬로바이트 > 메가바이트
+ (NSInteger)kbTo:(NSInteger)mb;
{
    return 1024 * mb;
}

//메가바이트 > 킬로바이트
+ (NSInteger)mbTo:(NSInteger)kb
{
    return 0.000977 * kb;
}



@end
