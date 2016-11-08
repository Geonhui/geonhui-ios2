//
//  main.m
//  PropertyAttributes
//
//  Created by geon hui kim on 2016. 11. 8..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Musician.h"
#import "BroadCastStation.h"

int main(int argc, const char * argv[]) {

    //name프로퍼티는 속성을 readonly로 되어있어서 한번지정해주면 외부에서는 수정할수가 없다.
    Musician *girl = [[Musician alloc] initWithName:@"블랙핑크" memberCount:@4];
    
    //프로퍼티명과 속성에 getter이름을 지정하여 두가지로 사용할수있다
    girl.company = @"yg";
    NSLog(@"%@", girl.company);
    NSLog(@"%@", [girl companyName]);
    
    //같은말
    girl.manager = @"양대성";
    [girl setManager:@"양대성"];
    
    //ARC 수동
    //retain, release시 retaincount 변경확인
    //retain count == 1
//    NSLog(@"retain count 1 : %ld", girl.retainCount);
//    [girl retain];
    
    //retain count == 2
//    NSLog(@"retain count 2 : %ld", girl.retainCount);
//    [girl release];
    
    //retain count == 1
//    NSLog(@"retain count 3 : %ld", girl.retainCount);
//    [girl release];
    
    //retain count == 0
//    NSLog(@"retain count 4 : %ld", girl.retainCount);
//    [girl release];
    
    //alloc init을 할경우 retaincount가 1 증가한다.
    BroadCastStation *mbc = [[BroadCastStation alloc] init];
    BroadCastStation *sbs = [[BroadCastStation alloc] init];
    BroadCastStation *kbs = [[BroadCastStation alloc] init];
    
    //참조를 할 경우 retain을 걸어준다. 1 증가
    mbc.musician = girl;
    //프로퍼티 속성에 (retain)을 설정해줄경우 쓸 필요가 없다.
    //ARC기능을 ON했을경우 retain, release를 임의로 조절할수없다.
//    [girl retain];
    
    sbs.musician = girl;
//    [girl retain];
    
    //retain을 안걸어줄경우 release로 retaincount가 0이 될 경우 메모리에 사라지기때문에 연결할수가 없다.
    kbs.musician = girl;
    
    //release를 할경우 retaincount가 1 감소
    mbc.musician = nil;
//    [girl release];
    
    sbs.musician = nil;
//    [girl release];
    
    //위에 retain에 2번 연결이 되어있고, 2번을 release로 연결을 끊어주었기 때문에 kbs는 참조를 할수없다.
    NSLog(@"%@", kbs.musician.groupName);
    
    return 0;
}
