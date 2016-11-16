//
//  RequestObject.m
//  Networking Mini Project
//
//  Created by geon hui kim on 2016. 11. 15..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "RequestObject.h"

@implementation RequestObject

//싱글턴 생성
+ (instancetype)ShardRequest
{
    static RequestObject *requestData = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        requestData = [[self alloc]init];
    });
    return requestData;
}

//이미지 요청
- (void)requestImageList
{
    //session생성
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
 
    //request 객체 생성
    NSURL *url = [NSURL URLWithString:@"http://iosschool.yagom.net:8080/api/list?user_id=200"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    //body data set
    request.HTTPMethod = @"GET";
    
}

@end
