//
//  Warrior.m
//  GeonHuiex4
//
//  Created by geon hui kim on 2016. 9. 22..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "Warrior.h"
// 구현파일 가져올 최상위클래스와 연결
@class GameCharactor;
@implementation Warrior

// 공격을 게임캐릭터 최상위클래스에 상속받은 어느 캐릭터에게
-(id)smashTo:(GameCharactor *)someone {
    NSLog(@"%@가 %@에게 공격한다.", self.name, someone.name);
    return nil;
}
// 점프를 문자열타입(존나멀리)의 어딘가에 점프했다.
- (id)jumpTo:(GameCharactor *)location {
    NSLog(@"%@가 %@ 점프했다.", self.name, location.name);
    return nil;
}


@end
