//
//  UserInformation.h
//  ImageNetworking
//
//  Created by JoSeongGyu on 2016. 11. 9..
//  Copyright © 2016년 Jo Seong Gyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInformation : NSObject
//프로퍼티로 지정해서 데이터를 setter, getter로 이용
@property NSString *userId;
@property NSArray *imageInfoJSONArray;
//싱글턴
+ (instancetype)sharedUserInfo;

@end
