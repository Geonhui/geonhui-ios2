//
//  ViewController.m
//  StandUp
//
//  Created by geon hui kim on 2016. 11. 3..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//


#import "ViewController.h"
#import "AppDelegate.h"
@interface ViewController ()<UIApplicationDelegate>

@property NSInteger firstNumber;
@property NSInteger secondNumber;

@property NSInteger oneAndthree;
@property NSInteger threeAndOne;

@property NSInteger oneAndpal;
@property NSInteger palAndone;

@property NSInteger threeAndpal;
@property NSInteger palAndthree;

@property NSMutableArray *selectedBtnList;

@end

@implementation ViewController

//초기화
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.firstNumber = 0;
        self.secondNumber = 0;
        self.oneAndthree = 0;
        self.threeAndOne = 0;
        self.oneAndpal = 0;
        self.palAndone = 0;
        self.threeAndpal = 0;
        self.palAndthree = 0;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.selectedBtnList = [[NSMutableArray alloc] init];
    
}

//이해필요!!
//BOOL isSelected = sender.selected;
//sender.selected = !isSelected;

//self.one1.selected = !self.one1.selected;

//카드버튼
- (IBAction)buttonAction:(UIButton *)sender
{
    BOOL isReSelec = NO;
    
    //중복 선택 검사
    for (UIButton *selectedBtn in self.selectedBtnList)
    {
        if (selectedBtn.tag == sender.tag)
        {
            isReSelec = YES;
        }
    }
    
    if (isReSelec) {
        [self.selectedBtnList removeObject:sender];
        [self changeCardSelectedUI:NO btn:sender];
    }else
    {
        //추가
        if (self.selectedBtnList.count < 2) {
            
            [self.selectedBtnList addObject:sender];
            [self changeCardSelectedUI:YES btn:sender];
        }
    }
    
//이해필요!
//    for (NSInteger tag = 100; tag < 121; tag++) {
//        UIView *someView = [[self view] viewWithTag:tag];
//        if ([someView isKindOfClass:[UIButton class]]) {
//            UIButton *button = (UIButton *)someView;
//            NSLog(@"버튼입니다 tag : %ld, 선택 : %d", button.tag, button.selected);
//        }
//    }
}

//조합
- (void)changeCardSelectedUI:(BOOL)isSelect btn:(UIButton *)sender
{
    //선택표시
    if (isSelect) {
        
        [sender setAlpha:0.5];
        
        switch (sender.tag) {
            case 101:
                self.firstNumber = 1;
                self.oneAndpal = 1;
                self.oneAndthree = 1;
                NSLog(@"1땡 tag : %ld", sender.tag);
                break;
                
            case 111:
                self.secondNumber = 1;
                NSLog(@"1-1땡 tag : %ld", sender.tag);
                break;
                
            case 102:
                self.firstNumber = 2;
                NSLog(@"2땡 tag : %ld", sender.tag);
                break;
                
            case 112:
                self.secondNumber = 2;
                NSLog(@"2-1땡 tag : %ld", sender.tag);
                break;
                
            case 103:
                self.firstNumber = 3;
                self.threeAndpal = 3;
                self.threeAndOne = 3;
                NSLog(@"3땡 tag : %ld", sender.tag);
                break;
                
            case 113:
                self.secondNumber = 3;
                NSLog(@"3-1땡 tag : %ld", sender.tag);
                break;

            case 104:
                self.firstNumber = 4;
                NSLog(@"4땡 tag : %ld", sender.tag);
                break;
                
            case 114:
                self.secondNumber = 4;
                NSLog(@"4-1땡 tag : %ld", sender.tag);
                break;
                
            case 105:
                self.firstNumber = 5;
                NSLog(@"5땡 tag : %ld", sender.tag);
                break;
                
            case 115:
                self.secondNumber = 5;
                NSLog(@"5-1땡 tag : %ld", sender.tag);
                break;
                
            case 106:
                self.firstNumber = 6;
                NSLog(@"6땡 tag : %ld", sender.tag);
                break;
                
            case 116:
                self.secondNumber = 6;
                NSLog(@"6-1땡 tag : %ld", sender.tag);
                break;
                
            case 107:
                self.firstNumber = 7;
                NSLog(@"7땡 tag : %ld", sender.tag);
                break;
                
            case 117:
                self.secondNumber = 7;
                NSLog(@"7-1땡 tag : %ld", sender.tag);
                break;
                
            case 108:
                self.firstNumber = 8;
                self.palAndthree = 8;
                self.palAndone = 8;
                NSLog(@"8땡 tag : %ld", sender.tag);
                break;
                
            case 118:
                self.secondNumber = 8;
                NSLog(@"3-1땡 tag : %ld", sender.tag);
                break;
                
            case 109:
                self.firstNumber = 9;
                NSLog(@"9땡 tag : %ld", sender.tag);
                break;
                
            case 119:
                self.secondNumber = 9;
                NSLog(@"9-1땡 tag : %ld", sender.tag);
                break;
                
            case 110:
                self.firstNumber = 10;
                NSLog(@"10땡 tag : %ld", sender.tag);
                break;
                
            case 120:
                self.secondNumber = 10;
                NSLog(@"10-1땡 tag : %ld", sender.tag);
                break;
                
            default:
                break;
        }
    }else {
        [sender setAlpha:1.0];
    }
}

