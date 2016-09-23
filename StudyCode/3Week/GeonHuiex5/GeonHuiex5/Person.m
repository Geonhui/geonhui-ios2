//
//  Person.m
//  GeonHuiex5
//
//  Created by geon hui kim on 2016. 9. 23..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "Person.h"

@implementation Person

// 이름과 생김새 메서드
// 초기화 메서드 구현
- (instancetype)initWithName:(NSString *)name isHansome:(BOOL)isHansome {
 
    self = [super init];
    
    self.name = name;
    self.isHansome = isHansome;
    
    return self;
}
// 이름과 나이 메서드
- (instancetype)initWithName:(NSString *)name age:(NSInteger)age {
    
    self = [super init];
    
    self.name = name;
    self.age = age;
    
    return self;
}
// 이름과 도시 메서드
- (instancetype)initWithName:(NSString *)name city:(NSString *)city {
   
    self = [super init];
    
    self.name = name;
    self.city = city;
    
    return self;
    
}
@end
