//
//  main.m
//  Practice1
//
//  Created by geon hui kim on 2016. 9. 21..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import <Foundation/Foundation.h>
// 헤드파일 임폴트
#import "Car.h"
#import "Oilbank.h"
#import "Road.h"

int main(int argc, const char * argv[]) {

//   객체 생성, 초기화
//   프로퍼티 셋팅
//   클래스    변수            클래스   생성    초기화
    Car *geonHuiCar = [[Car alloc] init];
//   변수             프로퍼티          객체
    geonHuiCar.carMakerName = @"sm5";
    geonHuiCar.carName = @"소맥5";
    geonHuiCar.carType = @"세단";
    geonHuiCar.engineVolume = 2.0;
    
//   클래스      변수            클래스      생성    초기화
    Oilbank *custumoilbank = [[Oilbank alloc] init];
//   변수                프로퍼티         객체
    custumoilbank.makerName = @"농협주유소";
    custumoilbank.oilCategory = @"휘발유";
    custumoilbank.price = 50000;
    custumoilbank.serviceType = @"셀프";
    
//   클래스    변수          클래스   생성    초기화
    Road *highWay = [[Road alloc] init];
//   변수
    highWay.roadName = @"경부고속도로";
    highWay.roadSize = @"8차선";
    highWay.roadStyle = @"시멘트+아스팔트";
    
//   메서드 호출
    [geonHuiCar open: custumoilbank
     inTheCarWhatHappen: @"기름"
            whereDoor: @"주유구와 연료캡"];
    
    
    NSInteger number = 0 , i;
    for (i = 1; i <= 10; i += 1) {
        number = number + i;
        NSLog(@"%ld       %ld",number, i);
    }
    
    
    
    
    
    
    
    
    
    return 0;
}
