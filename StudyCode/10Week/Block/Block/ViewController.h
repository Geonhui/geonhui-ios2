//
//  ViewController.h
//  Block
//
//  Created by geon hui kim on 2016. 11. 10..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import <UIKit/UIKit.h>

//
typedef void(^myName)(NSString *name);

@interface ViewController : UIViewController

//block is parameter
//typedef를 이용한방법
- (void)simpleMethod:(void(^)(NSString *name))param;
//- (void)simpleMethod:(myName)param;
@end

