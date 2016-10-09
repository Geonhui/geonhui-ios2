//
//  IncertSort.m
//  GeonHuiex12
//
//  Created by geon hui kim on 2016. 10. 9..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "IncertSort.h"

@implementation IncertSort
// 삽입정렬
-(NSArray *)insertSort:(NSArray *)list{
    
    NSMutableArray *unSortedList = [[NSMutableArray alloc]initWithArray:list];
    NSInteger listLength = [unSortedList count];
    
    for(NSInteger i = 0; i< listLength-1; i++){
        
        //i번째 배열이 i+1번째 배열보다 크면 compare에 저장
        if(unSortedList[i] > unSortedList[i+1]){
            
            NSInteger compareNumber = [unSortedList[i+1] integerValue];
            
            for(NSInteger j=0; j<=i; j+=1 ){
                
                //j번째의 데이터가 compareNumber보다 크면
                if([unSortedList[j] integerValue] > compareNumber){
                    
                    //compareNumber의 index를 지우고
                    [unSortedList removeObjectAtIndex:i+1];
                    NSString *num = [NSString stringWithFormat:@"%ld",compareNumber];
                    
                    //j번째에 compareNumber을 넣는다.
                    [unSortedList insertObject:num atIndex:j];
                    
                    //그리고 for문(반복문)을 빠져나간다.
                    break;
                    
                }
            }
        }
        
    }
    
    return unSortedList;
}
@end
