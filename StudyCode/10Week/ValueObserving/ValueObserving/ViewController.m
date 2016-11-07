//
//  ViewController.m
//  ValueObserving
//
//  Created by geon hui kim on 2016. 11. 7..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

//숫자
@property (weak, nonatomic) IBOutlet UILabel *changelabel;
@property NSInteger count;

//성, 이름
@property (weak, nonatomic) IBOutlet UITextField *lastnametext;
@property (weak, nonatomic) IBOutlet UITextField *firstnametext;

//프로퍼티 설정
@property NSString *firstName;
@property NSString *lastName;
@property (readonly) NSString *fullName; //읽기전용 readonly

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //변경하는값을 볼수가 있다(관찰자)
    //observer = 관찰자, keypath = 지켜볼 변수이름, option 4가지, context = nil
    [self addObserver:self
           forKeyPath:@"count"
              options:NSKeyValueObservingOptionNew |
              NSKeyValueObservingOptionInitial |
              NSKeyValueObservingOptionPrior |
              NSKeyValueObservingOptionOld
              context:nil];
}
//---------------------------------------------------------------------------------------------------------------------------------------
//값을 지켜보는 메서드
- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSKeyValueChangeKey,id> *)change
                       context:(void *)context
{
    //kind, new, old, prior
    NSLog(@"keypath : %@\n infodic : %@", keyPath, change);
}

//사용 후 dealloc이 필요하다, 옵저버
- (void)dealloc
{
    [self removeObserver:self forKeyPath:@"count"];
}
//---------------------------------------------------------------------------------------------------------------------------------------

//버튼을 누를경우 1씩 증가
- (IBAction)pushbutton:(id)sender
{
    self.count ++;
    [self.changelabel setText:[NSString stringWithFormat:@"%ld", self.count]];
    
//    다른방법
//    static NSInteger count = 0;
//    count++;
//    self.changelabel.text = [NSString stringWithFormat:@"%ld", count];
}

//버튼을 누를경우 1씩 감소
- (IBAction)minusbutton:(id)sender
{
    self.count --;
    [self.changelabel setText:[NSString stringWithFormat:@"%ld", self.count]];
}

//버튼을 누를경우 2를 곱함
- (IBAction)doublebutton:(id)sender
{
    self.count = self.count * 2;
    [self.changelabel setText:[NSString stringWithFormat:@"%ld", self.count]];
}

//count라는 프로퍼티를 setter로 사용
//- (void)setCount:(NSInteger)count
//{
//    //_count 내부변수에 언더바를 사용
//    _count = count;
//    self.changelabel.text = [NSString stringWithFormat:@"%ld", self.count];
//}
//---------------------------------------------------------------------------------------------------------------------------------------

//성, 이름을 합친다.
- (IBAction)addname:(id)sender
{
    self.lastName = self.lastnametext.text;
    self.firstName = self.firstnametext.text;
    
    NSLog(@"%@", self.fullName);
}

//fullname
- (NSString *)fullName
{
    return [NSString stringWithFormat:@"%@%@", _lastName, _firstName];
}
//---------------------------------------------------------------------------------------------------------------------------------------

//setter가 getter를 통해 바뀌는것
//- (void)setFirstName:(NSString *)firstName
//{
//    _firstName = firstName;
//    self.fullName = [firstName stringByAppendingString:_lastName];
//    //stringByAppendingString: 스트링끼리 묶어준다.
//    //fullName프로퍼티가 readOnly로 되어있어서 setter로 사용하지못함
//}
//
//- (void)setLastName:(NSString *)lastName
//{
//    _lastName = lastName;
//    self.fullName = [NSString stringWithFormat:@"%@%@",_firstName,_lastName];
//    [_lastName stringByAppendingString:_firstName];
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
