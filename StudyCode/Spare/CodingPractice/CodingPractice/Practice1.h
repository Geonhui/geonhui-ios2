//
//  Practice1.h
//  CodingPractice
//
//  Created by geon hui kim on 2016. 12. 21..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Practice1 : NSObject

//분수 구하기
//분자
@property (nonatomic) NSInteger numerator;
//분모
@property (nonatomic) NSInteger denominator;

- (void)print;
- (void)setNumerator:(NSInteger)n;
- (void)setDenominator:(NSInteger)d;

- (NSInteger)numerator;
- (NSInteger)denominator;

@end
