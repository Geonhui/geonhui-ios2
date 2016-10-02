//
//  main.m
//  GeonHuiex
//
//  Created by geon hui kim on 2016. 9. 19..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Monster.h"
#import "youandi.h"
int main(int argc, const char * argv[]) {

    Monster *mon = [[Monster alloc]init];
    [mon attack];
    [mon defense];
    [mon support];
    [mon multiple];
    
    youandi *you = [[youandi alloc]init];
    [you sleep];
    [you eat];
    [you look];
    [you read];
    
    
    
    return 0;
}
