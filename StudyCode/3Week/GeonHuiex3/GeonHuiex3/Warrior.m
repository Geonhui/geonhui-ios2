//
//  Warrior.m
//  GeonHuiex3
//
//  Created by geon hui kim on 2016. 9. 21..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//
// 연결하고자 하는 클래스 헤드파일 임폴트
#import "Warrior.h"
#import "Wisserd.h"

@implementation Warrior
//                연결할 클래스
- (id)punchTo:(Wisserd *)who {
    
    // 마법사 시력가져오기
    // who.eyesight의 값을 originEyeSight에 복사한다.
    CGFloat originEyeSight = who.eyesight;
    
    // 주먹으로 마법사의 두눈을 때린다.
    // originEyeSisht - self.power값을 who.eyeSight에 넣어준다.
    who.eyesight = originEyeSight - self.power;
    
    // 시력을 xx만큼 잃었습니다.
    // 마법사 시력이 xx에서 xx으로 깍였다.
    // self.power(전사의원래값), originEyeSight(마법사프로퍼티에서 가져온값), who.eyesight(둘을 계산한 값)
    NSLog(@"전사가 마법사의 %lf만큼 눈을 갈겨서 기존시력을 %lf에서 %lf만큼 깍아서 안경을 쓰게끔 만들었다.",
          self.power, originEyeSight, who.eyesight);
    
    return nil;
}

-(id)petTo:(id)who whoName:(Dog*)name
{
    NSLog(@"%lf를 %@입양했다.", self.power, name);
    return nil;
}



@end
