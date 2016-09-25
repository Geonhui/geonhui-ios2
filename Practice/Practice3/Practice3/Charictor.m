//
//  Charictor.m
//  Practice3
//
//  Created by geon hui kim on 2016. 9. 25..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "Charictor.h"

@implementation Charictor

- (instancetype)initWithcharictorName:(NSString*)charictorName { // 캐릭터 이름

    self = [super init];
    
    self.charictorName = charictorName;
    
    return self;
}

- (instancetype)initWithcharictorName:(NSString *)charictorName
                               health:(NSInteger)health { //캐릭터이름, 피

    self = [super init];
    
    self.charictorName = charictorName;
    self.health = health;
    
    return self;
}


- (instancetype)initWithcharictorName:(NSString *)charictorName
                               attack:(NSInteger)attack
                              defence:(NSInteger)defence { //캐릭터이름, 공격력, 방어력

    self = [super init];
    
    self.charictorName = charictorName;
    self.attack = attack;
    self.defence = defence;
    
    return self;
}
    
    - (instancetype)initWithcharictorName:(NSString *)charictorName
                               attack:(NSInteger)attack
                              defence:(NSInteger)defence
                                     skil:(NSString *)skil { //캐릭터이름, 공격력, 방어력, 스킬

        self = [super init];
        
        self.charictorName = charictorName;
        self.attack = attack;
        self.defence = defence;
        self.skill = skil;
        
        return self;
    }

@end
