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
    
    NSMutableArray *unSortedList = [[NSMutableArray alloc]initWithArray:list];
    
    self.totalSwitchCount = 0;
    self.totalCompareCount = 0;
    
    //리스트의 시작부터 끝까지 확인
    for(NSInteger i = 0; i<[unSortedList count]; i+= 1){
        
        //최소값 구하기
        NSInteger minValue = [unSortedList[i] integerValue];
        NSInteger minIndex = i;
        
        //i 다음번째의 숫자중 가장 작은수를 찾아내기
        for(NSInteger j = i; j < [unSortedList count]; j +=1){
            
            NSInteger compareValue = [unSortedList[j] integerValue];
            
            _totalCompareCount += 1;
            if(minValue > compareValue){
                minValue = compareValue;
                minIndex = j;
            }
        }
        
        //리스트의 데이터 교환
        //i번째는 minIndex로 minIndex는 i번째로
        if(i != minIndex){
            [unSortedList exchangeObjectAtIndex:i withObjectAtIndex:minIndex];
            _totalSwitchCount += 1;
        }
    }
    
    NSLog(@"비교 :  %ld / 교환 :%ld ",_totalCompareCount,_totalSwitchCount);
    
    return unSortedList;
}

@end
