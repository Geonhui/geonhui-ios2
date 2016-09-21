//
//  Chicken.h
//  GeonHuiex
//
//  Created by geon hui kim on 2016. 9. 19..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Chicken : NSObject

//치킨의 메이커들(멕시카나,호식이,등등)
@property id maker;
//양념,후라이드,간장,파닭,반반무마니
@property id ordertype;
//다리,날개,목 등
@property id part;
//치킨의 가격
@property id price;

//도저히 모르겟음 치킨의 행위라.....흠
- (id)sauna;


@end
