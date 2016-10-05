//
//  Gugudan.h
//  GeonHuiex10
//
//  Created by geon hui kim on 2016. 10. 4..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Gugudan : NSObject

//구구단 구현 while문
- (void)mutiplicationTable:(NSInteger)dan;
//구구단 구현 for문
- (void)mutiplicationTable2:(NSInteger)dan;
//팩토리얼
- (void)factorial:(NSInteger)value;
//삼각수 구하기
- (void)triangularNum:(NSInteger)value;
//각 자리수 더하기
- (void)addAllNum:(NSInteger)value;
//3,6,9의 배수는 *로 표시하고, 나머지는 숫자로 표시
- (void)game369:(NSInteger)value;


@end
