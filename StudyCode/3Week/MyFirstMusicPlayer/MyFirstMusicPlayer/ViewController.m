//
//  ViewController.m
//  MyFirstMusicPlayer
//
//  Created by geon hui kim on 2016. 9. 23..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//
// 음악파일 실행눌러서 음악이 시작되고 시간이다되면 정지한다
// 시작버튼눌러서 음악재생하고, 정지버튼눌러서 음악정지한다.
#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
@interface ViewController () <AVAudioPlayerDelegate>

@property AVAudioPlayer *player;
@property UIButton *playButton;
@property UILabel *timeLabel;
@property NSTimer *timer;

- (void)displaytime:(NSTimeInterval)currentTime
           duration:(NSTimeInterval)duration;

@end

@implementation ViewController

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect labelFrame = CGRectMake(30.f, 30.f, 250.f, 30.f);
    CGRect buttonFrame = CGRectMake(30.f, 70.f, 50.f, 30.f);
    
    self.playButton = [[UIButton alloc] initWithFrame:buttonFrame];
    
    [self.playButton setTitle:@"play"
                     forState:UIControlStateNormal];
    
    [self.playButton setTitle:@"pause"
                     forState:UIControlStateSelected];
    
    [self.playButton setTitleColor:[UIColor blueColor]
                          forState:UIControlStateSelected];
    
    [self.playButton setTitleColor:[UIColor redColor]
                          forState:UIControlStateSelected];
    
    [self.playButton setBackgroundColor:[UIColor yellowColor]];
    
    [self.playButton addTarget:self action:@selector(clickPlayButton:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.view addSubview:self.playButton];
    
    self.timeLabel = [[UILabel alloc] initWithFrame:labelFrame];
    [self.timeLabel setTextColor:[UIColor brownColor]];
    [self.view addSubview:self.timeLabel];
    
    [self displaytime:0 duration:0];
    
    
    
    NSURL *soundFileURL = [[NSBundle mainBundle] URLForResource:@"sound"
                                                  withExtension:@"mp3"];
    
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFileURL error:nil];
    
    [self.player setDelegate:self];
    
}

#pragma mark - display Something

- (void)displaytime:(NSTimeInterval)currentTime duration:(NSTimeInterval)duration {
    NSInteger currentMin = (NSInteger)(currentTime / 60.0);
    NSInteger currentSec = ((NSInteger)currentTime % 60);
    
    NSInteger durationMin = (NSInteger)(duration /60.0);
    NSInteger durationSec = ((NSInteger)duration % 60);
    
    NSString *timeString = [[NSString alloc] initWithFormat:@"%02ld:%02ld / %02ld:%02ld",
                            currentMin, currentSec, durationMin,durationSec];
    
    [self.timeLabel setText:timeString];
}

#pragma mark - Button Methods

- (void)clickPlayButton:(UIButton *)sender {
    [sender setSelected:!sender.selected];
    
    if (sender.isSelected == YES) {
        [self.player play];
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0f
                                                      target:self
                                                    selector:@selector(checkTime)
                                                    userInfo:nil
                                                     repeats:YES];
        [self.timer fire];
    } else {
        [self.player pause];
        [self.timer invalidate];
        
    }
    return;
}

- (void)checkTime {
    if ((self.player.duration > 0) && (self.player.currentTime > 0)) {
        [self displaytime:self.player.currentTime
                 duration:self.player.duration];
    }
    return;
}


#pragma mark - AVAudioPlayerDelegate Methods

- (void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer *)player error:(NSError *)error {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"alarm" message:@"warnimg" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"확인" style:UIAlertActionStyleDefault handler:nil];
    
    [alert addAction:action];
    
    [self presentViewController:alert animated:YES completion:^{
        NSLog(@"decode error occured : %@", error.localizedDescription);
    }];
    
}

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
    NSLog(@"음악 재생이 종료됨");
    [self displaytime:0
             duration:self.player.duration];
    
    [self.playButton setSelected:NO];
    [self displaytime:0 duration:self.player.duration];
    
    
}
@end
