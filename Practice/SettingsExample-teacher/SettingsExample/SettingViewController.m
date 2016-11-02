//
//  SettingViewController.m
//  SettingsExample
//
//  Created by JoSeongGyu on 2016. 10. 29..
//  Copyright © 2016년 Jo Seong Gyu. All rights reserved.
//

#import "SettingViewController.h"

//글씨색상 슬라이더
//tag는 integer값으로 되어있다, 제일 첫번째 tag에 값을 지정해주면 1씩 증가한다.
//원래 tag값은 0부터 시작한다.
NS_ENUM(NSInteger) {
    tagSliderRed = 100,
    tagSliderGreen,
    tagSliderBlue
};

//글씨크기 세그먼트
NS_ENUM(NSInteger) {
    sizeSegmentIndexSmall,
    sizeSegmentIndexMedium,
    sizeSegmentIndexLarge
};

@interface SettingViewController ()

//변경되는 레이블
@property (weak, nonatomic) IBOutlet UILabel *previewLabel;

@end

@implementation SettingViewController

//색상변경 슬라이드 메서드
//스토리보드의 슬라이드 3개를 한 메서드에 연결시킴
- (IBAction)colorSliderValueChanged:(UISlider *)sender {
   
    //슬라이더 객체를 만들고 self view의 태그로 위에서 지정한 NS_ENUM에 integer타입의 tag값을 지정해주었다.
    UISlider *redSlider = [[self view] viewWithTag:tagSliderRed];
    UISlider *greenSlider = [[self view] viewWithTag:tagSliderGreen];
    UISlider *blueSlider = [[self view] viewWithTag:tagSliderBlue];
    
    //isKindOfClass 클래스 확인
    if (([redSlider isKindOfClass:[UISlider class]] &&
         [greenSlider isKindOfClass:[UISlider class]] &&
         [blueSlider isKindOfClass:[UISlider class]]) == NO ) {
        return;
    }
    
    //slider값이 float값이기 때문에 float으로 만든 변수에 value값을 받아온다.
    float redValue = redSlider.value;
    float greenValue = greenSlider.value;
    float blueValue = blueSlider.value;

    //3가지 색상 넣어주기
    UIColor *color = [UIColor colorWithRed:redValue
                                     green:greenValue
                                      blue:blueValue
                                     alpha:1.f];
    
    [[self previewLabel] setTextColor:color];
}

//크기변경 세그먼트 메서드
- (IBAction)sizeSegmentValueChanged:(UISegmentedControl *)sender {
    
    UIFont *font = nil;
    
    switch ([sender selectedSegmentIndex]) {
        case sizeSegmentIndexSmall:
            font = [UIFont systemFontOfSize:10.f];
            break;
            
        case sizeSegmentIndexMedium:
            font = [UIFont systemFontOfSize:15.f];
            break;
            
        case sizeSegmentIndexLarge:
            font = [UIFont systemFontOfSize:20.f];
            break;
    }
    
    if (font) {
        [[self previewLabel] setFont:font];
    }
}

//변경사항 저장 버튼
- (IBAction)clickSaveButton:(id)sender {
    
    if ([self previewLabel] == nil || [[self previewLabel] font] == nil || [[self previewLabel]textColor] == nil) {
        return;
    }
    
    //
    NSDictionary *userInfo = @{UserInfoKeyLabelFont : self.previewLabel.font,
                               UserInfoKeyLabelTextColor : self.previewLabel.textColor};
    
    //notificationcenter에 postnotification을 쏴준다?
    [[NSNotificationCenter defaultCenter] postNotificationName:DidChangeSettingNotification
                                                        object:self
                                                      userInfo:userInfo];
 
    //pop은 넣어준다.
    [self.navigationController popViewControllerAnimated:YES];
}

@end
