//
//  MySingleturn.m
//  PrecompildeHeader
//
//  Created by geon hui kim on 2016. 10. 31..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "MySingleturn.h"

@implementation MySingleturn

//메서드 작성
+ (instancetype)sharedInstance
{
    static MySingleturn *instance = nil;
    static dispatch_once_t token = NULL;
    
    dispatch_once(&token, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (void)justMethod
{
    NSLog(@"just method");
}

@end
