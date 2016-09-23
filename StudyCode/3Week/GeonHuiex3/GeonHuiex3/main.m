//
//  main.m
//  GeonHuiex3
//
//  Created by geon hui kim on 2016. 9. 21..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//
//-------------------------------------------------------------------------------------------------
// 헤더 가져오기
#import <Foundation/Foundation.h>
#import "Warrior.h"
#import "Wisserd.h"
#import "Dog.h"
#import "Cat.h"
int main(int argc, const char * argv[]) {
//-------------------------------------------------------------------------------------------------
    // 객체생성, 객체초기화 (변수이름은 알아서 지정)
    // 프로퍼티 셋팅
    Warrior *jack = [[Warrior alloc] init];
    jack.height = 180;
    jack.kg = 90;
    jack.footsize = 280;
    jack.power = 1.1;
    jack.isdead = NO;
    
    Wisserd *soser = [[Wisserd alloc] init];
    soser.eyesight = 3.5;
    soser.kg = 50;
    soser.mana = 1.1;
    soser.isdie = YES;
    
    Dog *big = [[Dog alloc] init];
    big.name = @"big";
    big.color = @"brown";
    big.spec = @"wellsicogi";
    
    Cat *tom = [[Cat alloc] init];
    tom.name = @"jerry";
    tom.color = @"gray";
    tom.spec = @"menchiken";
    
    // 메서드 호출
    // 다른 변수끼를 서로 메서드 연결
    [jack punchTo:soser];
    [soser skillMe:soser];
    [big cry:@"나"];
//-------------------------------------------------------------------------------------------------
    // 형식지정자 //
    // 정수타입 - 부호가 있는 32bit 정수타입 > 10진수 (%d)
    // 정수타입 - 부호가 있는 64bit 정수타입 > 10진수 (%ld)
    NSLog(@"height : %ld", jack.height);
    
    // 정수타입 - 부호가 없는 32bit 정수타입 > 10진수 (%u)
    // 정수타입 - 부호가 없는 64bit 정수타입 > 10진수 (%lu)
    NSLog(@"height : %lu", jack.height);
    
    // 정수타입 (16진수)
    NSLog(@"height : %lx", jack.height);
    
    // 정수타입 (8진수)
    NSLog(@"height : %lo", jack.height);
    
    // 실수타입 - 32bit 실수타입 > 10진수 (%f)
    // 실수타입 - 64bit 실수타입 > 10진수 (%lf)
    NSLog(@"float value : %lf", soser.eyesight);
    
    // 불리언 타입 %d YES,NO가 0,1로 표현되기때문에 32비트 10진수와 같다
    NSLog(@"Boolean value ; %d", YES);
    NSLog(@"Boolean value ; %d", NO);

    // 캐릭터 타입 %c
    NSLog(@"character : %c %c %c", 'a','b','c');
    
    // %를 표현할때 %%
    NSLog(@"몇 500%% 인가요?");
    
    // 주소값을 확인할때 %p
    NSLog(@"jack object : %@, mamory address: %p",jack,jack);
    
    // 줄바꿈 \n
    NSLog(@"줄\n바꾸기");
    
    // 탭 표현 \t
    NSLog(@"사이에 \t을 넣어준다");
    
    // 응용
    NSLog(@"키는 %ld이고 \n몸무게는 %ld \n발사이즈%ld \n %d",jack.height,jack.kg,jack.footsize,jack.isdead);
    
    // long : 32bit 부호가 있는 정수 타입
    // int : 64bit 부호가 있는 정수 타입
    
    // 형식지정자 찾아보기
    // %-51d
    // %-041d
    // %+31d
    // %5.2f
    // %-10.3f
    // %10.0f
    // %.3f
    
    
    
//-------------------------------------------------------------------------------------------------
    //타입 종류 설명
    //불리언타입//
    //   죽음에대한 설명      결과
    BOOL haveBlood = NO;
    BOOL dontHaveBlood = YES;

    //부호가있는 정수타입//
    //        부호를 사용함         부호사용숫자
    NSInteger signedInteger = -100;
    NSInteger twoHundred = 200;
    
    //부호가없는 정수타입//
    //         부호를 사용하지않음     부호사용하지않은숫자
    NSUInteger unsignedinteger = 100;
    NSUInteger hundred = 100;
    //dontHaveBlood에 (괄호안의값)을 넣어준다.
    dontHaveBlood = (twoHundred > hundred);
    //hundred의 "값"을 anotherNumber에 복사한다.
    NSInteger anotherNumber = hundred;
    
    //객체형 숫자 타입//
    //선언이후 사용할때는 *를 붙이지 않는다.
    //       객체형 숫자를 생성, 초기화
    NSNumber *someNumberObject = [[NSNumber alloc] initWithInt:100];
    //       someNumberObject의 "주소"를 anotherNumberVariable에 복사한다.
    NSNumber *anotherNumberVariable = someNumberObject;
    
    //실수형 숫자 타입//
    //키, 몸무게, 시력
    CGFloat height = 200.3;
    CGFloat weight = 100.5;
    CGFloat eyesight = 1.0;
    
    //한글자만 표현 하는 타입
    char somecharacter = 'a';

//-------------------------------------------------------------------------------------------------
    return 0;
}
