//
//  Gugudan.h
//  GeonHuiex10
//
//  Created by geon hui kim on 2016. 10. 4..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Gugudan : NSObject

//구구단 구현 while문
- (void)mutiplicationTable:(NSInteger)dan;
//구구단 구현 for문
- (void)mutiplicationTable2:(NSInteger)dan;
//팩토리얼
- (void)factorial:(NSInteger)value;
//삼각수 구하기
- (void)triangularNum:(NSInteger)value;
//각 자리수 더하기
- (void)addAllNum:(NSInteger)value;
//3,6,9의 배수는 *로 표시하고, 나머지는 숫자로 표시
- (void)game369:(NSInteger)value;

////데이터 분석
////앨범 이름가져오기
//- (NSString *)titleWithData:(NSDictionary *)data;
////노래의 제목들
//- (NSArray *)songTitles:(NSDictionary *)data;
////노래 데이터리스트 만들기
//- (NSArray *)songDatas:(NSDictionary *)data;
////제목 입력시 가사
//- (NSString *)lyricWithData:(NSDictionary *)data;
////제목 입력시 재생 시간
//- (NSData *)playTimeWithData:(NSDictionary *)data;
@end
