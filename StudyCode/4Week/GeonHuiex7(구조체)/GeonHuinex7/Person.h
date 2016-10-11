//
//  Person.h
//  GeonHuinex7
//
//  Created by geon hui kim on 2016. 9. 27..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//




#import <Foundation/Foundation.h>
//임폴트 아래에 작성
//타입디프로 스트럭 구조체 생성
typedef struct character
{
    CGFloat height;
    CGFloat weight;
    
}charactor;

typedef struct character2
{
    CGFloat eyesight;
    CGFloat footsize;

}charactor2;




@interface Person : NSObject

@property NSString *name;
@property NSInteger age;

//구조체 프로퍼티
@property charactor info;
@property charactor2 info2;

//구조체 메서드
- (void)setHeight:(CGFloat)height weight:(CGFloat)weight;
- (void)setEyesight:(CGFloat)eyesight footsize:(CGFloat)footsize;
@end
