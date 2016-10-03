//
//  Person.h
//  GeonHuiex2
//
//  Created by geon hui kim on 2016. 9. 20..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

//-------------------------------------------------------------------------------------------------
#import <Foundation/Foundation.h>
// 클래스 정의
// person클래스, 생성시 첫글짜는 대문자로
@interface Person : NSObject
//-------------------------------------------------------------------------------------------------
// 프로퍼티 지정
// 소문자 작성
@property id name;
@property id server;
@property id sex;
//-------------------------------------------------------------------------------------------------
// 메서드 지정
// 소문자 작성
// 파라미터는 필요한 만큼 늘리면된다.
// 퀵헬프 작성 헤드파일에 작성

/**
 * 상대방과 술을 마신다.
 * @param something 무엇을
 * @param with 누구와 같이
 */
//   마신다    무엇을(상세파라미터)    추가파라미터
- (id)drink:(id)something with:(id)with;

/**
 * 누군가와 야구를 한다.
 * @param who 누구와
 */
- (id)playbaseball:(id)who;

/**
 * 족구내기를 해서 승자를 가린다
 * @param who 누구와
 * @param winner 승자
 */
- (id)playjocku:(id)who winner:(id)winner;

/**
 * 어디에서 누구와 어떻게 얼마나 수영을 하고 그러기위해서 필요한것
 * @param where 어디서
 * @param who 누구와
 * @param how 어떻게
 * @param howmany 얼마나
 * @param need 필요한
 */
- (id)swimming:(id)where who:(id)who how:(id)how howmany:(id)howmany need:(id)need;
//-------------------------------------------------------------------------------------------------
- (id)dance:(id)where when:(id)when becuase:(id)becuase who:(id)who;
- (id)love:(id)who howmany:(id)howmany;
@end
