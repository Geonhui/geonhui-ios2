//
//  DlinkdList.m
//  GeonHuiex8
//
//  Created by geon hui kim on 2016. 9. 28..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "DlinkdList.h"

@implementation DlinkdList

//초기화
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.header = [[Node alloc] init];
        self.header.next = nil;
        self.header.prev = nil;
        self.lastIndex = 0;
    }
    return self;
}

//add (마지막에 데이터를 추가한다)
//리스트 마지막에 추가하는 방법
- (void)addLastValue:(NSInteger)value
{// 구현
    [self addLastIndexNode:self.header newValue:value];
}
// 나우노드는 헤더이다 
- (void)addLastIndexNode:(Node *)nowNode newValue:(NSInteger)value
{
    //now Node(header)의 next가 nil이다.
    if (nowNode.next == nil) {
        //newnode라는 객체를 생성
        Node *newNode = [[Node alloc] init];
        //newnode에 value값을 넣어준다
        newNode.value = value;
        //nownode는 newnode의 이전node와 연결
        newNode.prev = nowNode;
        //newnode의 next노트의 값은 nil이다
        newNode.next = nil;
        
        newNode.index = self.lastIndex; //
        
        nowNode.next = newNode; //
        self.lastIndex = self.lastIndex + 1; //
    }else
    {//nil이 아니다.
        [self addLastIndexNode:nowNode newValue:value];
    }
}

//add (첫번째에 데이터를 추가한다)
//헤드 다음에 추가하는 방법
- (void)addFirstValue:(NSInteger)newValue
{
    Node *newNode = [[Node alloc] init];
    newNode.value = newNode;
    
    if (self.header.next == nil) {
        self.header.next = newNode;
        newNode.prev = self.header;
        newNode.next = nil;
    }else
    {//
        newNode.prev = self.header;
        newNode.next = self.header.next;
        self.header.next.prev = newNode;
        self.header.next = newNode;
    }
}

//printNode(모든 노드의 데이터를 출력한다.)
- (void)printAllNode
{
    [self printAllNode:self.header];
}

- (void)printAllNode:(Node *)node
{
    if (node.next != nil) {
        NSLog(@"%ld", node.value);
        [self printAllNode:node.next]; //재귀함수 계속 다음으로 찾아간다는 말
    }else
    {
        NSLog(@"%ld", node.value);
    }
}

//removeLast (제일 마지막의 데이터를 삭제한다.)
- (void)removeLastNode:(Node *)nowNode
{
    if(nowNode.next == nil) {
        //nownode는 lastnode이다
        
    }else
    {
        [self removeLastNode:nowNode.next];
    }
}

//


























@end
