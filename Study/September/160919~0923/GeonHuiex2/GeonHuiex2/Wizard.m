//
//  Wizard.m
//  GeonHuiex2
//
//  Created by geon hui kim on 2016. 9. 20..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//
//-------------------------------------------------------------------------------------------------
#import "Wizard.h"

@implementation Wizard
//-------------------------------------------------------------------------------------------------
// Person의 메서드 구현
// 메서드호출 = 메세지보냄
// 파라미터를 이용하여 어떻게 할것인가를 추가할수있다.(매개변수)
// 파라미터 연장시 : - (id)swimming:(id)where who:(id)who how:(id)how 이런식으로 연장
// %@ < 문자로그 후 추가된 파라미터적어주면됨
- (id) prostnova:(id)who power:(id)power {
    NSLog(@"%@에게 %@만큼 얼려버리겠다",who,power);
    return nil;
}

- (id) firebolt:(id)howmany percent:(id)percent {
    NSLog(@"%@개를 기본공격의 %@추가하여 공격!",howmany,percent);
    return nil;
}

- (id) mateo {
    NSLog(@"메테오");
    return nil;
}

//-------------------------------------------------------------------------------------------------

@end
