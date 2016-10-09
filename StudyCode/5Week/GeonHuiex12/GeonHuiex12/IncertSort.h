//
//  IncertSort.h
//  GeonHuiex12
//
//  Created by geon hui kim on 2016. 10. 9..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IncertSort : NSObject
@property NSInteger totalSwitchCount;
@property NSInteger totalCompareCount;

-(NSArray *)insertSort:(NSArray *)list;
@end
