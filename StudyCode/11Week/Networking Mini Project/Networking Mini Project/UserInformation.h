//
//  UserInformation.h
//  Networking Mini Project
//
//  Created by geon hui kim on 2016. 11. 15..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInformation : NSObject

//싱글턴
+ (instancetype)ShardData;

//유저 숫자
- (BOOL)userData:(NSString *)userNumber;

@end
