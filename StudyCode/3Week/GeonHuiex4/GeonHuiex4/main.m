//
//  main.m
//  GeonHuiex4
//
//  Created by geon hui kim on 2016. 9. 22..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//
// 헤더파일 임폴트
// 각 클래스 헤드 파일을 가져온다.
#import <Foundation/Foundation.h>
#import "Warrior.h"
#import "Wissord.h"

int main(int argc, const char * argv[]) {
    
//   워리어 클래스를 제이슨이란 변수로 객체 생성하고 초기화 하겠다.
    Warrior *jason = [[Warrior alloc] init];
//   제이슨에 프로퍼티 값을 지정해준다.
    jason.health = 1000;
    jason.physicalPower = 100;
    jason.mana = 1000;
    jason.masicPower = 1000;
    jason.isDead = NO;
    jason.name = @"아이";
    jason.weapon = @"방망이";

//   위저드 클래스를 제이슨이란 변수로 객체 생성하고 초기화 하겠다.
    Wissord *rose = [[Wissord alloc] init];
//   로즈에 프로퍼티 값을 지정해준다.
    rose.health = 1000;
    rose.physicalPower = 100;
    rose.mana = 1000;
    rose.masicPower = 2000;
    rose.isDead = NO;
    rose.name = @"어른";
    rose.weapon = @"지팡이";
    
//   메서드 호출
    [rose windstormTo:jason];
    [jason jumpTo:@"존나멀리"];
    [rose PhysicalPowerAttackTo:jason];
    [rose teleportTo:jason];

    return 0;
}
