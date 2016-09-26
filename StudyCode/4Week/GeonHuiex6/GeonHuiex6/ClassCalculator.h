//
//  ClassCalculator.h
//  GeonHuiex6
//
//  Created by geon hui kim on 2016. 9. 26..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ClassCalculator : NSObject


@property NSInteger totalScor;  // 총점
@property NSInteger subjectCount; //과목카운트

- (void)addScore:(NSInteger)score; //과목점수 추가
- (CGFloat)average; //평균







@end
