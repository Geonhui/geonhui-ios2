//
//  Person.m
//  GeonHuinex7
//
//  Created by geon hui kim on 2016. 9. 27..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "Person.h"

@implementation Person

//클래스 안에서 구조체 사용
- (instancetype)initWithName:(NSString*)name
{
    self = [super init];
    if (self) {
        self.name = name;
    }
    return self;
}

//구조체
- (void)setHeight:(CGFloat)height weight:(CGFloat)weight
{
    //height와 weight가 들어오면 tempinfo로 넘긴다.
    charactor tempInfo = {height, weight};
    //tempinfo의 값을 self.info로 넘긴다.
    self.info = tempInfo;
}

- (void)setEyesight:(CGFloat)eyesight footsize:(CGFloat)footsize
{
    charactor2 tempInfo2 = {eyesight, footsize};
    self.info2 = tempInfo2;
}

//구조체 반환
- (charactor)personInfo
{
    return self.info;
}

- (charactor2)personInfo2
{
    return self.info2;
}
@end
