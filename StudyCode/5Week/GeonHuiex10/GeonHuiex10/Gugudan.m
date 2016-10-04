//
//  Gugudan.m
//  GeonHuiex10
//
//  Created by geon hui kim on 2016. 10. 4..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "Gugudan.h"

@implementation Gugudan

//구구단 구현 while문 사용
- (void)mutiplicationTable:(NSInteger)dan
{   //1부터
    NSInteger danValue = 1;
    //10까지
    while (danValue < 10) {
        NSInteger total = dan * danValue;
        NSLog(@" %ld * %ld = %ld",dan, danValue, total);
        danValue+=1;
    }
}

//구구단 구현 for문 사용, ??에서 ~ ??까지
- (void)mutiplicationTable2:(NSInteger)dan
{
    for (NSInteger i = 1; i < 10; i += 1) {
        NSLog(@"%ld * %ld = %ld", dan, i, i * dan);
    }
}

//팩토리얼
- (void)factorial:(NSInteger)value
{   //n까지의 값을 구해야 하기때문에 for문에 value를 넣어준다
    NSInteger facValue = 1;
    //              1에서    value까지  i가 1개씩증가
    for (NSInteger i = 1; i <= value; i += 1) {
    //다 곱해야 한다.
     facValue = facValue * i;
    }NSLog(@"%ld", facValue);
}

//삼각수구하기
- (void)triangularNum:(NSInteger)value
{
    NSInteger triValue = 0;
    for (NSInteger i = 0; i <= 10; i += 1) {
        triValue = triValue + i;
    }NSLog(@"%ld", triValue);
}

//각 자리수 더하기
- (void)addAllNum:(NSInteger)value
{
    NSInteger addValue = 0;
    //value값이 0보다 크면 계속 동작
    while (value > 0) {
        //10으로 나누었을때 나머지값과 addValue값을 더한다
        addValue = addValue + value % 10;
        //value값을 10으로 나눈다.
           value = value / 10;
    }NSLog(@"%ld", addValue);
}

//3,6,9배수는 *로 표시되고 나머지는 숫자로 표시
- (void)game369:(NSInteger)value
{
    NSString *non = @"*";
    for (NSInteger i = 0; i < value; i += 1) {
        //10으로 나누었을때 3이거나 6이거나 9일때만 *를 한다
        if (i%10 == 3 || i%10 == 6 || i%10 == 9) {
            NSLog(@"%@", non);
        }else {
            //나머지는 그냥 숫자로 표시
            NSLog(@"%ld", i);
        }
    }
}
////데이터 분석
////앨범 이름가져오기
//- (NSString *)titleWithData:(NSDictionary *)data
//{
//    
//}
////노래의 제목들
//- (NSArray *)songTitles:(NSDictionary *)data
//{
//    
//}
////노래 데이터리스트 만들기
//- (NSArray *)songDatas:(NSDictionary *)data
//{
//    
//}
////제목 입력시 가사
//- (NSString *)lyricWithData:(NSDictionary *)data
//{
//    
//}
////제목 입력시 재생 시간
//- (NSData *)playTimeWithData:(NSDictionary *)data
//{
//    
//}

@end
