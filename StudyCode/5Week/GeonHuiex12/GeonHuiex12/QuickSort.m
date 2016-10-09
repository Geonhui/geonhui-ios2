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
    
    // quick 정렬될 배열
    NSMutableArray *sortedArray = [[NSMutableArray alloc]init];
    
    NSMutableArray *lessArray = [[NSMutableArray alloc]init];
    NSMutableArray *greaterArray = [[NSMutableArray alloc]init];
    
    if([unSortedList count] <1){
        return nil;
    }
    
    //pivot 정하기
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
    
    
    [sortedArray addObjectsFromArray:[self quickSort: lessArray]];
    
    [sortedArray addObject:pivotValue];
    
    [sortedArray addObjectsFromArray:[self quickSort: greaterArray]];
    
    return sortedArray;
    
}
@end
