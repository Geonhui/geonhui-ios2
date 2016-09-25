//
//  Hit.m
//  Practice3
//
//  Created by geon hui kim on 2016. 9. 25..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "Hit.h"

@implementation Hit

- (instancetype)initWithuserName:(NSString *)userName { //사용자 이름
    
    self = [super init];
    
    self.userName = userName;
    return self;
}
    
    
- (instancetype)initWithuserName:(NSString *)userName
                     phoneNumber:(NSInteger)phoneNumber { //사용자 이름, 전화번호

    self = [super init];
    
    self.userName = userName;
    self.phoneNumber = phoneNumber;
    return self;
}

    
    
- (instancetype)initWithuserName:(NSString *)userName
                     phoneNumber:(NSInteger)phoneNumber
                       phoneType:(NSString *)phoneType { //사용자이름, 전화번호, 폰타입

    self = [super init];
    
    self.userName = userName;
    self.phoneNumber = phoneNumber;
    self.phoneType = phoneType;
    return self;
}




@end
