//
//  main.m
//  GeonHuiex2
//
//  Created by geon hui kim on 2016. 9. 20..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//
//--------------------------------------------------------------------------------------------------
// <> 이것은 애플에서 제공해주는 파일
#import <Foundation/Foundation.h>
/*  "" 이것은 개발자가 생성한 파일
    #import < 헤더파일을 가져온다는 명령어
    명령   클래스.헤더  */
#import "Person.h"
#import "Wizard.h"
#import "Warrior.h"
//--------------------------------------------------------------------------------------------------
int main(int argc, const char * argv[]) {
//--------------------------------------------------------------------------------------------------
/* 메모리에 동적으로 생성, 객체 생성 - alloc, 객체 초기화 - init
   클래스   변수     클래스    생성   초기화   (변수이름은 연관지어서 지을것) */
    Person *me = [[Person alloc] init];
    Person *you = [[Person alloc] init];
    
/* 오른쪽에서 왼쪽으로가는 대입연산자 =
   변수에 프로퍼티의 값을 넣어준다, 프로퍼티셋팅
   문자에는 ""를 쓰고 숫자는 ""를 쓰지않는다 */
    me.name = @"건희";
    me.server = @"korea";
    you.name = @"하연수";
    you.server = @"korea";
    
// 프로퍼티의 값을 가져온다
    NSLog(@"My name is %@", me.name);
    NSLog(@"%@ : %@", me.name, me.server);
    NSLog(@"%@ : %@", you.name, you.server);
    
//  메서드 호출 = 메세지 보냄
//  변수 구현메서드 구현문자
    [me drink:@"소주" with:you.name];
    [me playbaseball:you.name];
    [me playjocku:@"세계랭킹1위족구팀" winner:@"나랑내친구"];
    [me swimming:@"하와이" who:@"베이글미녀" how:@"행복" howmany:@"평생" need:@"ㅅㅂ 돈"];
    
//--------------------------------------------------------------------------------------------------
// 클래스-워리어, 변수-바바,팔라,드루이드
    Warrior *baba = [[Warrior alloc] init];
    baba.health = @10000;
    baba.weapon = @"grandfathergum";
    NSLog(@"my weapon is %@", baba.weapon);
    NSLog(@"baba health: %@, weapon:%@", baba.health, baba.weapon);
    [baba pvp:@"soser"];
    
    Warrior *pala = [[Warrior alloc] init];
    pala.health = @5000;
    pala.weapon = @"hamer";
    NSLog(@"my health is %@", pala.health);
    NSLog(@"pala health: %@, weapon:%@", pala.health, pala.weapon);
    [pala hunt];
    
    Warrior *druid = [[Warrior alloc] init];
//-------------------------------------------------------------------------------------------------
// 클래스-위저드, 변수-소서,네크로
    Wizard *soser = [[Wizard alloc] init];
    
    [soser firebolt:@10000
            percent:@"500%"];
    soser.mana = @10000;
    soser.weapon = @"tear";
    NSLog(@"soser mana: %@, weapon:%@", soser.mana, soser.weapon);
    [soser prostnova:@"내가제일싫어하는녀석"
               power:@"얼어디질"];
    
    Wizard *necro = [[Wizard alloc] init];
//-------------------------------------------------------------------------------------------------
    return 0;
}
