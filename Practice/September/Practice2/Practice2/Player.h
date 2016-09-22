//
//  Player.h
//  Practice2
//
//  Created by geon hui kim on 2016. 9. 22..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "Person.h"
// 선수클래스 자체의 메서드이기 때문에 인간클래스에서 상속받지 못하였으므로 개발자클래스의 파일을 임폴트하여야 한다.
#import "Deveroper.h"
// 인간클래스에서 상속받은 선수클래스
@interface Player : Person
// 선수클래스 자체의 메서드
//     선수클래스에서 개발자클래스로 메서드구현 표현
- (id)howMany:(Deveroper *)year;


@end
