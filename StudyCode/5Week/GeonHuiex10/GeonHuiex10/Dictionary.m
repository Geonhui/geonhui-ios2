//
//  Dictionary.m
//  GeonHuiex10
//
//  Created by geon hui kim on 2016. 10. 5..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "Dictionary.h"

@implementation Dictionary

//앨범이름 가져오기
+(NSString *)songTitle:(NSDictionary *)data
{
    NSDictionary *dic = [data objectForKey:@"album_info"];  //앨범인포 딕셔너리를 가져옴
    NSString *one = [dic valueForKey:@"title"];   //타이틀 스트링에 가져옴
    NSLog(@"%@", one); //타이틀 표현
    return one; //반환은 스트링
}

//노래제목 가져오기
+(NSArray *)songTileList:(NSDictionary *)data
{
    NSMutableArray *mut = [data objectForKey:@"song_list"]; //배열을 가져옴
    NSMutableArray *mut2; //어레이를 하나 만듬
    for (NSDictionary *dic2 in mut) {  //배열안의 딕셔너리를 다가져옴
        NSString *two = [dic2 valueForKey:@"name"]; //딕셔너리의 네임스트링을 가져옴
        [mut2 addObject:two]; //addObject 어레이에 집어 넣을때 씀
        NSLog(@"%@", two); //스트링으로 노래제목 표현
    }return mut2; //반환은 어레이
}

//노래 데이터 리스트
+(NSArray *)songDataList:(NSDictionary *)data
{
    NSMutableArray *mut3 = [data objectForKey:@"song_list"]; //배열을 가져옴
    NSMutableArray *mut4;  //어레이를 하나 만듬
    for (NSDictionary *dic3 in mut3) {  //배열안의 딕셔너리를 다가져옴
        NSDictionary *three = [dic3 objectForKey:@"song_info"];  //딕셔너리의 송인포 딕셔너리를 가져옴
        [mut4 addObject:three]; //어레이 안에 딕셔너리를 넣어줌
        NSLog(@"%@", three); //어레이로 표현
    }return mut4; //반환은 어레이
}

//제목입력시 가사
+(NSString *)lyricsSongTitleInput:(NSString *)title data:(NSDictionary *)data
{
    //송리스트 어레이에 접근
    NSMutableArray *mut5 = [data objectForKey:@"song_list"]; //배열을 가져옴
    NSString* name1 = title; //노래제목을 네임1에 보냄
    NSString* lyric1; //반환
    for (NSDictionary *dic4 in mut5) {  //배열안의 딕셔너리를 다 가져옴
        NSDictionary *dic5 = [dic4 objectForKey:@"song_info"]; //배열안의 딕셔너리의 송인포라는 딕셔너리를 가져옴
        NSString *name2 = [dic4 valueForKey:@"name"];   //이름을 가져옴
        if (name1 == name2) {   //입력한 타이틀과 딕셔너리의 제목이 같을때
        NSString *lyrics2 = [dic5 valueForKey:@"lyrics"]; //가사를 가져온다.
            NSLog(@"%@", lyrics2); // 스트링으로 표현
        }else
            NSLog(@"가사가 맞지 않습니다.");
    }return lyric1;
}

//제목입력시 재생시간
+(NSDate *)songTime:(NSString *)title data:(NSDictionary *)data
{
    NSMutableArray *mut6 = [data objectForKey:@"song_list"]; //배열을 가져옴
    NSString *name3 = title;
    for (NSDictionary *dic6 in mut6) {
        NSString *name4 = [dic6 valueForKey:@"name"];
        if (name3 == name4) {
            NSInteger time = [dic6 valueForKey:@"total_play_time"];
            NSLog(@"%ld", time);
        }else
            NSLog(@"0");
    }return data;
}


























@end
