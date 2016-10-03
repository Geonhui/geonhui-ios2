//
//  main.m
//  GeonHuiex
//
//  Created by geon hui kim on 2016. 9. 19..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Monster.h"
#import "youandi.h"
#import "Macbook.h"
int main(int argc, const char * argv[]) {

    //몬스터 클래스의 몬이란 객체 생성, 초기화
    Monster *mon = [[Monster alloc]init];
    mon.human = @"인간";
    mon.angel = @"천사";
    mon.devil = @"악마";
    mon.specter = @"요괴";
    [mon attack];   //공격
    [mon defense];  //방어
    [mon support];  //지원
    [mon multiple]; //멀티
    
    //유앤아이 클래스의 유란 객체 생성, 초기화
    youandi *you = [[youandi alloc]init];
    [you sleep]; //잔다
    [you eat];   //먹다
    [you look];  //보다
    [you read];  //읽다
    
    //맥북 클래스의 맥이란 객체 생성, 초기화
    Macbook *mac = [[Macbook alloc]init];
    [mac music];   //음악
    [mac movie];   //영화
    [mac massage]; //메세지
    
    
    return 0;
}
