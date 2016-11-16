//
//  UserInformation.m
//  NetworkingMiniProject2
//
//  Created by geon hui kim on 2016. 11. 16..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "UserInformation.h"

@implementation UserInformation

//싱글턴 만들기
+ (instancetype)sharedUserInfo
{
    static UserInformation *userInfo = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        userInfo = [[UserInformation alloc] init];
    });
    return userInfo;
}

//


@end
