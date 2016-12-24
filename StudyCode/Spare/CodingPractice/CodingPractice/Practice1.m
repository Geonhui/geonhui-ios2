//
//  Practice1.m
//  CodingPractice
//
//  Created by geon hui kim on 2016. 12. 21..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "Practice1.h"

@implementation Practice1
{
    //인스턴스 변수
    NSInteger no;
    NSInteger de;
}

- (void)print;
{
    NSLog(@"value : %ld/%ld", self.numerator, self.denominator);
}

- (void)setNumerator:(NSInteger)n
{
    no = n;
}

- (void)setDenominator:(NSInteger)d
{
    de = d;
}

- (NSInteger)numerator
{
    return no;
}

- (NSInteger)denominator
{
    return de;
}

@end
