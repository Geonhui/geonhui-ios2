//
//  AppDelegate.m
//  ViewControllerStudy
//
//  Created by geon hui kim on 2016. 10. 24..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "ViewController2.h"
#import "ViewControllerWithXib.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //스토리보드의 Main을 stroryboard로 가져온다.
    UIStoryboard *stroryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    //스토리보드 아이디를 꼭 적어줘야 한다.
    //ViewController2 *vc2 = [stroryboard instantiateViewControllerWithIdentifier:@"ViewController2"];
    
    //ViewControllerWithXib *vcxib = [[ViewControllerWithXib alloc]init];
   
    ViewControllerWithXib *vcxib = [[ViewControllerWithXib alloc]initWithNibName:@"ViewControllerWithXib" bundle:nil];
    
    //네비게이션 컨트롤러 객체인 navi를 생성하고 뿌리가 되는 뷰를 vcxib뷰로 지정한다.
    UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:vcxib];
    
    //window 객체를 만들고 그 크기는 nsobject를 상속받은 uiscreen을 지정해준다. bounds는 화면전체사이즈를 가져온다는 말이다.
    //window의 뿌리컨트롤러를 navi변수(vcxib화면)를 지정한다.
    //window를 호출하기 위해서는 열쇠가 필요하다.
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = navi;
    [self.window makeKeyAndVisible];
    
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
