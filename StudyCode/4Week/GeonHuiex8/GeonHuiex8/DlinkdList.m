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
{   // 자기자신을 초기화
    self = [super init];
    if (self) {
        //header(첫번째노드)안에 node라는 객체와 타입이 생성된다.
        self.header = [[Node alloc] init];
        //header(첫번째 노드)의 next(다음노드)에 nil값을 넣는다.
        self.header.next = nil;
        //header(첫번째 노드)의 prev(이전노드)에 nil값을 넣는다.
        self.header.prev = nil;
        //인덱스의 첫번째
        self.lastIndex = 0;
    }
    return self;
}

//add (마지막에 데이터를 추가한다)
//리스트 마지막에 추가하는 방법
- (void)addLastValue:(NSInteger)value
{// 메서드 호출
 // 제일 마지막에 노드를 추가한다  헤더노드       새로운 값
    [self addLastIndexNode:self.header newValue:value];   //헤더부터 새로운 값을 추가한다.
}
// 제일 마지막에 노드추가      nowNode는 header 새로운 값을 넣어준다.
- (void)addLastIndexNode:(Node *)nowNode newValue:(NSInteger)value
{
    
    if (nowNode.next == nil) {                // 만약에 nowNode(header)의 next가 nil이면
        Node *newNode = [[Node alloc] init];  // newNode라는 객체를 생성
        newNode.value = value;                // newNode에 value값을 넣어준다
        newNode.prev = nowNode;               // newNode 이전node는 nowNode이다
        newNode.next = nil;                   // newNode의 다음node는 nil값이다
        newNode.index = self.lastIndex;       // newNode 인덱스는 마지막 인덱스 이다
        nowNode.next = newNode;               // nowNode의 next는 newNode이다
        self.lastIndex = self.lastIndex + 1;  // 마지막 인덱스는 마지막인덱스에 인덱스를 추가한다.
    }else
    {
        [self addLastIndexNode:nowNode.next newValue:value];   //nowNode의 다음node가 nil이 아닐경우
    }
}

//add (첫번째에 데이터를 추가한다)
//헤드 다음에 추가하는 방법
- (void)addFirstValue:(NSInteger)newValue
{
    Node *newNode = [[Node alloc] init];    // newNode안에 node를 생성
    newNode.value = newNode;                // newNode값에 newNode를 넣는다.
    
    if (self.header.next == nil) {          // header의 nextNode가 nil일 경우
        self.header.next = newNode;         // header의 nextNode가 newNode가 된다.
        newNode.prev = self.header;         // newNode의 이전node는 header이다
        newNode.next = nil;                 // newNode의 다음node는 nil이다.
    }else
    {
        newNode.prev = self.header;         // newNode의 이전node는 headerNode이다.
        newNode.next = self.header.next;    // newNode의 다음node는 nextNode이다 고로 아직 추가된 상황이아님
        self.header.next.prev = newNode;    // header의 다음node는 nextNode이고, 이전node는 newNode이다
        self.header.next = newNode;         // header의 다음node는 nextNode이다.
    }
}

//printNode(모든 노드의 데이터를 출력한다.)
- (void)printAllNode
{
    [self printAllNode:self.header];    // 헤더부터 전부출력한다
}

- (void)printAllNode:(Node *)node       // 출력할 node를 지정해준다
{
    if (node.next != nil) {             // 다음node들이 nil값이 아닐때
        NSLog(@"%ld", node.value);      // node값을 출력한다.
        [self printAllNode:node.next];  // 재귀함수 계속 다음node으로 찾아간다는 말
    }else                               // nil일 경우
    {
        NSLog(@"%ld", node.value);      // node값을 출력 nil이므로 값이 없어서 출력이 안됨
    }
}

//removeLast (제일 마지막의 데이터를 삭제한다.)
-(void)removeLast
{
    [self removeLastNode:self.header];    // 마지막 데이터를 삭제
}
//
-(void)removeLastNode:(Node *)node        // 삭제할 node를 지정해준다
{
    if(node.next == nil){                 // node의 다음node가 nil인 경우
        
        node.prev.next = nil;             // nil인 마지막node의 이전node와 다음node를 전부 nil값을 넣어준다
        node.prev = nil;                  // nil인 마지막node의 이전node에 nil값을 넣어준다
        
    }else                                 // node의 다음node가 nil이 아닌 경우
    {
        [self removeLastNode:node.next];  // 마지막 노드가 nil아닌경우
    }
}
//


























@end
