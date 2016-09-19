//
//  Macbook.h
//  GeonHuiex
//
//  Created by geon hui kim on 2016. 9. 19..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Macbook : NSObject

//맥북의 모델명
@property id model;
//맥북의 모니터 사이즈
@property id size;
//맥북의 년식
@property id year;
//맥북의 생산지
@property id producingarea;

//음악실행
- (id)music;
//영화실행
- (id)movie;
//메세지
- (id)massage;


@end
