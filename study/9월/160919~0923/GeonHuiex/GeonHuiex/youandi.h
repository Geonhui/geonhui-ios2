//
//  youandi.h
//  GeonHuiex
//
//  Created by geon hui kim on 2016. 9. 19..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface youandi : NSObject

//인간의 클래스 중 이름(풀네임)
@property id name;
//인간의 클래스 중 국적(모든나라)
@property id nationality;
//인간의 클래스 중 인종(흑인,백인,황인...)
@property id skincolor;
//인간의 클래스 중 사용중인 언어(국적어)
@property id language;

//잔다~
- (id)sleep;
//먹는다~
- (id)eat;
//보다~
- (id)look;
//읽다~
- (id)read;


@end

