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
    //_info.height = height;
    //_info.weight = weight;
    
    charactor tempInfo = {height,weight};
    self.info = tempInfo;
}

//구조체
- (charactor)personInfo
{
    return _info;
}

@end
