//
//  DataSave.m
//  UserDataChangeSave
//
//  Created by geon hui kim on 2016. 11. 7..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "DataSave.h"

@implementation DataSave

//싱글턴
+ (instancetype)shaerdData
{
    static DataSave *userdata = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        userdata = [[self alloc] init];
    });
    return userdata;
}

- (BOOL)editdata:(NSString *)firstname lastname:(NSString *)lastname age:(NSString *)age havi:(NSString *)havi
{
    NSUserDefaults *saveEdit = [NSUserDefaults standardUserDefaults];
    [saveEdit setObject:firstname forKey:@"firstname"];
    [saveEdit setObject:lastname forKey:@"lastname"];
    [saveEdit setObject:age forKey:@"age"];
    [saveEdit setObject:havi forKey:@"havi"];
    [saveEdit synchronize];
    return YES;
}

@end
