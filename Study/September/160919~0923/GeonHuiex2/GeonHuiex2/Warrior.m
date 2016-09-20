//
//  Warrior.m
//  GeonHuiex2
//
//  Created by geon hui kim on 2016. 9. 20..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//
//-------------------------------------------------------------------------------------------------
#import "Warrior.h"

@implementation Warrior
//-------------------------------------------------------------------------------------------------
// Person의 메서드 구현
// 메서드호출 = 메세지보냄
// 파라미터를 이용하여 어떻게 할것인가를 추가할수있다.(매개변수)
// 파라미터 연장시 : - (id)swimming:(id)where who:(id)who how:(id)how 이런식으로 연장
// %@ < 문자로그 후 추가된 파라미터적어주면됨
- (id)pvp:(id)who {
    NSLog(@"%@를 죽여",who);
    return nil;
}

- (id)die {
    NSLog(@"디짐");
    return nil;
}

- (id)hunt {
    NSLog(@"사냥");
    return nil;
}
//-------------------------------------------------------------------------------------------------

@end
