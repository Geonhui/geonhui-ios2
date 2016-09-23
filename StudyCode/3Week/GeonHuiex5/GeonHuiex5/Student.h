//
//  Student.h
//  GeonHuiex5
//
//  Created by geon hui kim on 2016. 9. 23..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "Person.h"

@interface Student : Person

//학생클래스 프로퍼티
@property NSString *school;
@property NSInteger grade;
@property NSString *credit;

//이름, 도시, 학교, 학년
- (instancetype)initWithName:(NSString *)name city:(NSString *)city school:(NSString *)school grade:(NSInteger)grade;


@end
