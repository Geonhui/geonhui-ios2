//
//  ColoredLabel.m
//  SettingsExample
//
//  Created by JoSeongGyu on 2016. 10. 29..
//  Copyright © 2016년 Jo Seong Gyu. All rights reserved.
//

#import "ColoredLabel.h"

@implementation ColoredLabel

//스토리보드에서 생성된 라벨을 초기화
- (void)awakeFromNib {
    [super awakeFromNib];
    
    //
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didReceiveSettingChange:)
                                                 name:DidChangeSettingNotification
                                               object:nil];
}

//
- (void)didReceiveSettingChange:(NSNotification *)noti {
    
    UIColor *color = [[noti userInfo] objectForKey:UserInfoKeyLabelTextColor];
    UIFont *font = [[noti userInfo] objectForKey:UserInfoKeyLabelFont];
    
    if ([color isKindOfClass:[UIColor class]] &&
        [font isKindOfClass:[UIFont class]]) {
        [self setTextColor:color];
        [self setFont:font];
    }
}

- (void)dealloc {
    
    //노티피케이션 삭제
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end
