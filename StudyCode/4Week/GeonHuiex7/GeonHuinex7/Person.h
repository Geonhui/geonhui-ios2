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

@interface Person : NSObject

@property NSString *name;
@property NSInteger age;

//구조체
@property charactor info;

@end
