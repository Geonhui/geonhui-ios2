//
//  RequestObject.h
//  Networking Mini Project
//
//  Created by geon hui kim on 2016. 11. 15..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RequestObject : NSObject

//싱글턴
+ (instancetype)ShardRequest;

//이미지 요청
- (void)requestImageList;

@end
