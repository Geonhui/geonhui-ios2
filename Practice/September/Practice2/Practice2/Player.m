//
//  Player.m
//  Practice2
//
//  Created by geon hui kim on 2016. 9. 22..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "Player.h"
@implementation Player

// 선수클래스의 메서드구현 작성
- (id)howMany:(Deveroper *)year {
      // 선수클래스의 변수                    개발자클래스의 변수
    NSLog(@" %@ 패스트캠퍼스 졸업해서 우리가원하는 기업에 %@로 입사하자!",
   // 선수클래스 프로퍼티값   개발자클래스의 프로퍼티값
          self.sex, year.name);
    return nil;
}
// 선수클래스의 메서드구현 작성
// 인간클래스에 기록되어있는 메서드이기때문에 상속된 메서드
// 선수클래스 헤더파일에서 임폴트 해줄 필요는 없다.
- (id)life:(Person *)however {
    //                            선수클래스의 프로퍼티값   인간클래스의 프로퍼티값
    NSLog(@"%@는 한국%@대표팀이 세계최강이다.", self.name, however.sex);
    return nil;
}

@end
