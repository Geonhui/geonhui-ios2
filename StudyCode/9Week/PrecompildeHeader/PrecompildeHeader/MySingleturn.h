//
//  MySingleturn.h
//  PrecompildeHeader
//
//  Created by geon hui kim on 2016. 10. 31..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MySingleturn : NSObject

//MySingleturn클래스안에 만든 메서드
+ (instancetype)sharedInstance;
- (void)justMethod;

@end
