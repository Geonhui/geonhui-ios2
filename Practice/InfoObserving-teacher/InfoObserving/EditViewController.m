//
//  EditViewController.m
//  InfoObserving
//
//  Created by JoSeongGyu on 2016. 11. 7..
//  Copyright © 2016년 Jo Seong Gyu. All rights reserved.
//

#import "EditViewController.h"
//데이터 저장
#import "UserInformation.h"

@interface EditViewController ()

//고정된 라벨
@property IBOutlet UILabel *idLabel;
@property IBOutlet UILabel *pwLabel;

//변경될 라벨의 텍스트필드
@property IBOutlet UITextField *lastNameField;
@property IBOutlet UITextField *firstNameField;
@property IBOutlet UITextField *ageField;
@property IBOutlet UITextField *hobbyField;

@end

@implementation EditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //싱글턴에 저장
    //뷰가 실행되었을때는 싱글턴객체에 저장되어있던 값이 나오고
    UserInformation *info = [UserInformation sharedUserInfo];
    self.idLabel.text = info.userId;
    self.pwLabel.text = info.userPassword;
    self.lastNameField.text = info.lastName;
    self.firstNameField.text = info.firstName;
    self.ageField.text = info.age;
    self.hobbyField.text = info.hobby;
    
}

//save버튼 누를경우
- (IBAction)clickSaveButton:(id)sender {
    
    UserInformation *info = [UserInformation sharedUserInfo];
    
    //save버튼이 실행되었을 경우 입력된 텍스트필드의 텍스트가 싱글턴에 저장
    info.lastName = self.lastNameField.text;
    info.firstName = self.firstNameField.text;
    info.age = self.ageField.text;
    info.hobby = self.hobbyField.text;
    
    //save되면서 화면이 pop된다.
    [self.navigationController popViewControllerAnimated:YES];
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
