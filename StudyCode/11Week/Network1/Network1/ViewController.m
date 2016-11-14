//
//  ViewController.m
//  Network1
//
//  Created by geon hui kim on 2016. 11. 14..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property IBOutlet UIImageView *image1;
@property IBOutlet UIActivityIndicatorView *indigator;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //사진이미지가 있는 URL주소 지정
    NSURL *imageurl = [NSURL URLWithString:@"https://lh3.googleusercontent.com/-_Q0T4pWDKZc/Vy6CpgwI1XI/AAAAAAAAUMg/SWApFadvA1A/s0/tumblr_o6lv4cx1QP1qk12q0o1_1280.jpg"];
    
    //인디게이터 시작 / 로딩중 표시
    [self.indigator startAnimating];
    
    //세션 설정
    NSURLSession *session = [NSURLSession sessionWithConfiguration:
                             [NSURLSessionConfiguration defaultSessionConfiguration]];
    
    //태스크 : 세션을 통해 보낸다.
    NSURLSessionTask *task = [session dataTaskWithURL:imageurl
                                    completionHandler:^(NSData * _Nullable data,
                                                        NSURLResponse * _Nullable response,
                                                        NSError * _Nullable error) {
                                        if (data) {
                                            //파일은 데이터 형식으로 온다
                                            UIImage *image2 = [UIImage imageWithData:data];
                                            if (image2) {
                                                sleep(1);
                                                //ui를 수정하기 위해서는 main queue에 해주어야한다.
                                                dispatch_queue_t queue = dispatch_get_main_queue();
                                                //비동기 방식
                                                dispatch_async(queue, ^{
                                                    self.image1.image = image2;
                                                    self.image1.contentMode = UIViewContentModeScaleToFill;
                                                    
                                                    //인디게이터 정지 후 숨김
                                                    [self.indigator stopAnimating];
                                                    [self.indigator setHidden:YES];
                                                    
                                                });
                                            }
                                        }
                                    }];
                                    // resume을 해야 위의 코드가 실행이된다.
                                     [task resume];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
