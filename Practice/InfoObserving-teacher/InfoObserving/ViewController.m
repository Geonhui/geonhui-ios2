//
//  ViewController.m
//  InfoObserving
//
//  Created by JoSeongGyu on 2016. 11. 7..
//  Copyright © 2016년 Jo Seong Gyu. All rights reserved.
//

#import "ViewController.h"
//데이터 저장
#import "UserInformation.h"

@interface ViewController ()

//초기화면의 변경될 라벨들
@property IBOutlet UILabel *idLabel;
@property IBOutlet UILabel *pwLabel;
@property IBOutlet UILabel *nameLabel;
@property IBOutlet UILabel *ageLabel;
@property IBOutlet UILabel *hobbyLabel;

@end

@implementation ViewController

//뷰가 나타날때
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    //나이는 뷰 생명주기를 이용하여 띄움
    self.ageLabel.text = [[UserInformation sharedUserInfo] age];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    //지정된값으로 바로 표현
    [[UserInformation sharedUserInfo] setUserId:@"yagom"];
    [[UserInformation sharedUserInfo] setUserPassword:@"1234"];
    
    //key value observing지정
    [[UserInformation sharedUserInfo] addObserver:self
                                       forKeyPath:@"userId"
                                          options:NSKeyValueObservingOptionNew
                                          context:nil];
    
    [[UserInformation sharedUserInfo] addObserver:self
                                       forKeyPath:@"userPassword"
                                          options:NSKeyValueObservingOptionNew
                                          context:nil];
    
    
    [[UserInformation sharedUserInfo] addObserver:self
                                       forKeyPath:@"lastName"
                                          options:NSKeyValueObservingOptionNew
                                          context:nil];
    
    
    [[UserInformation sharedUserInfo] addObserver:self
                                       forKeyPath:@"firstName"
                                          options:NSKeyValueObservingOptionNew
                                          context:nil];
    
    
//    [[UserInformation sharedUserInfo] addObserver:self
//                                       forKeyPath:@"age"
//                                          options:NSKeyValueObservingOptionNew
//                                          context:nil];
//    
    
//    [[UserInformation sharedUserInfo] addObserver:self
//                                       forKeyPath:@"hobby"
//                                          options:NSKeyValueObservingOptionNew
//                                          context:nil];
    
    //노티피케이션 등록
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didReceiveHobbyChanged:)//아래의 메서드
                                                 name:DidChangeHobbyValueNotification   //지정된 노티피케이션 이름
                                               object:[UserInformation sharedUserInfo]];//싱글턴
}

//노티피케이션
//취미는 노티피케이션으로 띄웠고
- (void)didReceiveHobbyChanged:(NSNotification *)noti {
    
    self.hobbyLabel.text = [[UserInformation sharedUserInfo] hobby];
}

//key value objerving
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
    //변화되는 값의 상태를 지켜보면서 변경
    self.idLabel.text = [[UserInformation sharedUserInfo] userPassword];
    self.pwLabel.text = [[UserInformation sharedUserInfo] userId];
    self.nameLabel.text = [[UserInformation sharedUserInfo] fullName];
    
}

- (void)dealloc {
    
}


@end
