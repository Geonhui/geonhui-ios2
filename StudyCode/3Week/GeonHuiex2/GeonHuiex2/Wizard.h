//
//  Wizard.h
//  GeonHuiex2
//
//  Created by geon hui kim on 2016. 9. 20..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//
//-------------------------------------------------------------------------------------------------
#import <Foundation/Foundation.h>
// 클래스 정의
// Wizard클래스, 생성시 첫글짜는 대문자로
@interface Wizard : NSObject
//-------------------------------------------------------------------------------------------------
// 프로퍼티 지정
// 소문자 작성

// 캐릭터 피
@property id health;
// 캐릭터 마나
@property id mana;
// 캐릭터 피지컬(신체적인 능력)
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
 * 프로스트노바를 누군가에게 어느정도파워로 사용할것인가
 * @param who 누구에게
 * @param power 얼만큼의 피해를 줄것인가
 */
- (id)prostnova:(id)who power:(id)power;

/**
 * 파이어볼트를 몇발를 쏠것이고, 기본공격의 몇퍼센트로 공격할것인지
 * @param howmany 파이어볼트 몇발
 * @param percent 기본공격의 퍼센트
 */
- (id)firebolt:(id)howmany percent:(id)percent;

/**
 * 메테오를 어디에 어느크기로 쏠것인가
 * @param where 어디에
 * @param size 크기
 */
- (id)mateo:(id)where size:(id)size;
//-------------------------------------------------------------------------------------------------

@end
