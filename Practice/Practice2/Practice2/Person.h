//
//  Person.h
//  Practice2
//
//  Created by geon hui kim on 2016. 9. 22..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import <Foundation/Foundation.h>
//최상위 클래스
@interface Person : NSObject
//최상위 상속 프로퍼티
@property NSString *name;
@property NSString *sex;
@property NSString *jobName;
// 최상위 상속 메서드

/**
 * 얼마나 살것인가?
 * @param life  살것이다.
 * @param however 얼마나
 */
- (id)life:(Person*)however;


@end
