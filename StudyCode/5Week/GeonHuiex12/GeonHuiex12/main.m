//
//  main.m
//  GeonHuiex12
//
//  Created by geon hui kim on 2016. 10. 7..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Selection.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *data = @[@1,@3,@8,@31,@4,@6,@7,@9];
        
        Selection *sec = [[Selection alloc]init];
        NSArray *sortedList = [sec sort:data];
        NSLog(@"%@", sortedList);
    }
    return 0;
}