//결과
- (IBAction)finishPermit:(id)sender
{
    //핸들러
    void (^actionHandler)(UIAlertAction * _Nonnull action) = ^(UIAlertAction * _Nonnull action) {

        if ([[action title] isEqualToString:@"오키"]) {
            self.firstNumber = 0;
            self.secondNumber = 0;
            self.oneAndthree = 0;
            self.threeAndOne = 0;
            self.oneAndpal = 0;
            self.palAndone = 0;
            self.threeAndpal = 0;
            self.palAndthree = 0;
            
            UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            ViewController *view1 = [storyBoard instantiateViewControllerWithIdentifier:@"View1"];
            AppDelegate *appDelegate =(AppDelegate *)[UIApplication sharedApplication].delegate;
            appDelegate.window.rootViewController =view1;
            [appDelegate.window makeKeyAndVisible];
        }
    };
    
    //1땡
    if (self.firstNumber == 1 && self.secondNumber == 1) {
        
        UIAlertController *permitAlert = [UIAlertController alertControllerWithTitle:@"일땡"
                                                                             message:@"일땡 << 이땡"
                                                                      preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *permitAction = [UIAlertAction actionWithTitle:@"오키"
                                                               style:UIAlertActionStyleDefault
                                                             handler:actionHandler];
        
        [permitAlert addAction:permitAction];
        [self presentViewController:permitAlert animated:YES completion:nil];
        
    //2땡
    }else if (self.firstNumber == 2 && self.secondNumber == 2) {
        
        UIAlertController *permitAlert2 = [UIAlertController alertControllerWithTitle:@"이땡"
                                                                             message:@"일땡 << 이땡 << 삼땡"
                                                                      preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *permitAction2 = [UIAlertAction actionWithTitle:@"오키"
                                                               style:UIAlertActionStyleDefault
                                                             handler:actionHandler];
        
        [permitAlert2 addAction:permitAction2];
        [self presentViewController:permitAlert2 animated:YES completion:nil];
    
    //3땡
    }else if (self.firstNumber == 3 && self.secondNumber == 3) {
        
        UIAlertController *permitAlert3 = [UIAlertController alertControllerWithTitle:@"삼땡"
                                                                              message:@"이땡 << 삼땡 << 오땡"
                                                                       preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *permitAction3 = [UIAlertAction actionWithTitle:@"오키"
                                                                style:UIAlertActionStyleDefault
                                                              handler:actionHandler];
        
        [permitAlert3 addAction:permitAction3];
        [self presentViewController:permitAlert3 animated:YES completion:nil];

    //4땡
    }else if (self.firstNumber == 4 && self.secondNumber == 4) {
        
        UIAlertController *permitAlert4 = [UIAlertController alertControllerWithTitle:@"사땡"
                                                                              message:@"삼땡 << 사땡 << 오땡"
                                                                       preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *permitAction4 = [UIAlertAction actionWithTitle:@"오키"
                                                                style:UIAlertActionStyleDefault
                                                              handler:actionHandler];
        
        [permitAlert4 addAction:permitAction4];
        [self presentViewController:permitAlert4 animated:YES completion:nil];
    
    }else if (self.firstNumber == 5 && self.secondNumber == 5) {
        
        UIAlertController *permitAlert5 = [UIAlertController alertControllerWithTitle:@"오땡"
                                                                              message:@"사땡 << 오땡 << 육땡"
                                                                       preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *permitAction5 = [UIAlertAction actionWithTitle:@"오키"
                                                                style:UIAlertActionStyleDefault
                                                              handler:actionHandler];
        
        [permitAlert5 addAction:permitAction5];
        [self presentViewController:permitAlert5 animated:YES completion:nil];

    }else if (self.firstNumber == 6 && self.secondNumber == 6) {
        
        UIAlertController *permitAlert6 = [UIAlertController alertControllerWithTitle:@"육땡"
                                                                              message:@"오땡 << 육땡 << 칠땡"
                                                                       preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *permitAction6 = [UIAlertAction actionWithTitle:@"오키"
                                                                style:UIAlertActionStyleDefault
                                                              handler:actionHandler];
        
        [permitAlert6 addAction:permitAction6];
        [self presentViewController:permitAlert6 animated:YES completion:nil];

    }else if (self.firstNumber == 7 && self.secondNumber == 7) {
        
        UIAlertController *permitAlert7 = [UIAlertController alertControllerWithTitle:@"칠땡"
                                                                              message:@"육땡 << 칠땡 << 팔땡"
                                                                       preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *permitAction7 = [UIAlertAction actionWithTitle:@"오키"
                                                                style:UIAlertActionStyleDefault
                                                              handler:actionHandler];
        
        [permitAlert7 addAction:permitAction7];
        [self presentViewController:permitAlert7 animated:YES completion:nil];

    }else if (self.firstNumber == 8 && self.secondNumber == 8) {

        UIAlertController *permitAlert8 = [UIAlertController alertControllerWithTitle:@"팔땡"
                                                                              message:@"칠땡 << 팔땡 << 구땡"
                                                                       preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *permitAction8 = [UIAlertAction actionWithTitle:@"오키"
                                                                style:UIAlertActionStyleDefault
                                                              handler:actionHandler];
        
        [permitAlert8 addAction:permitAction8];
        [self presentViewController:permitAlert8 animated:YES completion:nil];

    }else if (self.firstNumber == 9 && self.secondNumber == 9) {

        UIAlertController *permitAlert9 = [UIAlertController alertControllerWithTitle:@"구땡"
                                                                              message:@"팔땡 << 구땡 << 장땡"
                                                                       preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *permitAction9 = [UIAlertAction actionWithTitle:@"오키"
                                                                style:UIAlertActionStyleDefault
                                                              handler:actionHandler];
        
        [permitAlert9 addAction:permitAction9];
        [self presentViewController:permitAlert9 animated:YES completion:nil];

    }else if (self.firstNumber == 10 && self.secondNumber == 10) {
        
        UIAlertController *permitAlert10 = [UIAlertController alertControllerWithTitle:@"장땡"
                                                                              message:@"구땡 << 장땡 << 일삼광땡"
                                                                       preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *permitAction10 = [UIAlertAction actionWithTitle:@"오키"
                                                                style:UIAlertActionStyleDefault
                                                              handler:actionHandler];
        
        [permitAlert10 addAction:permitAction10];
        [self presentViewController:permitAlert10 animated:YES completion:nil];

    }else if (self.oneAndthree == 1 && self.threeAndOne == 3) {
        
        UIAlertController *permitAlert13 = [UIAlertController alertControllerWithTitle:@"일삼광땡"
                                                                               message:@"장땡 << 일삼광땡 = 일팔광땡 << 삼팔광땡"
                                                                        preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *permitAction13 = [UIAlertAction actionWithTitle:@"오키"
                                                                 style:UIAlertActionStyleDefault
                                                               handler:actionHandler];
        
        [permitAlert13 addAction:permitAction13];
        [self presentViewController:permitAlert13 animated:YES completion:nil];

    }else if (self.oneAndpal == 1 && self.palAndone == 8) {
        
        UIAlertController *permitAlert18 = [UIAlertController alertControllerWithTitle:@"일팔광땡"
                                                                               message:@"장땡 << 일팔광땡 = 일삼광땡 << 삼팔광땡"
                                                                        preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *permitAction18 = [UIAlertAction actionWithTitle:@"오키"
                                                                 style:UIAlertActionStyleDefault
                                                               handler:actionHandler];
        
        [permitAlert18 addAction:permitAction18];
        [self presentViewController:permitAlert18 animated:YES completion:nil];

    }else if (self.threeAndpal == 3 && self.palAndthree == 8) {
        
        UIAlertController *permitAlert38 = [UIAlertController alertControllerWithTitle:@"삼팔광땡"
                                                                               message:@"천하무적 삼팔광땡"
                                                                        preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *permitAction38 = [UIAlertAction actionWithTitle:@"오키"
                                                                 style:UIAlertActionStyleDefault
                                                               handler:actionHandler];
        
        [permitAlert38 addAction:permitAction38];
        [self presentViewController:permitAlert38 animated:YES completion:nil];

    }else if (self.firstNumber == 0 || self.secondNumber == 0) {
    
    UIAlertController *permitAlert0 = [UIAlertController alertControllerWithTitle:@"선택안됨"
                                                                          message:@"선택이 되지않았습니다."
                                                                   preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *permitAction0 = [UIAlertAction actionWithTitle:@"오키"
                                                            style:UIAlertActionStyleDestructive
                                                          handler:actionHandler];
    
    [permitAlert0 addAction:permitAction0];
    [self presentViewController:permitAlert0 animated:YES completion:nil];
        
    }else {
    
        UIAlertController *permitAlert20 = [UIAlertController alertControllerWithTitle:@"조합아님"
                                                                              message:@"조합이 없습니다."
                                                                       preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *permitAction20 = [UIAlertAction actionWithTitle:@"오키"
                                                                style:UIAlertActionStyleDestructive
                                                              handler:actionHandler];
        
        [permitAlert20 addAction:permitAction20];
        [self presentViewController:permitAlert20 animated:YES completion:nil];

    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
