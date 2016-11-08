//
//  Musician.h
//  PropertyAttributes
//
//  Created by geon hui kim on 2016. 11. 8..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Musician : NSObject

@property (nonnull, readonly) NSString *groupName;
@property (null_resettable) NSNumber *memberConut;
@property (nullable, getter=companyName) NSString *company;
@property (null_unspecified) NSString *manager;

- (instancetype)init;
- (instancetype)initWithName:( NSString * _Nonnull )name memberCount:( NSNumber * _Nonnull )memberCount;

- (void)dealloc;

@end
