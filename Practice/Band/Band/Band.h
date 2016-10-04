//
//  Band.h
//  Band
//
//  Created by geon hui kim on 2016. 9. 20..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Band : NSObject

// 밴드 프로퍼티
// 밴드명
@property id bandname;
// 사용자 이름
@property id username;
// 사용자 폰 번호
@property id phonenumber;
// 사용자 아이디
@property id loginid;



// 밴드 메서드
// 접속
/**
 * 밴드 접속과 로그인에 사용됩니다.
 * @param connect 접속 
 * @param where 어디로
 * @param why 왜?
 */
- (id)connect:(id)where why:(id)why;

// 찾기
/**
 * 밴드와 사용자 찾기에 사용됩니다.
 * @param serch 찾기
 * @param what 무엇을 (친구명,밴드명)
 */
- (id)serch:(id)what;

// 채팅
/**
 * 채팅에 사용됩니다.
 * @param chatting  채팅
 * @param who 누구와
 */
- (id)chatting:(id)who;

// 설정
/**
 * 밴드에 관련된 설정을 합니다.
 * @param setting 설정
 * @param what 무엇을 설정
 */
- (id)setting:(id)what;

// 파일(사진,댓글,일정) 업,다운로드
/**
 * 파일 업로드, 다운로드에 사용됩니다
 * 사진, 동영상, 댓글, 일정
 * @param file 파일(사진, 동영상, 댓글, 일정)
 * @param what 무엇을
 * @param howmany 수량, 얼마나?
 */
- (id)file:(id)what howmany:(id)howmany;

@end
