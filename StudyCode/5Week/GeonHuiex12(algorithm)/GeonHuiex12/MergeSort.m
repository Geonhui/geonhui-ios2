//
//  MergeSort.m
//  GeonHuiex12
//
//  Created by geon hui kim on 2016. 10. 9..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "MergeSort.h"

@implementation MergeSort
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.totalSwitchCount = 0;
        self.totalCompareCount = 0;
    }
    return self;
}

//나누기

-(NSArray *)mergeSort:(NSArray *)list{
    
    if(list.count < 2){
        return list;
    }
    
    //중앙지점
    NSInteger centerIndex = list.count/2;
    
    //left
    //nsmakerange는 0부터 ~ 어디까지가 아니라 0부터 어디까지의 갯수를 정한다.
    NSRange lRange = NSMakeRange(0, centerIndex);
    NSArray *leftList = [list subarrayWithRange:lRange];
    
    //right
    NSRange rRange = NSMakeRange(centerIndex, list.count-centerIndex);
    NSArray *rightList = [list subarrayWithRange:rRange];
    
    self.totalSwitchCount+=1;
    
    return [self mergeLeftList:[self mergeSort:leftList] rightList:[self mergeSort:rightList]];
    
}

//합치기

-(NSArray *)mergeLeftList:(NSArray *)lList rightList:(NSArray *)rList{
    
    NSMutableArray *leftUnSorted = [NSMutableArray arrayWithArray:lList];
    NSMutableArray *rightUnSorted = [NSMutableArray arrayWithArray:rList];
    
    NSMutableArray *sortedList = [NSMutableArray arrayWithCapacity:lList.count + rList.count];
    
    
    while(leftUnSorted.count != 0 || rightUnSorted.count != 0){
        
        
        
        if(leftUnSorted.count == 0){
            //오른쪽 리스트에만 값이 있을때
            [sortedList addObject:rightUnSorted[0]];
            [rightUnSorted removeObjectAtIndex:0];
        }else if(rightUnSorted.count == 0){
            //왼쪽 리스트에만 값이 있을때
            [sortedList addObject:leftUnSorted[0]];
            [leftUnSorted removeObjectAtIndex:0];
        }else{
            //아직 두 리스트에 값이 있을때
            NSInteger leftValue = [leftUnSorted[0] integerValue];
            NSInteger rightValue = [rightUnSorted[0] integerValue];
            
            if(leftValue < rightValue){
                //왼쪽 리스트의 값이 작은 경우
                [sortedList addObject:leftUnSorted[0]];
                [leftUnSorted removeObjectAtIndex:0];
            }else if(leftValue > rightValue){
                //오른쪽 리스트의 값이 작은 경우
                [sortedList addObject:rightUnSorted[0]];
                [rightUnSorted removeObjectAtIndex:0];
                
            }else{
                //두 값이 같은 경우
                [sortedList addObject:leftUnSorted[0]];
                [leftUnSorted removeObjectAtIndex:0];
                [sortedList addObject:rightUnSorted[0]];
                [rightUnSorted removeObjectAtIndex:0];
                
            }
        }
    }
    
    self.totalCompareCount += 1;
    
    NSLog(@"merge : %ld, divide : %ld",self.totalCompareCount,self.totalSwitchCount);
    
    return sortedList;
}
@end
