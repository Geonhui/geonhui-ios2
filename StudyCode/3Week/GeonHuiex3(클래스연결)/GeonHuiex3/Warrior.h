//
//  Warrior.h
//  GeonHuiex3
//
//  Created by geon hui kim on 2016. 9. 21..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import <Foundation/Foundation.h>
// 연결하고자하는 클래스
@class Wisserd;
@class Dog;

@interface Warrior : NSObject

//프로퍼티   객체타입 지정
@property NSUInteger height;
@property NSUInteger kg;
@property NSUInteger footsize;
@property CGFloat power;
@property BOOL isdead;

//               연결할려는 클래스
- (id)punchTo:(Wisserd *)who;          //위저드와 펀치로 싸운다.
- (id)kickTo:(Wisserd *)who;           //위처드와 킥으로 싸운다.
- (id)earth:(NSString *)where;         //어스공격을 어딘가에 쓴다.
-(id)petTo:(id)who whoName:(id)name;   //펫을 키운다 누가 그리고 그 이름은?

@end
