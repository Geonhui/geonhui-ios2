//
//  Person.m
//  GeonHuiex2
//
//  Created by geon hui kim on 2016. 9. 20..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//
//-------------------------------------------------------------------------------------------------
#import "Person.h"
// 클래스 구현
@implementation Person
//-------------------------------------------------------------------------------------------------
// Person의 메서드 구현
// 메서드호출 = 메세지보냄
// 파라미터를 이용하여 어떻게 할것인가를 추가할수있다.(매개변수)
- (id)drink:(id)something with:(id)with {
    NSLog(@"%@를 %@와 마신다", something, with);
    return nil;
}

- (id)playbaseball:(id)who {
    NSLog(@"%@와 야구한다", who);
    return nil;
}
// 파라미터 연장시 : - (id)swimming:(id)where who:(id)who how:(id)how 이런식으로 연장
// %@ < 문자로그 후 추가된 파라미터적어주면됨
- (id)playjocku:(id)who winner:(id)winner {
    NSLog(@"%@랑 족구내기해서 %@가 이겼다",who,winner);
    return nil;
}

- (id)swimming:(id)where who:(id)who how:(id)how howmany:(id)howmany need:(id)need {
    NSLog(@"%@에서 %@들과 %@하게 수영을 한당 %@~~ 그러기 위해서는 %@이 필요하다",where,who,how,howmany,need);
    return nil;
}
//-------------------------------------------------------------------------------------------------
- (id)dance:(id)where when:(id)when becuase:(id)becuase who:(id)who
{
    NSLog(@"%@에서 %@날 %@때문에 %@춤을춘다.", where, when, becuase, who);
    return nil;
}

- (id)love:(id)who howmany:(id)howmany
{
    NSLog(@"나는 %@를 %@만큼 사랑한다.", who, howmany);
    return nil;
}


@end
