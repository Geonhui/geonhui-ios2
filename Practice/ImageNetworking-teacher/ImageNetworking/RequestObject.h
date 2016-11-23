//
//  RequestObject.h
//  ImageNetworking
//
//  Created by JoSeongGyu on 2016. 11. 9..
//  Copyright © 2016년 Jo Seong Gyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RequestObject : NSObject
//요청이미지 리스트
+ (void)requestImageList;
//업로드 이미지
+ (void)requestUploadImage:(UIImage *)image title:(NSString *)title originImageId:(NSString *)imageId;
//삭제 이미지
+ (void)requestDeleteImage:(NSString *)imageId;

@end
