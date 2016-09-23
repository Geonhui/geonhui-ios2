//
//  Dog.h
//  GeonHuiex3
//
//  Created by geon hui kim on 2016. 9. 21..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dog : NSObject

@property NSString *name;
@property NSString *color;
@property NSString *spec;

- (id)cry:who;
- (id)output:where;
- (id)sleep:when;




@end
