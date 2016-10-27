//
//  ViewController.m
//  ArertControllerStudy
//
//  Created by geon hui kim on 2016. 10. 27..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

//버튼1을 눌렀을 경우 얼럿을 생성하고 얼럿액션을 준다
- (IBAction)button1Alert:(id)sender
{
    [self showAlertController:UIAlertControllerStyleAlert];
    
//    UIAlertController *pop1 = [UIAlertController alertControllerWithTitle:@"Alert1"
//                                                                  message:@"Alert1"
//                                                           preferredStyle:UIAlertControllerStyleAlert];
//    
//    UIAlertAction *popAction1 = [UIAlertAction actionWithTitle:@"취소"
//                                                         style:UIAlertActionStyleDestructive
//                                                       handler:^(UIAlertAction * action){
//                                                           [pop1 dismissViewControllerAnimated:YES completion:nil];
//                                                       }];
//    
//    UIAlertAction *popAction11 = [UIAlertAction actionWithTitle:@"확인"
//                                                          style:UIAlertActionStyleDefault
//                                                        handler:^(UIAlertAction *action){
//                                                            [pop1 dismissViewControllerAnimated:YES completion:nil];
//                                                        }];
//
//    UIAlertAction *popAction111 = [UIAlertAction actionWithTitle:@"파괴" style:UIAlertActionStyleDestructive handler:nil];
    
//    [pop1 addAction:popAction1];
//    [pop1 addAction:popAction11];
//    [pop1 addAction:popAction111];
    
//    [self presentViewController:pop1 animated:YES completion:nil];
}

//버튼2을 눌렀을 경우 얼럿을 생성하고 얼럿액션을 준다
- (IBAction)button2Alert:(id)sender
{
    [self showAlertController:UIAlertControllerStyleActionSheet];
    
//    UIAlertController *pop2 = [UIAlertController alertControllerWithTitle:@"Alert2"
//                                                                  message:@"Alert2"
//                                                           preferredStyle:UIAlertControllerStyleActionSheet];
//    
//    UIAlertAction *popAction2 = [UIAlertAction actionWithTitle:@"취소"
//                                                         style:UIAlertActionStyleCancel
//                                                       handler:nil];
//    
//    UIAlertAction *popAction22 = [UIAlertAction actionWithTitle:@"확인"
//                                                          style:UIAlertActionStyleDefault
//                                                        handler:nil];
//    
//    UIAlertAction *popAction222 = [UIAlertAction actionWithTitle:@"파괴" style:UIAlertActionStyleDestructive handler:nil];

//    [pop2 addAction:popAction2];
//    [pop2 addAction:popAction22];
//    [pop2 addAction:popAction222];
    
//    [self presentViewController:pop2 animated:YES completion:nil];
}

//강사님 버젼
//한 메서드에서 얼럿스타일 지정하고 액션 핸들러 사용
- (void)showAlertController:(UIAlertControllerStyle)style
{
    //스타일 지정 스위치문 사용
    switch (style) {
        case UIAlertControllerStyleAlert:
        case UIAlertControllerStyleActionSheet:
            break;
            
    //해당안될경우 return하여 스위치문 해제
        default:
            return;
            break;
    }
    
    //핸들러 블럭사용
    void (^handlerBlock)(UIAlertAction *) = ^(UIAlertAction * _Nonnull action) {
        NSLog(@"핸들러가 호출되었습니다.");
        
        //스타일을 비교, 스타일은 정수이기때문에 == 이 가능
        if (action.style == UIAlertActionStyleCancel) {
            NSLog(@"취소를 눌렀습니다.");
            
        //문자를 비교, 문자는 isEqual로 비교해야함
        }else if ([action.title isEqualToString:@"파괴"]) {
            NSLog(@"파괴를 눌렀습니다.");
            
        //나머지
        }else
            NSLog(@"확인을 눌렀습니다.");
    };
    
    //얼럿 컨트롤러 생성
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"alert"
                                                                             message:@"alertalertalertalertalert"
                                                                      preferredStyle:style];
    
    //얼럿액션 타이틀:취소, 스타일:cancel, 핸들러 블럭사용
    UIAlertAction *cancle = [UIAlertAction actionWithTitle:@"취소"
                                                     style:UIAlertActionStyleCancel
                                                   handler:handlerBlock];
    
    //얼럿액션 타이틀:확인, 스타일:default, 핸들러 블럭사용
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"확인"
                                                     style:UIAlertActionStyleDefault
                                                   handler:handlerBlock];
    
    //얼럿액션 타이틀:파괴, 스타일:destructive, 핸들러 블럭사용
    UIAlertAction *delete = [UIAlertAction actionWithTitle:@"파괴"
                                                 style:UIAlertActionStyleDestructive
                                               handler:handlerBlock];
    
    //얼럿액션을 얼럿컨트롤러에 올린다.
    [alertController addAction:delete];
    [alertController addAction:ok];
    [alertController addAction:cancle];
    
    //얼럿컨트롤러를 셀프 프리센트해주어야 한다.
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
