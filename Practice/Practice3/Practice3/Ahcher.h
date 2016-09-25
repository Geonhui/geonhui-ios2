//
//  Ahcher.h
//  Practice3
//
//  Created by geon hui kim on 2016. 9. 25..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "Charictor.h"

@interface Ahcher : Charictor

@property NSInteger level; //레벨

- (id)battle:(Charictor *)who;
- (id)allowshawor:(Charictor *)who;

@end
