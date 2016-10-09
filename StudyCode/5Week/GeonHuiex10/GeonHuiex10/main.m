//
//  main.m
//  GeonHuiex10
//
//  Created by geon hui kim on 2016. 10. 4..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Gugudan.h"
#import "Dictionary.h"
int main(int argc, const char * argv[]) {
    
    @autoreleasepool {
        
        NSDictionary *aoaAlbum = @{@"album_info":@{@"title": @"Heart Attack",@"artist" : @"AOA",}, @"song_list" : @[@{
                                                                                                                        @"name":@"심쿵해", @"artist":@"AOA", @"total_play_time": @223,@"song_info":@{
                                                                                               @"writer":@"용감한 형제들",@"composer":@"Mr.강",@"lyrics":@"완전 반해 반해 버렸어요\n부드러운 목소리에\n반해 반해 버렸어요\n난 떨려\n(AOA Let's Go!)"}},@{@"name":@"Luv Me", @"artist":@"AOA", @"total_play_time": @252,@"song_info":@{@"writer":@"용감한 형제들",@"composer":@"JS",@"lyrics":@"Do it this do it this girl\nDo it this do it this hey\nDo it this do it this girl\n "}},@{@"name":@"한개", @"artist":@"AOA", @"total_play_time": @238,@"song_info":@{@"writer":@"용감한 형제들",@"composer":@"별들의 전쟁",@"lyrics":@"딱 하루만 더 내게 시간을 줘\n우리 내일 다시 헤어지자고\n너와 끼던 반지 한 개 아무 의미 없이 남아\n우린 아니라는 말에 세상이 끝나버릴 것만 같아\n "}}],@"producer":@"FNC엔터테인먼트",@"album_story":@"AOA 3rd Mini Album [Heart Attack] Information\n\nAOA, 이번엔 ‘섹시 스포티’다! 세 번째 미니 앨범 ‘Heart Attack’ 전격 발매\n\nAOA, 무더위 날려 버릴 상큼발랄 서머송 ‘심쿵해’로 7개월 만의 컴백\n\n"};
        //앨범제목
        [Dictionary songTitle:aoaAlbum];
        //노래제목
        [Dictionary songTileList:aoaAlbum];
        //노래 데이터리스트
        [Dictionary songDataList:aoaAlbum];
        //제목으로 가사가져오기
        [Dictionary lyricsSongTitleInput:@"심쿵해" data:aoaAlbum];
        //제목으로 재생시간 가져오기
        [Dictionary songTime:@"한개" data:aoaAlbum];

    }
    
    //날짜보여주기
    Dictionary *dicdic = [[Dictionary alloc]init];
    [dicdic testMethod];
    
//    Gugudan *dandan = [[Gugudan alloc]init];
//    [dandan mutiplicationTable:3];   //while문 구구단
//    [dandan mutiplicationTable2:9];  //for문 구구단
//    
//    [dandan factorial:4];  //팩토리얼 1에서 4까지 전부 곱하기
//    [dandan triangularNum:10];  //1에서 10까지 다 더하기 삼각수
//    [dandan addAllNum:12345];  //각 숫자를 전부 더하기
//    [dandan game369:29];  //3,6,9일때만 *하기
    
    return 0;
}
