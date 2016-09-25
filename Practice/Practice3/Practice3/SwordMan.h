//
//  SwordMan.h
//  Practice3
//
//  Created by geon hui kim on 2016. 9. 25..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "Charictor.h"
@interface SwordMan : Charictor



@property NSInteger level; //레벨

- (id)battle:(Charictor *)who;
- (id)swordsmash:(Hit *)who;

@end
