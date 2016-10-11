//
//  main.m
//  GeonHuiex12
//
//  Created by geon hui kim on 2016. 10. 7..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Selection.h"
#import "QuickSort.h"
#import "MergeSort.h"
#import "IncertSort.h"
#import "BubbleSort.h"
int main(int argc, const char * argv[]) {

    NSArray *data = @[@1,@5,@3,@2,@8,@10,@9,@7,@6,@4];
    
    Selection *sSort = [[Selection alloc]init];
    NSArray * sortedList = [sSort sort:data];
    NSLog(@"selectedSort: %@",sortedList);
    
    BubbleSort *bSort = [[BubbleSort alloc]init];
    NSArray *bSortedList = [bSort bubbleSort:data];
    NSLog(@"bubbleSort: %@",bSortedList);
    
    IncertSort *iSort = [[IncertSort alloc]init];
    NSArray *iSortedList = [iSort insertSort:data];
    NSLog(@"InsertSort: %@",iSortedList);
    
    MergeSort *mSort = [[MergeSort alloc]init];
    NSArray *mSortedList = [mSort mergeSort:data];
    NSLog(@"MergeSort: %@",mSortedList);
    
    QuickSort *qSort = [[QuickSort alloc]init];
    NSArray *qSortedList = [qSort quickSort:data];
    NSLog(@"QuickSort : %@", qSortedList);
    
    return 0;
}
