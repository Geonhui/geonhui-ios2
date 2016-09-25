//
//  Charictor.h
//  Practice3
//
//  Created by geon hui kim on 2016. 9. 25..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "Hit.h"

@interface Charictor : Hit

@property NSString *charictorName;  //캐릭터이름
@property NSInteger attack;    //공격력
@property NSInteger defence;   //방어력
@property NSInteger health;   //피
@property NSString *skill;   //스킬

- (instancetype)initWithcharictorName:(NSString*)charictorName; // 캐릭터 이름
- (instancetype)initWithcharictorName:(NSString *)charictorName
                               health:(NSInteger)health; //캐릭터이름, 피
- (instancetype)initWithcharictorName:(NSString *)charictorName
                               attack:(NSInteger)attack
                              defence:(NSInteger)defence; //캐릭터이름, 공격력, 방어력
- (instancetype)initWithcharictorName:(NSString *)charictorName
                               attack:(NSInteger)attack
                              defence:(NSInteger)defence
                                 skil:(NSString *)skill; //캐릭터이름, 공격력, 방어력, 스킬

@end
