//
//  Stack.m
//  GeonHuiex8
//
//  Created by geon hui kim on 2016. 10. 6..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "Stack.h"

@implementation Stack

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.header = [[Node alloc]init];
        self.header.next = nil;
        self.header.prev = nil;
        self.lastIndex = 0;
    }
    return self;
}

////스텍 자료구조의 푸시(데이터 넣음)
//- (void)push:(NSInteger)value
//{
//    //아래의 메서드를 구현
//    [self pushFirst:self.header newValue:value];
//}
//
////push로 차곡차곡 순서대로 노드생성하여 값을 넣어주는 메서드
//- (void)pushFirst:(Node *)nowNode newValue:(NSInteger)value
//{
//    //! newNode 선언
//    Node *newNode = [[Node alloc] init];
//    //! newNode 에 value 대입
//    newNode.value = value;
//    
//    //! 현재 노드가 스택의 꼭대기일 때,
//    if (nowNode.next == nil) {
//        //! 현재 마지막 노드는 새로운 노드를 가리킨다
//        nowNode.next = newNode;
//        //! 노드를 추가해줬으므로 전체 데이터의 갯수(index)를 하나 늘린다
//        self.index++;
//        //! push 된 데이터를 출력한다
//        NSLog(@"push: %ld", value);
//    } else { //! 현재 노드가 스택의 꼭대기에 아직 도착하지 못했다면,
//        //! 재귀메서드를 시행, 현재노드의 다음 노드(nowNode.next)로 넘어가서 value를 넘기도 메서드 시행
//        [self pushFirst:nowNode.next newValue:value];
//    }
//}

- (void)push:(NSInteger)value
{
    [self pushFirst:self.header newValue:value];
}
- (void)pushFirst:(Node *)nowNode newValue:(NSInteger)value
{
    Node *newNode = [[Node alloc]init];
    newNode.value = value;
    if (nowNode.next == nil) {
        nowNode.next = newNode;
        self.index += 1;
        NSLog(@"푸시데이터는 %ld", value);
    }else {
        [self pushFirst:nowNode.next newValue:value];
    }
}

//스텍 자료구조의 팝(데이터 받음)
//- (void)pop
//{
//    //! 전체 데이터 갯수를 임시변수 dataCount에 저장. 전체 데이터변수를 수정하면 안되기 때문임.
//    self.dataCount = self.index;
//    [self popLast:self.header]; //아래의 메서드를 구현
//}
//- (void)popLast:(Node*)node
//{
//    //! 데이터 카운트가 0이 되면 가장 꼭대기 값이 출력되므로, 그거 바로 전인 카운트 1에서 멈춤
//    if (self.dataCount == 1) {
//        //! 해당 노드의 다음 값을 nil로 바꿈. 카운트 0인 꼭대기 값은 사라지게 됨
//        node.next = nil;
//        //! 전체 데이터 갯수를 하나 줄임
//        self.index--;
//        //! 출력
//        NSLog(@"stackTopData: %ld index: %ld",node.value, self.dataCount);
//    } else {
//        //! 데이터카운트가 1이 되지 않았다면,
//        NSLog(@"stackData: %ld index: %ld",node.value, self.dataCount);
//        //! 전체 데이터 갯수에서 카운트를 하나씩 줄여나감
//        self.dataCount--;
//        //! 그 다음 노드로 넘어감
//        [self popLast:node.next];
//    }
//}

- (void)pop
{
    self.dataCount = self.index;
    [self popLast:self.header];
}
- (void)popLast:(Node *)node
{
    if (self.dataCount == 1) {
        node.next = nil;
        self.index -= 1;
        NSLog(@"팝 받아온 데이터는 %ld", node.value);
    }else {
        self.dataCount -= 1;
        [self popLast:node.next];
    }
}

//큐 구조의 풋(데이터 넣음)첫번째부터 순서대로 들어감
- (void)putFirstValue:(NSInteger)newValue
{
    Node *newNode = [[Node alloc]init];
    newNode.value = newValue;
    //헤드의 다음노드가 nil일 경우
    if (self.header.next == nil) {
        self.header.next = newNode; //헤더의 다음노드를 생성
        newNode.prev = self.header; //뉴노드의 이전노드는 헤더를 가리킨다.
        newNode.next = nil;  //뉴노드의 다음노드는 nil이다.
    }else { //헤더의 다음노드가 nil이 아닐경우
        newNode.prev = self.header;  //뉴노드의 이전노드는 헤더를 가리킨다.
        newNode.next = self.header.next; //뉴노드의 다음노드는 헤더의 다음노드를 가리킨다.
        self.header.next.prev = newNode; //헤더의 다음노드의 이전노드는 뉴노드를 가리킨다.
        self.header.next = newNode;  //헤더의 다음노드는 뉴노드를 가리킨다.
    }NSLog(@"put의 값 = %ld", newNode.value);
}

//큐 구조의 겟(데이터 받음)첫번째부터 받아온다.
- (NSInteger)get:(Node *)header
{   //첫번째노드의 값을 받는 변수
    NSInteger value;
    //헤더의 다음,다음 노드가 닐이 아닐경우
    while (header.next.next != nil) {
          header.next = header.next.next;  //헤더의 다음노드는 헤더의 다음다음노드를 가리킨다.
        }
    value = header.next.value;
    NSLog(@"get의 값 = %ld", value);
    return value;
}














@end
