//
//  Wisserd.m
//  GeonHuiex3
//
//  Created by geon hui kim on 2016. 9. 21..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//
// 연결하고자 하는 클래스 헤드파일 임폴트
#import "Wisserd.h"
#import "Warrior.h"

@implementation Wisserd

//                연결할 클래스
- (id)skillMe:(Warrior *)who {
    
    // 공격당한 시력을 가져온다
    CGFloat afterEyeSight = self.eyesight;
    
    // 나의 마나만큼 깍인 시력을 다시 높인다.
    self.eyesight = self.mana;
    
    // 깍인만큼 안보여서 마나만큼 다시 올렸다.
    // aftereyesight(공격당하고 나서의 시력), self.mana(남아있던 마나)
    NSLog(@"안보여서 %lf를 다시 %lf만큼 다시 올렸다", afterEyeSight, self.mana);
    
    return nil;
    
}

@end
