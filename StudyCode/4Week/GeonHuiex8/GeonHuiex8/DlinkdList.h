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






- (void)printAllNode;
- (void)addLastValue:(NSInteger)value;
- (void)addFirstValue:(NSInteger)newValue;
- (void)removeLastNode:(Node *)nowNode;
- (void)addLastIndexNode:(Node *)nowNode newValue:(NSInteger)value;



@end
