//
//  Stack.h
//  GeonHuiex8
//
//  Created by geon hui kim on 2016. 10. 6..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Node.h"
@interface Stack : NSObject

@property Node *header;

@property NSInteger lastIndex;
@property NSInteger firstIndex;

@property NSInteger index;
@property NSInteger dataCount;
//스텍
- (void)push:(NSInteger)value;
- (void)pushFirst:(Node *)nowNode newValue:(NSInteger)value;
- (void)pop;
- (void)popLast:(Node*)node;

//큐
- (void)putFirstValue:(NSInteger)newValue;
- (NSInteger)get:(Node *)header;
@end
