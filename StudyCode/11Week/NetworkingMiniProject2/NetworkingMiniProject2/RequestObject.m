//
//  RequestObject.m
//  NetworkingMiniProject2
//
//  Created by geon hui kim on 2016. 11. 16..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "RequestObject.h"

@implementation RequestObject

//서버의 이미지 가져오기
+ (void)requestImageList
{
    //저장된 유저 아이디를 가져온다
    //URL주소를 스트링객체에 넣어준다.
    NSString *userId = [[UserInformation sharedUserInfo] userId];
    NSString *destinationURLString = [NSString stringWithFormat:@"http://iosschool.yagom.net:8080/api/list?user_id=%@",userId];
    
    //스트링으로 된 url을 url객체로 만듬
    NSURL *destinationURL = [NSURL URLWithString:destinationURLString];
    
    //요청할 객체
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"GET"];
    [request setURL:destinationURL];
    
    //긴 핸들러는 밖으로 빼주는게 보기가 좋다
    id taskHandler = ^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSLog(@"request image list response : %@, error : %@", response, error);
        
        NSError *jsonParsingError;
        NSDictionary *jsonResult = [NSJSONSerialization JSONObjectWithData:data
                                                                   options:NSJSONReadingMutableLeaves
                                                                     error:&jsonParsingError]; //이중포인터
        
        NSLog(@"json parsing error : %@, json result : %@", jsonParsingError, jsonResult);
        
        //이미지 받아와서 저장
        NSArray *imageInfoList = [jsonResult objectForKey:@"list"];
        [[UserInformation sharedUserInfo] setImageInfoList:imageInfoList];
        
        //노티피케이션
        NSString *notificationName = nil;
        if (imageInfoList == nil) {
            notificationName = ImageListUpdateFailNotification;
        }else {
            notificationName = ImageListUpdatedNotification;
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            //발송
            [[NSNotificationCenter defaultCenter] postNotificationName:notificationName object:nil];
        });
    };
    
    //
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request
                                                completionHandler:taskHandler];
    
    //실행
    [dataTask resume];
}

//서버에 이미지 업로드 시키기
+ (void)requestUploadImage:(UIImage *)image title:(NSString *)title
{
    //요청할 주소
    NSString *userId = [[UserInformation sharedUserInfo] userId];
    NSString *destinationURLString = @"http://iosschool.yagom.net:8080/api/upload";
    
    //스트링으로 된 url을 url객체로 만듬
    NSURL *destinationURL = [NSURL URLWithString:destinationURLString];
    
    //요청할 객체
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"POST"];
    [request setURL:destinationURL];

    //BODY작성
    //바운더리 스트링 --- < 4개이상할것
    //multypart form
    NSString *boundaryString = @"-----------------------geonhui";
    NSString *contentDescription = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundaryString];
    
    //Header
    [request addValue:contentDescription forHTTPHeaderField:@"Content-Type"];
    
    //바운더리 스트링을 데이터로 변환한다.
    NSData *boundaryData = [[NSString stringWithFormat:@"--%@\r\n", boundaryString] dataUsingEncoding:NSUTF8StringEncoding];
    
    //바디데이터 생성
    NSMutableData *bodyData = [[NSMutableData alloc] init];
    
    //-----------------------------------------------------------------------------------------
    //첫번째 바운더리 append : 붙여준다
    [bodyData appendData:boundaryData];
    //첫번째 파라미터 user_id
    NSData *nameData = [@"Content-Disposition: form-data; name=\"user_id\"\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding];
    [bodyData appendData:nameData];
    
    NSData *valueData = [[NSString stringWithFormat:@"%@\r\n", userId] dataUsingEncoding:NSUTF8StringEncoding];
    [bodyData appendData:valueData];
   
    //두번째 바운더리
    [bodyData appendData:boundaryData];
    //두번째 파라미터 title
    nameData = [@"Content-Disposition: form-data; name=\"title\"\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding];
    [bodyData appendData:nameData];
    
    valueData = [[NSString stringWithFormat:@"%@\r\n", title] dataUsingEncoding:NSUTF8StringEncoding];
    [bodyData appendData:valueData];

    //세번째 바운더리
    [bodyData appendData:boundaryData];
    //세번째 파라미터 image_data
    nameData = [[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"image_data\"; filename=\"image.jpeg\"\r\n"] dataUsingEncoding:NSUTF8StringEncoding];
    [bodyData appendData:nameData];
    
    NSData *imageContentTypeData = [@"Content-Type: image/ image/jpeg\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding];
    [bodyData appendData:imageContentTypeData];
    
    NSData *imageData = UIImageJPEGRepresentation(image, 0.1);
    [bodyData appendData:imageData];
    
    //마지막 바운더리 -----------------------------------------------------------------------------------
    NSData *finishBoundaryData = [[NSString stringWithFormat:@"\r\n--%@--\r\n", boundaryString] dataUsingEncoding:NSUTF8StringEncoding];
    [bodyData appendData:finishBoundaryData];
    
    //
    [request setHTTPBody:bodyData];
    
    //업로드
    id uploadHandler = ^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error != nil) {
            NSLog(@"error occured : %@", error);
            return ;
        }
        if (data == nil) {
            NSLog(@"data dosen't exist");
            return;
        }
        NSLog(@"%@", response);
        
        NSDictionary *jsonResult = [NSJSONSerialization JSONObjectWithData:data
                                                                   options:NSJSONReadingMutableLeaves
                                                                     error:nil];
        NSLog(@"%@", jsonResult);
        
        if ([[jsonResult objectForKey:@"result"] isEqualToString:@"success"]) {
            [self requestImageList];
        }
    };
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionUploadTask *uploadTask = [session uploadTaskWithRequest:request fromData:nil completionHandler:uploadHandler];
    
    [uploadTask resume];
}



@end
