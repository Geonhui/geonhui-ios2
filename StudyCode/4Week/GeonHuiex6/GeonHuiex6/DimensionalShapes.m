//
//  DimensionalShapes.m
//  GeonHuiex6
//
//  Created by geon hui kim on 2016. 9. 26..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "DimensionalShapes.h"

@implementation DimensionalShapes

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.area = 0;
        self.perimeter = 0;
        self.circumference = 0;
        self.volume = 0;
    }
    return self;
}

//정사각형
//정사각형 넓이 구하기
- (NSInteger)squreArea:(NSInteger)length
{
    return length * length;
}
//정사각형 둘레 구하기
- (NSInteger)squrePerimeter:(NSInteger)length
{
    return 4 * length;
}

//직사각형
//직사각형 넓이 구하기
- (NSInteger)rectangleArea:(NSInteger)leanth wide:(NSInteger)wide
{
    return leanth * wide;
    
}
//직사각형 둘레 구하기
- (NSInteger)rectanglePerimeter:(NSInteger)leanth wide:(NSInteger)wide
{
    return 2 * leanth + 2 * wide;
}

//원
//원의 넓이 구하기
- (CGFloat)circleArea:(NSInteger)ridius
{
    return (CGFloat)3.14 * ridius * ridius;
}
//원의 둘레 구하기
- (CGFloat)circleCircumference:(NSInteger)ridius;
{
    return 2 * (CGFloat)3.14 * ridius;
}

//삼각형 넓이 구하기
- (CGFloat)triangleArea:(NSInteger)buttom high:(NSInteger)high
{
    return (CGFloat)0.5 * buttom * high;
}

//사다리꼴 넓이 구하기
- (CGFloat)trapezoidArea:(NSInteger)top bottom:(NSInteger)bottom high:(NSInteger)high
{
    return (CGFloat)0.5 * top * (bottom + top);
}

//큐브 부피 구하기
- (NSInteger)cubeVolume:(NSInteger)byen
{
    return byen * byen * byen;
}

//직사각형 큐브 부피 구하기
- (NSInteger)rectangularSolidVolume:(NSInteger)longByen wide:(NSInteger)wide high:(NSInteger)high
{
    return longByen * wide * high;
}

//원통 부피 구하기
- (CGFloat)circularCylinderVolume:(NSInteger)ridius high:(NSInteger)high
{
    return (CGFloat)3.14 * ridius * high;
}

//원형 부피 구하기
- (CGFloat)sphereVolume:(NSInteger)ridius
{
    return (CGFloat)3.0 / (CGFloat)4.0 * (CGFloat)3.14 * ridius * ridius *ridius;
}

//원뿔 부피 구하기
- (CGFloat)coneVolume:(NSInteger)ridius high:(NSInteger)high
{
    return 1.0 / 3.0 * 3.14 * ridius * ridius * high;
}






@end
