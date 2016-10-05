//
//  Hit.h
//  Practice3
//
//  Created by geon hui kim on 2016. 9. 25..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Hit : NSObject

@property NSString *userName;    //사용자 이름
@property NSInteger phoneNumber;  //사용자 전화번호
@property NSString *phoneType;    //사용자 핸드폰종류

//학점계산기 프로퍼티
@property NSInteger totalScore;
@property NSInteger subjectCount;

// 도형 연습 프로퍼티
@property CGFloat area;
@property CGFloat perimeter;
@property CGFloat circumference;
@property CGFloat volume;

//학점계산기 메서드
- (void)addScore:(NSInteger)score;
- (CGFloat)averige;

// 도형 연습 메서드
// 정사각형
- (NSInteger)squareArea:(NSInteger)side;
- (NSInteger)squarePerimeter:(NSInteger)side;
// 직사각형
- (NSInteger)rectangleArea:(NSInteger)leangh wide:(NSInteger)wide;
- (NSInteger)rectanglePerimeter:(NSInteger)leangh wide:(NSInteger)wide;
// 원
- (CGFloat)circleArea:(CGFloat)ridius;
- (CGFloat)circlePerimeter:(CGFloat)ridius;
// 삼각형
- (CGFloat)triangleArea:(CGFloat)bottom high:(CGFloat)high;
// 사다리꼴
- (CGFloat)trapezoidArea:(CGFloat)high bottom:(CGFloat)bottom up:(CGFloat)up;
// 큐브
- (NSInteger)cubeVolume:(NSInteger)side;
// 직사각형 큐브
- (NSInteger)rectangularsolidVolume:(NSInteger)leangh wide:(NSInteger)wide high:(NSInteger)high;
// 원통
- (CGFloat)circlularcylinderVolume:(CGFloat)ridius high:(CGFloat)high;
// 원형
- (CGFloat)sphereVolume:(CGFloat)ridius;
// 원뿔
- (CGFloat)coneVolume:(CGFloat)ridius high:(CGFloat)high;

//구구단 구현
+ (void)mutiplicationTable:(NSInteger)dan;
+ (void)mutiplicationTable2:(NSInteger)value;
//팩토리얼
+ (void)factorial:(NSInteger)value;
//삼각수
+ (void)triangularNum:(NSInteger)value;
//각 자리수 더하기
+ (void)addAllNum:(NSInteger)value;
//3,6,9게임
+ (void)game369:(NSInteger)value;

- (instancetype)initWithuserName:(NSString *)userName; //사용자 이름

- (instancetype)initWithuserName:(NSString *)userName
                     phoneNumber:(NSInteger)phoneNumber; //사용자 이름, 전화번호

- (instancetype)initWithuserName:(NSString *)userName
                     phoneNumber:(NSInteger)phoneNumber
                       phoneType:(NSString *)phoneType; //사용자이름, 전화번호, 폰타입

@end
