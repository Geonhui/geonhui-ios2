//
//  Wissord.m
//  GeonHuiex4
//
//  Created by geon hui kim on 2016. 9. 22..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "Wissord.h"
@class GameCharactor;
@implementation Wissord

-(id)windstormTo:(GameCharactor *)someone {
    NSLog(@"%@가 %@에게 윈드스톰을 공격한다.", self.name, someone.name);
    return nil;
}

- (id)PhysicalPowerAttackTo:(GameCharactor *)someone {
    NSLog(@"%@는 %@에게 고무고무 총난타을 날렸다.", someone.name, self.name);
    return nil;
}

- (id)teleportTo:(GameCharactor *)location {
    NSLog(@"로즈가 %@를 들고 제이슨에게 텔레포트 했다.", self.weapon, location.name);
    return nil;
}

@end
