//
//  BubbleSort.m
//  GeonHuiex12
//
//  Created by geon hui kim on 2016. 10. 9..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "BubbleSort.h"

@implementation BubbleSort
-(NSArray *)bubbleSort:(NSArray *)list{
    
    NSMutableArray *unSortedList = [[NSMutableArray alloc]initWithArray:list];
    
    //배열의 길이
    NSInteger unSortedListLenght = [unSortedList count];
    
    //마지막부터 바로전까지
    for(NSInteger i=unSortedListLenght; i > 0; i =i-1){
        //처음부터 i까지
        for(NSInteger j = 0; j < i-1 ;j+=1){
            self.totalCompareCount+=1;
            
            //앞쪽에 있는 값이 크면 자리 변경
            if(unSortedList[j] > unSortedList[j+1]){
                
                self.totalSwitchCount+=1;
                [unSortedList exchangeObjectAtIndex:j withObjectAtIndex:j+1];
                
            }
            
        }
        
    }
    
    NSLog(@"switch : %ld, compareCount : %ld",self.totalSwitchCount,self.totalCompareCount);
    
    return unSortedList;
    
}
@end
