//
//  ViewController.m
//  StateRestoration
//
//  Created by geon hui kim on 2016. 10. 28..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "ViewController.h"

//textFieldText란 객체를 전역변수로 만듬, 프로그램이 종료될때까지 없어지지않음
static NSString *UserInputText = @"UserInputText";

@interface ViewController ()

//텍스트필드 객체 >> 스토리보드와 연결
@property (weak, nonatomic) IBOutlet UITextField *aquaTextField;
@property (weak, nonatomic) IBOutlet UITextField *orangeTextField;
@property (weak, nonatomic) IBOutlet UITextField *pinkTextField;

//스트링 객체
@property NSString *userInputText;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

//뷰가 나타날때!
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (self.userInputText != nil) {
        self.orangeTextField.text = self.userInputText;
        self.userInputText = nil;
    }
}

//인코딩
- (void)encodeRestorableStateWithCoder:(NSCoder *)coder
{
    [super encodeRestorableStateWithCoder:coder];
    
    [coder encodeObject:self.orangeTextField.text forKey:UserInputText];
}

//디코딩
-(void)decodeRestorableStateWithCoder:(NSCoder *)coder
{
    [super decodeRestorableStateWithCoder:coder];
    
    NSString *text = [coder decodeObjectForKey:UserInputText];
    self.userInputText = text;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
