//
//  Node.h
//  GeonHuiex8
//
//  Created by geon hui kim on 2016. 9. 28..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Node : NSObject

@property NSInteger value;

//다른 노드로 이동하기 위해서는 노드가 가지고 있는 포인터를 이용한다.
@property Node *next; //포인터 변수
@property Node *prev; //포인터 변수

@property NSInteger index;

@end
