//
//  ClassCalculator.m
//  GeonHuiex6
//
//  Created by geon hui kim on 2016. 9. 26..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "ClassCalculator.h"

@implementation ClassCalculator

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.totalScor = 0;
        self.subjectCount = 0;
    }
    return self;
}

//점수를 받아서 토탈변수에 더한다
//더해진 점수마다 과목 카운트를 하나씩 올린다.
//void는 반환할 필요가 없다.
- (void)addScore:(NSInteger)score
{
    self.totalScor = self.totalScor + score;
    self.subjectCount = self.subjectCount + 1;
}

//평균을 구해서 반환 해준다.
- (CGFloat)average
{
    //                     캐스팅
    CGFloat averigeTemp = (CGFloat)self.totalScor/(CGFloat)self.subjectCount;
    
    return averigeTemp;
}
@end
