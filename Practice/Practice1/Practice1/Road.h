//
//  Road.h
//  Practice1
//
//  Created by geon hui kim on 2016. 9. 21..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Road : NSObject

// 프로퍼티 지정
// 도로 이름 (경부, 중부, 88 등)
@property NSString *roadName;
// 도로 크기 (8차선, 4차선 등)
@property NSString *roadSize;
// 도로 스타일 (아스팔트, 시멘트 등)
@property NSString *roadStyle;

// 메서드 지정
//     도로위에 차가 다닌다    몇대가      어느 기간에
- (id)carDriving:(id)howMany anyPeriod:(id)anyPeriod;
//     차를 보다        어떤 목적으로      구동시간                   어떤것이 보고있나 (경찰, 카메라, cctv)
- (id)LookCar:(id)whatPurpose runTime:(id)runTime whoeye:(id)whoeye;
//     도로위의 죽음       왜 죽나     누가 죽었나
- (id)RoadKill:(id)whyKill whoKill:(id)whoKill;




@end
