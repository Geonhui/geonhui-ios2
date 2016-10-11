//
//  Selection.m
//  GeonHuiex12
//
//  Created by geon hui kim on 2016. 10. 7..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "Selection.h"

@implementation Selection

- (NSArray *)sort:(NSArray *)list
{
    //뮤터블어레이를 하나 생성한다.
    NSMutableArray *unSortedList = [[NSMutableArray alloc]initWithArray:list];
    
    self.totalSwitchCount = 0;   //스위치카운트 초기화
    self.totalCompareCount = 0;  //비교카운트 초기화
    
    //리스트의 시작부터 끝까지 확인, 어레이는 중괄호
    for(NSInteger i = 0; i < [unSortedList count]; i += 1){
        
        //최소값 구하기
        //제일앞의 숫자를 임의로 제일작은수로 지정
        //minvalue에 unSortedList[i]에 들어가있는 값을 넣어준다. 타입은 integer
        NSInteger minValue = [unSortedList[i] integerValue];
        //minindex에는 i의 인덱스번호를 넣어준다.
        NSInteger minIndex = i;
        
        //i 다음번째의 숫자중 가장 작은수를 찾아내기
        //i에서 시작해서 unsortlist count 어레이 전부의 값을 전부확인 후 j를 1씩 올린다.
        for(NSInteger j = i; j < [unSortedList count]; j += 1){
            //comparevalue 변수에 j의 값을 넣어준다.
            NSInteger compareValue = [unSortedList[j] integerValue];
            //totalcompareCount프로퍼티 값을 1씩 올린다.
            _totalCompareCount += 1;
            //minvalue가 compareValue보다 클 경우
            if(minValue > compareValue){
                //minValue에 compareValue의 값을 넣어준다.
                minValue = compareValue;
                //minIndex에 j를 넣어준다.
                minIndex = j;
            }
        }
        //리스트의 데이터 교환
        //i번째는 minIndex로 minIndex는 i번째로
        //i가 minIndex가 아닐경우
        if(i != minIndex){
            //i의 인덱스와 minIndex의 위치를 바꿈
            [unSortedList exchangeObjectAtIndex:i withObjectAtIndex:minIndex];
            _totalSwitchCount += 1;
        }
    }
    
    NSLog(@"비교 :  %ld / 교환 :%ld ",_totalCompareCount,_totalSwitchCount);
    
    return unSortedList;
}

@end
