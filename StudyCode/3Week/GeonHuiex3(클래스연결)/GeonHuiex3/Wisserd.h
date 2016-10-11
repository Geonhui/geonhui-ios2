//
//  Wisserd.h
//  GeonHuiex3
//
//  Created by geon hui kim on 2016. 9. 21..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import <Foundation/Foundation.h>
// 연결하고자하는 클래스
@class Warrior;

@interface Wisserd : NSObject

//프로퍼티  객체타입지정
@property CGFloat eyesight;
@property NSInteger kg;
@property BOOL isdie;
@property CGFloat mana;

- (id)skillMe:who;
//- (id)fireTo:(Warrior *)who;
//- (id)earth:(NSString *)where;

@end
