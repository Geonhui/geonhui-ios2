//
//  DlinkdList.h
//  GeonHuiex8
//
//  Created by geon hui kim on 2016. 9. 28..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Node.h"
@interface DlinkdList : NSObject
//        노드   헤더포인터
@property Node *header;

@property NSInteger lastIndex;
@property NSInteger firstIndex;

// 노드 전부를 출력한다.
- (void)printAllNode;
// 제일 마지막에 노드를 추가 한다.
// 재귀함수를 사용
- (void)addLastValue:(NSInteger)value;
- (void)addLastIndexNode:(Node *)nowNode newValue:(NSInteger)value;
// 제일 첫번째에 노드를 추가 한다.
- (void)addFirstValue:(NSInteger)newValue;
// 제일 마지막에 있는 노드를 삭제 한다.
- (void)removeLastNode:(Node *)nowNode;
// 




@end
