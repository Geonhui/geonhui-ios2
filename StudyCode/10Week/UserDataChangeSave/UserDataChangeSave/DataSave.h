//
//  DataSave.h
//  UserDataChangeSave
//
//  Created by geon hui kim on 2016. 11. 7..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataSave : NSObject

//싱글턴
+ (instancetype)shaerdData;

//데이터 저장
- (BOOL)editdata:(NSString *)firstname lastname:(NSString *)lastname age:(NSString *)age havi:(NSString *)havi;




@end
