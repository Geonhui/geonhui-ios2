//
//  Monster.h
//  GeonHuiex
//
//  Created by geon hui kim on 2016. 9. 19..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Monster : NSObject

//인간캐릭터 선택
@property id human;
//악마캐릭터 선택
@property id devil;
//천사캐릭터 선택
@property id angel;
//요괴캐릭터 선택
@property id specter;

//공격형,사냥,팀대전에 메타
- (id)attack;
//방어형,보스전,레이드 메타
- (id)defense;
//지원형,팀대전,레이드 메타
- (id)support;
//복합형,팀대전,영웅대전 메타
- (id)multiple;


@end
