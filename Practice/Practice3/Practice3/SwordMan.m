//
//  SwordMan.m
//  Practice3
//
//  Created by geon hui kim on 2016. 9. 25..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "SwordMan.h"
@class Charictor;
@implementation SwordMan

- (id)battle:(Charictor *)who {
    NSLog(@"%@와 전쟁을 한다.ㅎㅎ", who);
    return nil;
}

- (id)swordsmash:(Hit *)who {
    NSLog(@"%@에게 나의 초 필살기 소드스매시를 갈기겠다 ㅎ", who);
    return nil;
}

@end
