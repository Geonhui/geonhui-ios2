//
//  Car.h
//  Practice1
//
//  Created by geon hui kim on 2016. 9. 21..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import <Foundation/Foundation.h>
//연결하고자 하는 클래스
@class Oilbank;
@interface Car : NSObject

// 프로퍼티 지정
// 자동차 이름 (sm7, k7, macan, evopue 등)
@property NSString *carName;
// 자동차 메이커 이름 (람보르기니, 포르쉐, 기아, 삼성 등)
@property NSString *carMakerName;
// 자동차 엔진 cc (2.0, 1.6 등)
@property CGFloat engineVolume;
// 자동차 타입 (세단, 해치백, suv 등)
@property NSString *carType;

// 메서드 지정

/**
 * 차의 무엇인가를 동작하기 위해 전원을 켠다.
 * @param powerOn 전원을 켠다
 * @param inTheCar 차안의 모든것
 * @param whatControl 조작하기위해
 */
// 전원을 켠다          차안의 모든것   무엇을 하기위해
- (id)powerOn:(id)inTheCar whatControl:(id)whatControl;

/**
 * 차의 무엇인가를 동작을 멈추기 위해 전원을 끈다.
 * @param powerOff 전원을 끈다
 * @param inTheCar 차안의 모든것
 * @param whyOff 멈추기위해
 */
// 전원을 끈다           차안의 모든것    끌려는 이유
- (id)powerOff:(id)inTheCar whyOff:(id)whyOff;

/**
 * 차를 누구와 무슨일로 인해 어디를 갈것이다.
 * @param move 움직인다.
 * @param whereAreYouGoing 목적지
 * @param whatHappen 목적
 * @param togather 동승자
 */
// 움직인다         어디를 갈것인가           무슨일로                           누구와
- (id)move:(id)whereAreYouGoing whatHappen:(id)whatHappen togather:(id)togather;

/**
 * 차에 무엇인가가 들어오기때문에 뭐든 닫는다.
 * @param close 닫는다.
 * @param because 왜냐하면
 * @param whatComeInCar 무언가 차에 들어온다.
 */
// 닫는다            왜냐하면     무언가 차에 들어오기때문에
- (id)close:(id)because whatComeInCar:(id)whatComeInCar;

/**
 * 차안에 무엇인가 들어왔기 때문에 어딘가의 문을 열어야 한다.
 * @param open 열다.
 * @param because 왜냐하면
 * @param inTheCarWhatHappen 차의 상태
 * @param whereDoor 어떤 문
 */
// 열다            왜냐하면             차의 무슨일이 생겼기때문에                                 어디의 문을 열것인가(창문,문,선루프,트렁크,주유구)
- (id)open:(Oilbank *)because inTheCarWhatHappen:(id)inTheCarWhatHappen whereDoor:(id)whereDoor;

/**
 * 차안의 어떤상태를 해결하기 위해 어떤기능을 어떤 값으로 조절한다.
 * @param adjust 조절한다.
 * @param whatFunction 어떤기능
 * @param valueHowMany 어떤 값
 * @param finshSolution 무언가 해결완료
 */
// 조절하다          어떤기능을           어떤 값으로                             무엇이 해결이 완료됨
- (id)adjust:(id)whatFunction valueHowMany:(id)valueHowMany finshSolution:(id)finishSolution;

@end
