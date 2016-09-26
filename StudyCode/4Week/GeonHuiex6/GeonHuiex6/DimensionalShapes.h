//
//  DimensionalShapes.h
//  GeonHuiex6
//
//  Created by geon hui kim on 2016. 9. 26..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DimensionalShapes : NSObject

@property NSInteger area;  //넓이
@property NSInteger perimeter;  //직사각형 둘레
@property NSInteger circumference; //원의 둘레
@property NSInteger volume; //부피

//square 구하기
- (NSInteger)squreArea:(NSInteger)length; //정사각형 넓이
- (NSInteger)squrePerimeter:(NSInteger)length; //정사각형 둘레

//rectangle 구하기
- (NSInteger)rectangleArea:(NSInteger)leanth wide:(NSInteger)wide; // 직사각형 넓이
- (NSInteger)rectanglePerimeter:(NSInteger)leanth wide:(NSInteger)wide; //직사각형 둘레

//circle 구하기
- (CGFloat)circleArea:(NSInteger)ridius; //원의 넓이
- (CGFloat)circleCircumference:(NSInteger)ridius; //원의 둘레

//triangle 구하기
- (CGFloat)triangleArea:(NSInteger)bottom high:(NSInteger)high; //삼각형의 넓이

//trapezoid 구하기
- (CGFloat)trapezoidArea:(NSInteger)top bottom:(NSInteger)bottom high:(NSInteger)high; //사다리꼴의 넓이

//cube 구하기
- (NSInteger)cubeVolume:(NSInteger)byen; //큐브의 부피

//rectangularsolid 구하기
- (NSInteger)rectangularSolidVolume:(NSInteger)longByen wide:(NSInteger)wide high:(NSInteger)high; //직사각형큐브의 부피

//circularcylinder 구하기
- (CGFloat)circularCylinderVolume:(NSInteger)ridius high:(NSInteger)high; //원통의 부피

//sphere 구하기
- (CGFloat)sphereVolume:(NSInteger)ridius; //원형의 부피

//cone 구하기
- (CGFloat)coneVolume:(NSInteger)ridius high:(NSInteger)high; //원뿔의 부피

@end
