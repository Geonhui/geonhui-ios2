//
//  ViewController.m
//  KeyboardNotification
//
//  Created by JoSeongGyu on 2016. 10. 29..
//  Copyright © 2016년 Jo Seong Gyu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *stateLabel;
@property (weak, nonatomic) IBOutlet UILabel *frameLabel;

@end

@implementation ViewController

- (IBAction)tapBackground:(id)sender {
    
    for (UIView *subview in [[self view] subviews]) {
        if ([subview isFirstResponder]) {
            [subview resignFirstResponder];
        }
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didReceiveKeyboardChangeNotification:)
                                                 name:UIKeyboardDidShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didReceiveKeyboardChangeNotification:)
                                                 name:UIKeyboardDidHideNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didReceiveKeyboardChangeNotification:)
                                                 name:UIKeyboardDidChangeFrameNotification
                                               object:nil];
}

- (void)didReceiveKeyboardChangeNotification:(NSNotification *)noti {
    NSLog(@"%@", noti);
    
    if ([[noti name] isEqualToString:UIKeyboardDidShowNotification]) {
        [[self stateLabel] setText:@"키보드 있음"];
    } else if ([[noti name] isEqualToString:UIKeyboardDidHideNotification]) {
        [[self stateLabel] setText:@"키보드 없음"];
    }
    
    if ([[noti name] isEqualToString:UIKeyboardDidChangeFrameNotification]) {
        NSValue *frameValue = [[noti userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey];
        
        if ([frameValue isKindOfClass:[NSValue class]]) {
            
            CGRect keyboardFrame = [frameValue CGRectValue];
            
            NSString *frameString = NSStringFromCGRect(keyboardFrame);
            
            [[self frameLabel] setText:frameString];
        }
    }    
}


@end
