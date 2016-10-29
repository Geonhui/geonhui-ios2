//
//  ViewController.m
//  RestoreStates
//
//  Created by JoSeongGyu on 2016. 10. 27..
//  Copyright © 2016년 Jo Seong Gyu. All rights reserved.
//

#import "ViewController.h"

static NSString *UserInputText = @"UserInputText";

@interface ViewController () 

@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UITextField *textField;

@property NSString *userInputText;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSLog(@"_____ view will appear %d", self.userInputText != nil);
    //스트링의 객체에 어떤 텍스트라도 있을경우
    if (self.userInputText != nil) {
        //텍스트필드의 객체의 텍스트에 인코드한 스트링객체의 텍스트가 들어가고
        self.textField.text = self.userInputText;
        //스트링객체에는 닐값을 넣어준다
        self.userInputText = nil;
    }
}

- (IBAction)dismissSelf:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)encodeRestorableStateWithCoder:(NSCoder *)coder {
    
    [super encodeRestorableStateWithCoder:coder];
    NSLog(@"_____ ENCODE state %@", self.textField.text);
    //코더가 무엇인지?
    //인코더 객체는 텍스트필드 객체의 텍스트이고 그 키는 전역변수로 만들어준 UserInputText이다.
    [coder encodeObject:self.textField.text forKey:UserInputText];
}

- (void)decodeRestorableStateWithCoder:(NSCoder *)coder {
    
    [super decodeRestorableStateWithCoder:coder];
    
    //스트링 text에 디코드객체키가 UserInputText이다.?
    NSString *text = [coder decodeObjectForKey:UserInputText];
    
    NSLog(@"_____ DECODE state %@", text);
    
    //스트링 객체에 디코드객체키를 넣어준다?
    self.userInputText = text;
    
}



@end
