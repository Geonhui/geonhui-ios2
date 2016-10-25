//
//  AppDelegate.m
//  TestPage
//
//  Created by geon hui kim on 2016. 10. 24..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //Main이라는 스토리보드를 가져옴
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    //uiviewcontroller객체 생성
    //UIViewController *vc1 = [[UIViewController alloc]initWithNibName:@"ViewController" bundle:nil];
    //UIViewController *vc2 = [[UIViewController alloc]initWithNibName:@"ViewController2" bundle:nil];
    
    //스토리보드 id가 viewcontroller인 스토리보드를 vc1으로 가져옴
    UIViewController *vc1 = [storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    
    //네비게이션 객체 생성, rootviewcontroller를 지정
    UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:vc1];
    
    //윈도우 객체생성, 프레임은 전체 스크린 bounds = wideth + hight
    //윈도우 루트 뷰 컨트롤러 지정
    //윈도우 키 지정
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = navi;
    [self.window makeKeyWindow];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
