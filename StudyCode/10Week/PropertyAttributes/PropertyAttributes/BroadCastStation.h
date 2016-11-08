//
//  BroadCastStation.h
//  PropertyAttributes
//
//  Created by geon hui kim on 2016. 11. 8..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Musician;

@interface BroadCastStation : NSObject

//프로퍼티 속성을 (retain)을 걸어줄경우 프로퍼티만 생성할경우 retaincount가 1 증가한다.
//(unsafe_unretained) retaincount는 상관없다.
@property (unsafe_unretained) Musician *musician;





@end
