//
//  Student.m
//  GeonHuiex5
//
//  Created by geon hui kim on 2016. 9. 23..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "Student.h"
@implementation Student

- (instancetype)initWithName:(NSString *)name city:(NSString *)city school:(NSString *)school grade:(NSInteger)grade {
    
    // 부모에서 물려받은것을 셀프로 자기가 받을필요는 없다.
    // 상속받은것은 수퍼로 받아온다.
    // 상속받지못한 것은 셀프로 지정한다.
    self = [super initWithName:name
                      city:city];
    // 학생클래스 자체에 있는 프로퍼티
    // 최상위 클래스에는 없는 프로퍼티
    self.school = school;
    self.grade = grade;
    // nil이 아니라 self
    return self;
}

- (id)eat {
    NSLog(@"%@을 먹다", self.name);
    return nil;
}

@end
