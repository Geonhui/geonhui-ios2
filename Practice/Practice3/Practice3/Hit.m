//
//  Hit.m
//  Practice3
//
//  Created by geon hui kim on 2016. 9. 25..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "Hit.h"

@implementation Hit

- (instancetype)initWithuserName:(NSString *)userName { //사용자 이름
    
    self = [super init];
    
    self.userName = userName;
    return self;
}
    
    
- (instancetype)initWithuserName:(NSString *)userName
                     phoneNumber:(NSInteger)phoneNumber { //사용자 이름, 전화번호

    self = [super init];
    
    self.userName = userName;
    self.phoneNumber = phoneNumber;
    return self;
}

    
    
- (instancetype)initWithuserName:(NSString *)userName
                     phoneNumber:(NSInteger)phoneNumber
                       phoneType:(NSString *)phoneType { //사용자이름, 전화번호, 폰타입

    self = [super init];
    
    self.userName = userName;
    self.phoneNumber = phoneNumber;
    self.phoneType = phoneType;
    return self;
}

// 정사각형
- (NSInteger)squareArea:(NSInteger)side
{
    return side * side;
}
- (NSInteger)squarePerimeter:(NSInteger)side
{
    return 4 * side;
}
// 직사각형
- (NSInteger)rectangleArea:(NSInteger)leangh wide:(NSInteger)wide
{
    return leangh * wide;
}
- (NSInteger)rectanglePerimeter:(NSInteger)leangh wide:(NSInteger)wide
{
    return 2 * leangh + 2 * wide;
}
// 원
- (CGFloat)circleArea:(CGFloat)ridius
{
    return (CGFloat)3.14 * ridius * ridius;
}
- (CGFloat)circlePerimeter:(CGFloat)ridius
{
    return 2 * (CGFloat)3.14 * ridius;
}
// 삼각형
- (CGFloat)triangleArea:(CGFloat)bottom high:(CGFloat)high
{
    return (CGFloat)0.5 * bottom * high;
}
// 사다리꼴
- (CGFloat)trapezoidArea:(CGFloat)high bottom:(CGFloat)bottom up:(CGFloat)up
{
    return (CGFloat)0.5 * high * (bottom + up);
}
// 큐브
- (NSInteger)cubeVolume:(NSInteger)side
{
    return side * side * side;
}
// 직사각형 큐브
- (NSInteger)rectangularsolidVolume:(NSInteger)leangh wide:(NSInteger)wide high:(NSInteger)high
{
    return leangh * wide * high;
}
// 원통
- (CGFloat)circlularcylinderVolume:(CGFloat)ridius high:(CGFloat)high
{
    return (CGFloat)3.14 * ridius * ridius * high;
}
// 원형
- (CGFloat)sphereVolume:(CGFloat)ridius
{
    return (CGFloat)4.0 / (CGFloat)3.0 * (CGFloat)3.14 * ridius * ridius * ridius;
}
// 원뿔
- (CGFloat)coneVolume:(CGFloat)ridius high:(CGFloat)high
{
    return (CGFloat)1.0 / (CGFloat)3.0 * (CGFloat)3.14 * ridius * ridius * high;
}

// 학점계산기 메서드 구현
- (void)addScore:(NSInteger)score
{
    self.totalScore = self.totalScore + score;
    self.subjectCount = self.subjectCount + 1;
}

- (CGFloat)averige
{
    CGFloat averigeTemp = (CGFloat)self.totalScore / (CGFloat)self.subjectCount;
    
    return averigeTemp;
}





@end
