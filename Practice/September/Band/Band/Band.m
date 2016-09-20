//
//  Band.m
//  Band
//
//  Created by geon hui kim on 2016. 9. 20..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "Band.h"

@implementation Band

- (id)connect:(id)where why:(id)why; {
    NSLog(@"%@에 %@때문에 접속하겠습니다.", where, why);
    return nil;
}

- (id)serch:(id)what; {
    NSLog(@"%@를 찾습니다.", what);
    return nil;
}

- (id)chatting:(id)who; {
    NSLog(@"%@와 채팅하겠습니다.", who);
    return nil;
}

- (id)setting:(id)what {
    NSLog(@"%@을 설정합니다", what);
    return nil;
}

- (id)file:(id)what howmany:(id)howmany; {
    NSLog(@"%@을(를) %@ 올리겠습니다.", what, howmany);
    return nil;
}
@end
