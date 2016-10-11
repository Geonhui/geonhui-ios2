//
//  QuickSort.m
//  GeonHuiex12
//
//  Created by geon hui kim on 2016. 10. 9..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "QuickSort.h"

@implementation QuickSort
-(NSArray *)quickSort:(NSArray *)unSortedList{
    
    NSMutableArray *unSortedMutable = [[NSMutableArray alloc]initWithArray:unSortedList];
    
    //quick 정렬될 배열
    NSMutableArray *sortedArray = [[NSMutableArray alloc]init];
    NSMutableArray *lessArray = [[NSMutableArray alloc]init];
    NSMutableArray *greaterArray = [[NSMutableArray alloc]init];
    
    if([unSortedList count] < 1){
        
        return nil;
    }
    
    //pivot 정하기
    //unSortedMutable의 Index 0번째 값을
    //pivotValue로 만들고 그 값을 unSortedMutable에서 지운다
    //pivotValue 보다 작으면 lessArray // 그 이외는 greaterArray
    NSNumber *pivotValue = [[NSNumber alloc]init];
    
    pivotValue = unSortedMutable[0];
    
    [unSortedMutable removeObjectAtIndex:0];
    
    for(NSNumber *num in unSortedMutable){
        
        if(num < pivotValue){
            [lessArray addObject:num];
        }else{
            [greaterArray addObject:num];
        }
        
    }
    
    //병합
    //결국 모든 값은 한번씩은 pivotValue가 되고 그 상태에서 정렬된 배열에 들어간다.
    [sortedArray addObjectsFromArray:[self quickSort: lessArray]];
    [sortedArray addObject:pivotValue];
    [sortedArray addObjectsFromArray:[self quickSort: greaterArray]];
    
    return sortedArray;
    
}
@end
