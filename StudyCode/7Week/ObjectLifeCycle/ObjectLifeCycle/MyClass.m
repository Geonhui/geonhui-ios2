//
//  MyClass.m
//  ObjectLifeCycle
//
//  Created by geon hui kim on 2016. 10. 20..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "MyClass.h"

@implementation MyClass

//alloc
//alloc이 언제 발생되는지 log를 찍어 확인
//클래스 메서드
+ (instancetype)alloc
{
    NSLog(@"my class instance alloc");
    return [super alloc];
}

//init, 초기화
//인스턴스 메서드
- (instancetype)init
{
    NSLog(@"my class instance init");
    return [super init];
}

//dealloc
//alloc된 객체를 dealloc없앤다는 메서드, 인스턴스 메서드
- (void)dealloc
{
    NSLog(@"my class instance dealloc");
}

@end
