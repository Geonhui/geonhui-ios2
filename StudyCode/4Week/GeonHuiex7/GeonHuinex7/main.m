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
    
    //객체를 생성
    Person *toto = [[Person alloc]init];
    //변수에 구조체 값을 지정
    [toto setHeight:70.6 weight:90.1];
    //출력을 실수형으로 표현, 변수의 구조체 프로퍼티의 값을 표현
    NSLog(@"%lf, %lf", toto.info.height, toto.info.weight);
    
    return 0;
}
