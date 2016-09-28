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
    
    // 마지막에 데이터의 추가를 호출
    [doo addLastValue:123];
    [doo addLastValue:324];
    [doo addLastValue:434];
    
    // 첫번째에 데이터의 추가를 호출
    [doo addFirstValue:120];
    
    // 제일 마지막 데이터를 삭제
    [doo removeLast];
    
    // 데이터 전부를 출력
    [doo printAllNode];
    

    
    
    
    
    
    
//    Array 문법
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
