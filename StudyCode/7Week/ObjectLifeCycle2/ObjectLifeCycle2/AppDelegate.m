//
//  AppDelegate.m
//  ObjectLifeCycle2
//
//  Created by geon hui kim on 2016. 10. 20..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

//앱을 실행 시켰을때 (will) launch option
- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //스토리보드의 변수의 값이 nil
    //뷰컨트롤러의 변수의 값이 nil
    UIStoryboard *firstStoryBoard = nil;
    UIViewController *mainViewcontroller = nil;
    
    //isUserLogined > 참일때
    BOOL isUserLogined = YES;
    
    //만약에 isUserLogined가 참일 경우
    //main이라는 스토리보드의 진입점인 뷰를 불러온다
    //스토리보드에서 진입점을 반드시 지정해주어야 한다.
    if (isUserLogined) {
        firstStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
    //isUserLogined가 거짓일 경우
    //mainnext 스토리보드의 진입점인 뷰를 불러온다
    }else {
        firstStoryBoard = [UIStoryboard storyboardWithName:@"MainNext" bundle:nil];
    }
    
    //인스턴스 초기화
    mainViewcontroller = [firstStoryBoard instantiateInitialViewController];
    
    //윈도우를 생성하고 초기화 시킨다
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];

    //시작이 되는 뷰 컨트롤러, 맨아래에 깔리는 뷰 컨트롤러
    //
    [self.window setRootViewController:mainViewcontroller];
    
    //이 윈도우를 키 윈도우로 만든다
    //self.window를 key window로 만든다
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // [appearance] 전체 뷰에 초기값을 설정할수있다.
    // Override point for customization after application launch.
    return YES;
}

//프로그램 백그라운드 전환시
- (void)applicationWillResignActive:(UIApplication *)application {
    NSLog(@"application will resign active");
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}

//프로그램 백그라운드 모드로 전환시
- (void)applicationDidEnterBackground:(UIApplication *)application {
    NSLog(@"application did enter background");
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

//프로그램 포그그라운드 모드로 전환시
- (void)applicationWillEnterForeground:(UIApplication *)application {
    NSLog(@"application will enter foreground");
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}

//프로그램 최초 실행시
- (void)applicationDidBecomeActive:(UIApplication *)application {
    NSLog(@"application did become active");
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

//프로그램 완전 종료시
- (void)applicationWillTerminate:(UIApplication *)application {
    NSLog(@"application will terminate");
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
