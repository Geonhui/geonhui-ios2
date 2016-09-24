//
//  Warrior.h
//  GeonHuiex4
//
//  Created by geon hui kim on 2016. 9. 22..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//
#import <Foundation/Foundation.h>
// 최상위 클래스의 파일을 가져온다.
#import "GameCharactor.h"
// 워리어 클래스가 게임캐릭터 클래스로 부터 상속되었다.
@interface Warrior : GameCharactor
// 워리어 클래스 자체가 가지는 메서드
- (id)jumpTo:(NSString *)location;
// 워리어가 가지는 메서드를 게임캐릭터에 상속된 어느 캐릭터의 값을 불러오겠다.
- (id)smashTo:(GameCharactor *)someone;


@end