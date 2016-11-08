//
//  Musician.m
//  PropertyAttributes
//
//  Created by geon hui kim on 2016. 11. 8..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "Musician.h"

@implementation Musician

//멤버수
//- (void)setMemberConut:(NSNumber *)memberConut
//{
//    if (memberConut) {
//        _memberConut = memberConut;
//        
//    }else {
//        _memberConut = @0;
//    }
//}

//초기화
//(null_resettable)이므로 nil일 수가 없다.
- (instancetype)init
{
    self = [super init];
    if (self) {
        _memberConut = @0;
    }
    return self;
}

//
- (instancetype)initWithName:( NSString * _Nonnull )name memberCount:( NSNumber * _Nonnull )memberCount
{
    self = [super init];
    if (self) {
        _groupName = name;
        _memberConut = memberCount;
    }
    return self;
}

//ARC수동
//ARC일 경우 dealloc이 필요없다.
//- (void)dealloc
//{
//    NSLog(@"%@ delloc", self.groupName);
////    [super dealloc];
//}


@end
