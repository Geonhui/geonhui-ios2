//
//  DataCenter.h
//  TestPage
//
//  Created by geon hui kim on 2016. 11. 2..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataCenter : NSObject

//싱글턴 만들기
+ (instancetype)sharedManger;

//
- (BOOL)joinUserID:(NSString *)userID userPW:(NSString *)userPW;
- (BOOL)haveUserID:(NSString *)userID userPW:(NSString *)userPW;

//
- (void)setAutoLogin:(BOOL)flag;
- (BOOL)isAutoLogin;

//
- (void)setUserID:(NSString *)userID;
- (NSString *)userID;

//싱글턴 보기
- (void)print;

@end
