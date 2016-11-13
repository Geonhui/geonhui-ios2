//
//  ViewController.m
//  Block
//
//  Created by geon hui kim on 2016. 11. 10..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "ViewController.h"

//block을 별칭 지정
typedef void (^plus)(void);

@interface ViewController ()

//애니메이션 라벨
@property (weak, nonatomic) IBOutlet UILabel *testlabel;
@property (weak, nonatomic) IBOutlet UILabel *testlabel1;

//블럭 프로퍼티
@property void (^count)(void);

//typedef를 사용한 프로퍼티
@property plus pluscount;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //블럭 함수 사용하여 2 * 2
    //리턴타입을 지정해줄경우 return을 해주어야한다.
    void (^number)(NSInteger,NSInteger) = ^(NSInteger num1, NSInteger num2) {
        NSInteger total = num1 * num2;
        NSLog(@"%ld", total);
    };
    
    NSInteger number1 = 2;
    NSInteger number2 = 2;
    number(number1, number2);
    
    //다중파라미터, 리턴타입
    NSInteger (^totalnumber)(NSInteger,NSInteger) = ^(NSInteger count1, NSInteger count2) {
        NSInteger totalCount = count1 + count2;
        return totalCount;
    };
    
    NSInteger countNumber1 = 3;
    NSInteger countNumber2 = 3;
    totalnumber(countNumber1,countNumber2);
    
    //1 + 1, typedef를 사용함
    self.pluscount = ^{
        NSInteger plusnumber = 1 + 1;
        NSLog(@"%ld", plusnumber);
    };
    
    self.pluscount();
    
    //프로퍼티 이용
    self.count = ^{
        NSInteger countnumber = 100 - 50;
        NSLog(@"%ld", countnumber);
    };
    
    self.count();
    
    //블럭 test
    [self testMethod];
    
    //block is parameter
    [self simpleMethod:^(NSString *name) {
        NSLog(@"inner param %@", name);
    }];
    
    //-----------------------------------------------------------------------------------------------------------------------------
    
    //애니메이션
    [UIView beginAnimations:@"movemove" context:nil];
    
    [UIView setAnimationDelay:1];
    [UIView setAnimationDuration:3];
    [UIView setAnimationRepeatCount:3];
    
    [self.testlabel setFrame:CGRectMake(100, 300, self.testlabel.bounds.size.width,
                                                  self.testlabel.bounds.size.height)];
    [self.testlabel setAlpha:0.5];
    
    [UIView commitAnimations];
    
    //weak으로 지정해줌
    ViewController __weak *wself = self;
    
    //block사용 애니메이션
    //블럭내에서는 reperence count를 올려주기만 하고 내려주진 않기때문에 위의 self를 weak으로 지정해준다.
    void (^ani)(void) = ^{
      [wself.testlabel setFrame:CGRectMake(100, 300, self.testlabel.bounds.size.width,
                                                     self.testlabel.bounds.size.height)];
    };
    
    //위의 block을 ani에 해주어도 된다.
    [UIView animateWithDuration:3 animations:ani];
    
}

//block capture value, 캡쳐
//1. 30이 들어가지만 블럭변수값을 변경되도록 하였기때문에 84가 들어간다
//2. 로그를 찍는다 84로 나온다
//3. 100이 들어간다.
//4. 로그를 찍는다. 100으로 나온다.
- (void)testMethod {
    
    //__block = readonly, readwrite라고 생각하면됨
    //__block은 블럭변수의 값들을 바꿀수가 있다.
    __block NSInteger anInteger = 30;
    
    void (^testBlock)(void) = ^{
        NSLog(@"block in integer is : %ld", anInteger);
        anInteger = 100;
    };
    
    anInteger = 84;
    
    testBlock();
    NSLog(@"block out integer is : %ld", anInteger);
}

//block is parameter
//- (void)simpleMethod:(myName)param, myname은 typedef
- (void)simpleMethod:(void(^)(NSString *name))param
{
    NSLog(@"befor startblock");
    param(@"in param");
    NSLog(@"after endblock");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
