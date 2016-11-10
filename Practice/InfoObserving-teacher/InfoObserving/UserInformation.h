//
//  UserInformation.h
//  InfoObserving
//
//  Created by JoSeongGyu on 2016. 11. 7..
//  Copyright © 2016년 Jo Seong Gyu. All rights reserved.
//

#import <Foundation/Foundation.h>
//노티피케이션 이름 지정
//이름과 = 키값지정
static NSNotificationName const DidChangeHobbyValueNotification = @"DidChangedHobby";

//nsobject를 상속
@interface UserInformation : NSObject

//싱글턴 생성
+ (instancetype)sharedUserInfo;

//저장되는 프로퍼티 생성
@property NSString *userId;
@property NSString *userPassword;
@property NSString *lastName;
@property NSString *firstName;

//readonly getter만 생성
@property (readonly) NSString *fullName;
@property NSString *age;
@property NSString *hobby;

@end
