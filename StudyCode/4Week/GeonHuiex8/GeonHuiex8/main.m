//
//  main.m
//  GeonHuiex8
//
//  Created by geon hui kim on 2016. 9. 28..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import <Foundation/Foundation.h>
//구현하기위해 클래스들을 임폴트 한다.
#import "DlinkdList.h"
#import "Node.h"
int main(int argc, const char * argv[]) {

    
    DlinkdList *doo = [[DlinkdList alloc] init];
    
    [doo addLastValue:123];
    [doo addLastValue:324];
    [doo addLastValue:434];
    
    [doo printAllNode];
    
// Array 문법
//    NSInteger intList[5] = {1,2,3,4,5};
//    NSLog(@"%ld", intList[3]);
//    
//    CGFloat floatList[10] = {3.1, 3.2, 3.3};
//    NSLog(@"%lf", floatList[2]);
//    
//    char name[8] = "geonhui\0";
//    NSLog(@"%s", name);
    
    
    
    
    
    return 0;
}
