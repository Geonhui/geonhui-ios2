//
//  main.m
//  Practice3
//
//  Created by geon hui kim on 2016. 9. 25..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Hit.h"
#import "Charictor.h"
#import "SwordMan.h"
#import "Ahcher.h"
int main(int argc, const char * argv[]) {

    Hit *hitOne = [[Hit alloc] initWithuserName:@"김건희"];
    Hit *hitTwo = [[Hit alloc] initWithuserName:@"김건희" phoneNumber:1234];
    Hit *hitThree = [[Hit alloc] initWithuserName:@"김건희" phoneNumber:1234 phoneType:@"아이폰6"];
    NSLog(@"사용자이름은 %@입니다.", hitOne.userName);
    NSLog(@"사용자이름은 %@이고, 전화번호는 %ld입니다.", hitTwo.userName, hitTwo.phoneNumber);
    NSLog(@"사용자이름은 %@이고, 전화번호는 %ld이고, 폰은 %@입니다.", hitThree.userName, hitThree.phoneNumber, hitThree.phoneType);
    
    Charictor *chOne = [[Charictor alloc] initWithcharictorName:@"꽃돌이건"];
    Charictor *chTwo = [[Charictor alloc] initWithcharictorName:@"꽃돌이건" attack:1000 defence:1000];
    Charictor *chThree = [[Charictor alloc] initWithcharictorName:@"꽃돌이건" health:10000];
    Charictor *chFour = [[Charictor alloc] initWithcharictorName:@"꽃돌이건" attack:1000 defence:1000 skil:@"ㅇㄹㄴ"];
    NSLog(@"나의 캐릭터이름은 %@이다", chOne.charictorName);
    NSLog(@"나의 %@는 공격력이 %ld이고 방어력은 %ld이다", chTwo.charictorName, chTwo.attack, chTwo.defence);
    NSLog(@"나의 %@는 피가 %ld이다", chThree.charictorName, chThree.health);
    NSLog(@"나의 %@는 공격력은 %ld이고, 방어력은 %ld 그리고 스킬은 %@이다", chFour.charictorName, chFour.attack, chFour.defence, chFour.skill);
    
    SwordMan *smanOne = [[SwordMan alloc] init];
    Ahcher *achOne = [[Ahcher alloc] init];
    achOne.charictorName = @"사쿠라";
    smanOne.charictorName = @"사스케";
    [smanOne battle:achOne.charictorName];
    [achOne allowshawor:smanOne.charictorName];
    
    
    
    
    
    
    
    return 0;
    
    
    
}
