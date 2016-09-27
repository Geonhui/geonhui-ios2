//
//  main.m
//  GeonHuinex7
//
//  Created by geon hui kim on 2016. 9. 27..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[]) {

    
    //Person *me = [[Person alloc] init];
    //구조체를 불러오고
    struct character to;
    //값을 지정해주고
    to.height = 30;
    to.weight = 180;
    //그 값을 cgfloat으로 받고 받은 변수로 표현
    CGFloat myHeight = to.height;
    CGFloat myWeight = to.weight;
    NSLog(@"%lf, %lf", myHeight, myWeight);
    
    
    
    return 0;
}
