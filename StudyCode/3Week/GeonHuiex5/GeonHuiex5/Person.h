//
//  Person.h
//  GeonHuiex5
//
//  Created by geon hui kim on 2016. 9. 23..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

// 프로퍼티
@property NSString *name;
@property NSInteger age;
@property NSString *mobileNumber;
@property NSString *city;
@property BOOL isHansome;

//초기화 메서드
//이름, 잘생겼는지
- (instancetype)initWithName:(NSString *)name isHansome:(BOOL)isHansome;

//이름, 나이
- (instancetype)initWithName:(NSString *)name age:(NSInteger)age;

//이름, 도시
- (instancetype)initWithName:(NSString *)name city:(NSString *)city;

//전화번호, 도시
- (instancetype)ititWithName:(NSString *)mobileNumber city:(NSString *)city;

// 이름, 나이, 전화번호, 도시
- (instancetype)initWithName:(NSString *)name age:(NSInteger)age mobileNumber:(NSString *)mobileNumber city:(NSString *)city;
                            
@end
