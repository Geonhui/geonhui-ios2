//
//  ViewController.m
//  StateRestoration
//
//  Created by geon hui kim on 2016. 10. 28..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "ViewController.h"

static NSString *textFieldText = @"textFieldText";

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *aquaTextField;
@property (weak, nonatomic) IBOutlet UITextField *orangeTextField;
@property (weak, nonatomic) IBOutlet UITextField *pinkTextField;

@property NSString *textFieldText;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

//인코딩
- (void)encodeRestorableStateWithCoder:(NSCoder *)coder
{
    [super encodeRestorableStateWithCoder:coder];
    
    [coder encodeObject:self.orangeTextField.text forKey:textFieldText];
}

//디코딩
-(void)decodeRestorableStateWithCoder:(NSCoder *)coder
{
    [super decodeRestorableStateWithCoder:coder];
    
    NSString *text = [coder decodeObjectForKey:self.textFieldText];
    self.textFieldText = text;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
