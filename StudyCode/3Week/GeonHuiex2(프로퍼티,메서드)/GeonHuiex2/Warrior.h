//
//  Warrior.h
//  GeonHuiex2
//
//  Created by geon hui kim on 2016. 9. 20..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//
//-------------------------------------------------------------------------------------------------
#import <Foundation/Foundation.h>
// 클래스 정의
// Warrior클래스, 생성시 첫글짜는 대문자로
@interface Warrior : NSObject
//-------------------------------------------------------------------------------------------------
// 프로퍼티 지정
// 소문자 작성

// 캐릭터 피
@property id health;
// 캐릭터 마나
@property id mana;
// 캐릭터 피지컬(신체적인능력)
@property id physicalpower;
// 캐릭터 마법(마법능력)
@property id magicalpower;
// 캐릭터 무기종류
@property id weapon;
//-------------------------------------------------------------------------------------------------
// 메서드 지정
// 소문자 작성
// 파라미터는 필요한 만큼 늘리면된다.
// 퀵헬프 작성 헤드파일에 작성

/**
 * 상대와 pvp를 뜬다.
 * @param pvp 무엇을
 * @param who 누구와
 */
- (id)pvp:(id)who;

/**
 * 상대방을 죽인다.
 * @param die 죽인다
 * @param who 누구를
 */
- (id)die:(id)who;

/**
 * 사냥한다.
 * @param hunt 사냥한다.
 */
- (id)hunt;
//-------------------------------------------------------------------------------------------------
@end
