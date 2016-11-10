//
//  UserInformation.m
//  InfoObserving
//
//  Created by JoSeongGyu on 2016. 11. 7..
//  Copyright © 2016년 Jo Seong Gyu. All rights reserved.
//

#import "UserInformation.h"

@implementation UserInformation

//싱글턴 생성
+ (instancetype)sharedUserInfo {
    static UserInformation *object = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        if (object == nil) {
            object = [[UserInformation alloc] init];
        }
    });
    return object;
}

//fullname getter에서 lastname, firstname을 합쳐서 넣어준다.
- (NSString *)fullName {
    return [NSString stringWithFormat:@"%@ %@", _lastName, _firstName];
}

//hobby setter에서 노티피케이션 센터에 등록을 한다.
- (void)setHobby:(NSString *)hobby {
    _hobby = hobby;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:DidChangeHobbyValueNotification object:self];
}

@end
