//
//  ViewControllerWithXib.m
//  ViewControllerStudy
//
//  Created by geon hui kim on 2016. 10. 24..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "ViewControllerWithXib.h"
#import "ViewController2.h"

@interface ViewControllerWithXib ()

//화면전환 애니메이션 프로퍼티
@property (nonatomic,assign) UIModalTransitionStyle modal;

@end

@implementation ViewControllerWithXib

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//xib화면에서 vc2화면으로 화면전환
- (IBAction)touchoninsidebuttondismiss:(id)sender
{
    //객체만들기
    UIStoryboard *stroryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController2 *vc2 = [stroryboard instantiateViewControllerWithIdentifier:@"ViewController2"];

    //화면전환 애니메이션
    [vc2 setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    
    //precent 전환
    //[self presentViewController:vc2 animated:YES completion:nil];
    
    //navi push
    [self.navigationController pushViewController:vc2 animated:YES];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    NSLog(@"view did appear : xib");
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    NSLog(@"view will appear : xib");
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:YES];
    NSLog(@"view did disappear : xib");
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    NSLog(@"view will disappear : xib");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
