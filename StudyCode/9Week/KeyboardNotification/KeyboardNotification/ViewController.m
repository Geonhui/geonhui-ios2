//
//  ViewController.m
//  KeyboardNotification
//
//  Created by geon hui kim on 2016. 10. 31..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

//키보드 유무와 키보드 사이즈에 대한 프로퍼티
@property (weak, nonatomic) IBOutlet UILabel *keyboardstatus;
@property (weak, nonatomic) IBOutlet UILabel *keyboardposition;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //키보드가 나타날때의 노티피케이션
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(willRecieveDidkeyboardShowNotification:)
                                                 name:UIKeyboardDidShowNotification
                                               object:nil];
    
    //키보드가 숨겨질때의 노티피케이션
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didRecieveWillKeyboardShowNotification:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];

    //키보드의 상태(크기나, 상태)의 노티피케이션
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(willRecieveDidkeyboardShowNotification:)
                                                 name:UIKeyboardDidChangeFrameNotification
                                               object:nil];
}

//키보드 들어갔을때
- (void)didRecieveWillKeyboardShowNotification:(NSNotification *)noti {
    
    if ([[noti name] isEqualToString:UIKeyboardWillHideNotification]) {
        [self.keyboardstatus setText:@"키보드 없음"];
    }
}

//키보드 나올때
- (void)willRecieveDidkeyboardShowNotification:(NSNotification *)noti {
    
    if ([[noti name] isEqualToString:UIKeyboardDidShowNotification]) {
        [self.keyboardstatus setText:@"키보드 있음"];
    }
    
    //노티의 이름이 UIKeyboardDidChangeFrameNotification일때
    //UIKeyboardDidChangeFrameNotification에 키보드의 여러정보가 담겨져 있다고함
    if ([[noti name] isEqualToString:UIKeyboardDidChangeFrameNotification]) {
        
        //noti의 userinfo가 딕셔너리로 되어있기 때문에 딕셔너리의 있는 데이터를 NSValue타입 변수로 가져온다.
        NSValue *frameValue = [[noti userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey];
        
        //이 클래스가 상속받은 클래스의 인스턴스인지 확인, 클래스의 종류
        if ([frameValue isKindOfClass:[NSValue class]]) {
            
            //키보드 사이즈 cgrect의 value값을 받아온다.
            //문자로 반환해주어야 하기때문에 cgrect의 값을 string으로 바꿔서 가지고 온다.
            //keyboardposition의 텍스트에 string으로 받아온 변수를 넣어준다.
            CGRect keyboardFrame = [frameValue CGRectValue];
            NSString *frameString = NSStringFromCGRect(keyboardFrame);
            [[self keyboardposition] setText:frameString];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
