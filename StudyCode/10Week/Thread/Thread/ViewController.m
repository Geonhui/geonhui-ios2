//
//  ViewController.m
//  Thread
//
//  Created by geon hui kim on 2016. 11. 11..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property NSThread *thread;
@property IBOutlet UILabel *timelabel;
@property NSInteger count;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //GCD
    //high, default, low, background
//    dispatch_queue_t queue = dispatch_get_main_queue();
//    dispatch_queue_t global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    
//    dispatch_sync(dispatch_get_main_queue(), ^{
//        for (NSInteger i = 0; i < 10000; i ++) {
//            for (NSInteger j = 0; j < 10000; j ++) {
//                
//            }
//        NSLog(@"main queue %ld", i);
//        }
//    });
    
    //serial = 직렬 큐, async = 비동기방식
    dispatch_queue_t queuequeue = dispatch_queue_create("test", DISPATCH_QUEUE_SERIAL);
    dispatch_async(queuequeue, ^{NSLog(@"serial async call 1");});
    dispatch_async(queuequeue, ^{NSLog(@"serial async call 2");});
    dispatch_async(queuequeue, ^{NSLog(@"serial async call 3");});
    dispatch_async(queuequeue, ^{NSLog(@"serial async call 4");});
    dispatch_async(queuequeue, ^{NSLog(@"serial async call 5");});
    
    //concurrent = 병렬 큐, async = 비동기방식
    dispatch_queue_t queuequeue1 = dispatch_queue_create("test1", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queuequeue1, ^{NSLog(@"concurrent async call 1");});
    dispatch_async(queuequeue1, ^{NSLog(@"concurrent async call 2");});
    dispatch_async(queuequeue1, ^{NSLog(@"concurrent async call 3");});
    dispatch_async(queuequeue1, ^{NSLog(@"concurrent async call 4");});
    dispatch_async(queuequeue1, ^{NSLog(@"concurrent async call 5");});

    //concurrent = 병렬 큐, sync = 동기방식
    dispatch_queue_t queuequeue2 = dispatch_queue_create("test1", DISPATCH_QUEUE_CONCURRENT);
    dispatch_sync(queuequeue2, ^{NSLog(@"concurrent sync call 1");});
    dispatch_sync(queuequeue2, ^{NSLog(@"concurrent sync call 2");});
    dispatch_sync(queuequeue2, ^{NSLog(@"concurrent sync call 3");});
    dispatch_sync(queuequeue2, ^{NSLog(@"concurrent sync call 4");});
    dispatch_sync(queuequeue2, ^{NSLog(@"concurrent sync call 5");});

    //concurrent = 병렬 큐, after = 시간이 지난 후 작업을 추가한다.
    dispatch_queue_t queuequeue3 = dispatch_queue_create("test3", DISPATCH_QUEUE_CONCURRENT);
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 3 * NSEC_PER_SEC);
    dispatch_after(popTime, queuequeue3, ^{NSLog(@"after call 1");});
    dispatch_async(queuequeue3, ^{NSLog(@"async call 2");});
    dispatch_async(queuequeue3, ^{NSLog(@"async call 3");});
    dispatch_async(queuequeue3, ^{NSLog(@"async call 4");});
    dispatch_async(queuequeue3, ^{NSLog(@"async call 5");});
    dispatch_async(queuequeue3, ^{NSLog(@"async call 6");});
    dispatch_async(queuequeue3, ^{NSLog(@"async call 7");});
    
    //concurrent = 병렬 큐, barrier = 작업을 구분
    dispatch_queue_t queuequeue4 = dispatch_queue_create("test4", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queuequeue4, ^{NSLog(@"async call 2");});
    dispatch_async(queuequeue4, ^{NSLog(@"async call 3");});
    dispatch_async(queuequeue4, ^{NSLog(@"async call 4");});
    dispatch_async(queuequeue4, ^{NSLog(@"async call 5");});
    dispatch_async(queuequeue4, ^{NSLog(@"async call 6");});
    dispatch_async(queuequeue4, ^{NSLog(@"async call 7");});
    dispatch_barrier_async(queuequeue4, ^{NSLog(@"---------------------------");});
    dispatch_async(queuequeue4, ^{NSLog(@"async call 8");});
    dispatch_async(queuequeue4, ^{NSLog(@"async call 9");});
    dispatch_async(queuequeue4, ^{NSLog(@"async call 10");});
    dispatch_async(queuequeue4, ^{NSLog(@"async call 11");});
    dispatch_async(queuequeue4, ^{NSLog(@"async call 12");});
    dispatch_async(queuequeue4, ^{NSLog(@"async call 13");});

    //dispatch_source_t timer
//    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, <#dispatchQueue#>);
//    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, <#intervalInSeconds#> * NSEC_PER_SEC, <#leewayInSeconds#> * NSEC_PER_SEC);
//    dispatch_source_set_event_handler(timer, ^{
//        <#code to be executed when timer fires#>
//    });
//    dispatch_resume(timer);
}

- (void)viewDidAppear:(BOOL)animated
{
    //스레드 생성하지 않고 실행
//    [self countLog];
    
}

-(IBAction)timeStart:(id)sender
{
    //스레드 생성
    self.thread = [[NSThread alloc] initWithTarget:self selector:@selector(startThread) object:nil];
    //스레드 시작
    [self.thread start];

}

//스레드 시작
- (void)startThread
{
    for (NSInteger i =0; i < 100; i ++) {
        
        [self performSelectorOnMainThread:@selector(changelabel) withObject:nil waitUntilDone:nil];
        sleep(1);
    }
}

//메서드 구분
#pragma mark - type
//타입변경
- (void)changelabel
{
    self.count ++;
    self.timelabel.text = [NSString stringWithFormat:@"%ld",self.count];
}

//스레드가 흘러가는 카운트확인
- (void)countLog
{
    for (NSInteger i=0; i<100000; i++) {
        for (NSInteger j=0; j<1000000; j++) {
            
        }
        NSLog(@"count log %ld",i);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
