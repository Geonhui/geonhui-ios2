//
//  Selection.h
//  GeonHuiex12
//
//  Created by geon hui kim on 2016. 10. 7..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Selection : NSObject

//비교카운트
@property NSInteger totalCompareCount;
//스위치
@property NSInteger totalSwitchCount;

//선택정렬
- (NSArray*)sort:(NSArray *)list;


@end
