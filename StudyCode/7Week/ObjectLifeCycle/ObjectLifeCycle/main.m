//
//  main.m
//  ObjectLifeCycle
//
//  Created by geon hui kim on 2016. 10. 20..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyClass.h"

int main(int argc, const char * argv[]) {

    MyClass *instance = [[MyClass alloc]init];
    NSLog(@"%@", instance);
    instance = nil;
    
    NSLog(@"end");
    
    return 0;
}
