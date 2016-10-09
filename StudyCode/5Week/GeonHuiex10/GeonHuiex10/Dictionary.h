//
//  Dictionary.h
//  GeonHuiex10
//
//  Created by geon hui kim on 2016. 10. 5..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dictionary : NSObject

//데이터분석
//앨범이름 가져오기
+(NSString *)songTitle:(NSDictionary *)data;
//노래 제목
+(NSArray *)songTileList:(NSDictionary *)data;
//노래 데이터리스트
+(NSArray *)songDataList:(NSDictionary *)data;
//제목 입력시 가사
+(NSString *)lyricsSongTitleInput:(NSString *)title data:(NSDictionary *)data;
//제목 입력시 재생시간
+(NSNumber *)songTime:(NSString *)title data:(NSDictionary *)data;

//날짜보여주기
- (void)testMethod;
@end
