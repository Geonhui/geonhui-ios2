//
//  Car.m
//  Practice1
//
//  Created by geon hui kim on 2016. 9. 21..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "Car.h"
//연결할 헤더파일 임폴트
#import "Oilbank.h"

@implementation Car

//            연결할 클래스
//   차의 기름이 없어서 농협주유소에 왔다. 기름을 넣어야 하기 때문에 주유구를 열어야한다.
- (id)open:(Oilbank *)because inTheCarWhatHappen:(id)inTheCarWhatHappen whereDoor:(id)whereDoor; {

//   타입      별  변수이름          <값전송>  메서드   프로퍼세팅의 값
//   문자타입으로 된 오일뱅크 포지션 방     <=  프로퍼티에 세팅된 오일뱅크의 메이커이름
//          !!변수이름 앞자리 무조건 소문자!!
    NSString *oilBankPosition = because.makerName;
//        "none" < "농협주유소"전달    <=      "농협주유소"
    
//           메서드호출 지정           연결클래스 값   메서드호출 지정
    NSLog(@"차에 %@이 없어서 24시 영업하는 %@에 왔다.    %@을 열고 기름을 넣는다.", inTheCarWhatHappen, oilBankPosition, whereDoor);
    
    return nil;
}




@end
