//
//  GameCharactor.h
//  GeonHuiex4
//
//  Created by geon hui kim on 2016. 9. 22..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import <Foundation/Foundation.h>
// 상속한 워리어, 위저드 연결클래스
@class Warrior;
@class Wissord;

// 최상위 클래스 NSObject
@interface GameCharactor : NSObject

// 상속할 프로퍼티, 최상위 클래스의 프로퍼티
@property NSInteger health;
@property NSInteger mana;
@property NSInteger physicalPower;
@property NSInteger masicPower;
@property BOOL isDead;
@property NSString *name;
@property NSString *weapon;

// 상속할 메서드                        최상위 클래스 아래에 있는 모든 프로퍼티의 값을 불러온다.
- (id)PhysicalPowerAttackTo:(GameCharactor *)someone;





@end
