//
//  main.m
//  GeonHuiex10
//
//  Created by geon hui kim on 2016. 10. 4..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Gugudan.h"
int main(int argc, const char * argv[]) {
    
    Gugudan *dandan = [[Gugudan alloc]init];
    [dandan mutiplicationTable:3];   //while문 구구단
    [dandan mutiplicationTable2:9];  //for문 구구단
    
    [dandan factorial:4];
    [dandan triangularNum:10];
    [dandan addAllNum:12345];
    [dandan game369:29];
    return 0;
}
