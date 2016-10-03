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
@property NSInteger health;          //피
@property NSInteger mana;            //마나
@property NSInteger physicalPower;   //물리공격력
@property NSInteger masicPower;      //마법공격력
@property BOOL isDead;               //죽었는지 살았는지
@property NSString *name;            //이름
@property NSString *weapon;          //장비

// 상속할 메서드                        최상위 클래스 아래에 있는 모든 프로퍼티의 값을 불러온다.
- (id)PhysicalPowerAttackTo:(GameCharactor *)someone;





@end
