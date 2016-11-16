//
//  UserInformation.h
//  NetworkingMiniProject2
//
//  Created by geon hui kim on 2016. 11. 16..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInformation : NSObject

@property NSString *userId;
@property NSArray *imageInfoList;

//싱글턴
+ (instancetype)sharedUserInfo;

@end
