//
//  Hit.h
//  Practice3
//
//  Created by geon hui kim on 2016. 9. 25..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Hit : NSObject

@property NSString *userName;    //사용자 이름
@property NSInteger phoneNumber;  //사용자 전화번호
@property NSString *phoneType;    //사용자 핸드폰종류

- (instancetype)initWithuserName:(NSString *)userName; //사용자 이름

- (instancetype)initWithuserName:(NSString *)userName
                     phoneNumber:(NSInteger)phoneNumber; //사용자 이름, 전화번호

- (instancetype)initWithuserName:(NSString *)userName
                     phoneNumber:(NSInteger)phoneNumber
                       phoneType:(NSString *)phoneType; //사용자이름, 전화번호, 폰타입

@end
