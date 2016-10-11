//
//  ToolBox.h
//  GeonHuiex6
//
//  Created by geon hui kim on 2016. 9. 26..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToolBox : NSObject

//인치에서 센티미터
+ (CGFloat)inchTo:(CGFloat)cm;

//센티미터에서 인치
+ (CGFloat)cmTo:(CGFloat)inch;

//m2에서 평수
+ (CGFloat)m2To:(CGFloat)acreage;

//평수에서 m2
+ (CGFloat)acreage:(CGFloat)m2;

//화씨에서 섭씨
+ (CGFloat)FahrenheitTo:(CGFloat)celsius;

//섭씨에서 화씨
+ (CGFloat)celsiusTo:(CGFloat)fahrenheit;

//kb에서 mb
+ (NSInteger)kbTo:(NSInteger)mb;

//mb에서 kb
+ (NSInteger)mbTo:(NSInteger)kb;

@end
