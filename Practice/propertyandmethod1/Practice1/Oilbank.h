//
//  Oilbank.h
//  Practice1
//
//  Created by geon hui kim on 2016. 9. 21..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Car;
@interface Oilbank : NSObject

// 프로퍼티 지정
// 주유소 이름 (에스오일, 현대오일뱅크 등)
@property NSString *makerName;
// 주유소 판매 유종 (휘발유, 경유, 등유 등)
@property NSString *oilCategory;
// 주유소 기름 가격
@property NSInteger price;
// 주유소 서비스 타입 (셀프, 알바)
@property NSString *serviceType;

// 메서드 지정

/**
 * 내차에 맞는 기름을 어느량만큼 주유한다.
 * @param input 주유한다.
 * @param myCarTypeOil 맞는 유류
 * @param howMuch 주유량
 */
// 주유한다           나의 차에 맞는 유종을  넣을 기름량
- (id)input:(id)myCarTypeOil howMuch:(id)howMuch;

/**
 * 결제는 어떤걸로 하고, 영수증을 받을것인지 아닌지
 * @param payment 결제한다
 * @param everyMoney 돈의 종류
 * @param reciptNeed 영수증
 */
// 결제한다             돈의 종류        영수증 유/무
- (id)payment:(id)everyMoney reciptNeed:(id)reciptNeed;

/**
 * 세차를 어떻게 할것인가, 세차 순서를 기다리세요
 * @param carWash 세차한다.
 * @param whatSystem 세차방식
 * @param readyOrder 기다리는 순서
 */
// 세차한다             어떤 방식의 세차   기다리는 순서
- (id)carWash:(id)whatSystem readyOrder:(id)readyOrder;

@end
