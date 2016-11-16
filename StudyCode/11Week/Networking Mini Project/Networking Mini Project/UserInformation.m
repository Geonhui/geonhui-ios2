//
//  UserInformation.m
//  Networking Mini Project
//
//  Created by geon hui kim on 2016. 11. 15..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "UserInformation.h"

@implementation UserInformation

//싱글턴
+ (instancetype)ShardData
{
    static UserInformation *userdata = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        userdata = [[self alloc] init];
    });
    return userdata;
}

//유저 데이터 저장
- (BOOL)userData:(NSString *)userNumber
{
    NSUserDefaults *data = [NSUserDefaults standardUserDefaults];
    [data setObject:userNumber forKey:@"Number"];
    [data synchronize];
    return YES;
}

@end
