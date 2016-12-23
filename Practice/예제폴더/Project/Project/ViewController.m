//
//  ViewController.m
//  Project
//
//  Created by Yang on 2016. 10. 29..
//  Copyright © 2016년 Yang. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()
<UIScrollViewDelegate>

@property (nonatomic)UIScrollView *scroll;
@property (nonatomic)NSArray *Blackpink;

@property(nonatomic, retain) IBOutlet UIScrollView *scrollView;
@property(nonatomic, retain) IBOutlet UIPageControl *pageControl;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
  

    
    self.Blackpink = @[@{@"name":@"블랙핑크",@"image":@"블랙핑크2.jpeg"},
                       @{@"name":@"블랙핑크",@"image":@"블랙핑크3.jpeg"},
                       @{@"name":@"블랙핑크",@"image":@"블랙핑크4.jpeg"},
                       @{@"name":@"블랙핑크",@"image":@"블랙핑크5.jpeg"},
                       @{@"name":@"제니",@"image":@"제니.jpeg"},
                       @{@"name":@"지수",@"image":@"지수.jpg"},
                       @{@"name":@"블랙핑크",@"image":@"블랙핑크1.jpeg"}];
    
    

    //이미지 불러오기
    NSUInteger i = 0;
    NSMutableArray *thisImg = [[NSMutableArray alloc] init];
    
    for(NSDictionary *songName in self.Blackpink){
        [thisImg addObject:[songName objectForKey:@"image"]];
    }
    i = thisImg.count;
    [self.scrollView setContentSize:CGSizeMake(self.scrollView.frame.size.width * i, self.scrollView.frame.size.height)];
    
    for (NSInteger i = 0 ; i < thisImg.count; i += 1) {
        UIImage *img = [[UIImage alloc] init];
        img = [UIImage imageNamed:[thisImg objectAtIndex:i]];
        
        UIImageView *imgView = [[UIImageView alloc] init];
        imgView.frame = CGRectMake(self.scrollView.frame.size.width * i, 0,
                                   self.scrollView.frame.size.width, self.scrollView.frame.size.height);
        
        imgView.contentMode = UIViewContentModeScaleToFill;
        [imgView setImage:img];
        [self.scrollView addSubview:imgView];
        if(i == 0){
            NSLog(@"이미지");
        }
    }
    //ScrollView에 필요한 옵션을 적용한다.
    
    
    //vertical = 세로 , Horizontal = 가로 스크롤효과를 적용.
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.showsHorizontalScrollIndicator = YES;
    
    // 스크롤이 경계에 도달하면 바운싱효과를 적용
    self.scrollView.alwaysBounceVertical = NO;
    self.scrollView.alwaysBounceHorizontal = NO;
    
    //페이징 가능 여부 YES
    self.scrollView.pagingEnabled = YES;
    self.scrollView.delegate = self;
    
    //pageControl에 필요한 옵션을 적용한다.
    //현재 페이지 index는 0
    self.pageControl.currentPage = 0;
    self.pageControl.currentPageIndicatorTintColor = [UIColor orangeColor];
    self.pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    
    //페이지 갯수
    self.pageControl.numberOfPages = self.Blackpink.count;
    
    //페이지 컨트롤 값변경시 이벤트 처리 등록
    [self.pageControl addTarget:self action:@selector(pageChangeValue:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:self.pageControl];
}

//스크롤이 변경될때 page의 currentPage 설정
- (void)scrollViewDidScroll:(UIScrollView *)sender
{
    
    self.pageControl.currentPage = self.scrollView.contentOffset.x / self.scrollView.frame.size.width;
}

//페이지 컨트롤 값이 변경될때, 스크롤뷰 위치 설정
- (void) pageChangeValue:(id)sender
{
    UIPageControl *pControl = (UIPageControl *) sender;
    [self.scrollView setContentOffset:CGPointMake(pControl.currentPage*320, 0) animated:YES];
}

// 스크롤바를 보였다가 사라지게 함
- (void)viewDidAppear:(BOOL)animated
{
    [self.scrollView flashScrollIndicators];
}

- (void)didReceiveMemoryWarning {

    [super didReceiveMemoryWarning];
    
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}



@end
