//
//  ViewController.m
//  CollectionViewTest2
//
//  Created by geon hui kim on 2016. 11. 30..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "ViewController.h"
#import "CustomCell.h"
#import "CollectionLayout.h"

#define defaultMinRatio 6
#define defaultMaxRatio 1.5

@interface ViewController ()

//사진제목
@property NSArray *photoName;

//사진
@property NSArray *photo;

//레이아웃
@property CollectionLayout *slidingLayout;

//셀의 크기
@property CGFloat minRatio;
@property CGFloat maxRatio;

@end

@implementation ViewController

@synthesize collectionView, item;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //xib 지정
    [self.collectionView registerNib:[UINib nibWithNibName:@"CellStyle" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"cell"];
    
    //layout
    self.slidingLayout = [[CollectionLayout alloc] initWithMaxRatio:defaultMaxRatio andMinRatio:defaultMinRatio];
    [self.collectionView setCollectionViewLayout:self.slidingLayout];
    [self.collectionView.collectionViewLayout invalidateLayout];
    
    //셀크기
    self.maxRatio = defaultMaxRatio;
    self.minRatio = defaultMinRatio;
    
    /*afterDelay : 메시지를 보내기 전의 최소 시간입니다. 
                   지연 0을 지정해도 선택기가 즉시 수행되는 것은 아닙니다.
                   선택기는 여전히 스레드의 실행 루프에 대기하여 가능한 한 빨리 수행됩니다.
     */
    [self performSelector:@selector(quickFix) withObject:nil afterDelay:0.01];
    
    //사진이름, 사진 배열
    self.photoName = @[@"1번사진",@"2번사진",@"3번사진",@"4번사진",@"5번사진",@"6번사진",@"7번사진",@"8번사진",@"9번사진",@"10번사진"];
    self.photo = @[@"건희1.jpg",@"건희2.jpg",@"건희3.jpg",@"건희4.jpg",@"건희5.jpg",@"건희6.jpg",@"건희7.jpg",@"건희8.jpg",@"건희9.jpg",@"건희10.jpg"];
}

#pragma mark - qick fix
//뷰에 진입시 컬렉션 뷰 고정위치
-(void)quickFix
{
    [self.collectionView setContentOffset:CGPointMake(0, self.collectionView.contentOffset.y + 1)];
    
}

//이 View Controller에 대한 상태 표시 줄 변경에 사용해야하는 애니메이션 유형을 반환하도록 재정의합니다.
//현재는 prefersStatusBarHidden에 대한 변경 사항에만 영향을 미칩니다.
-(BOOL)prefersStatusBarHidden
{
    return YES;//defult = no
}

#pragma mark - cell custom action
-(void)layoutSubviewsWithAttributes:(NSMutableArray *)theAttributes
{
    for(int i = 0; i < theAttributes.count; i++){
        
        CustomCell *cell = (CustomCell*)[self.collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
        
        CGFloat maxHeight = self.collectionView.bounds.size.width / self.maxRatio;
        CGFloat minHeight = self.collectionView.bounds.size.width / self.minRatio;
        CGFloat cellHeight = (maxHeight * 0.5 + minHeight * 0.5);
        CGFloat currentIndex = self.collectionView.contentOffset.y / cellHeight;
        
        CGFloat ratio = cell.bounds.size.width / cell.bounds.size.height;
        CGFloat maxDiff = self.minRatio - self.maxRatio;
        CGFloat diff = self.minRatio - ratio;
        
        CGFloat alpha = diff/maxDiff;
        
            cell.overView.alpha = 1 - alpha;
            cell.nameLabel.alpha = alpha;
//            cell.subtitleLabel.alpha = alpha;
        
            if(i > currentIndex){
                cell.nameLabel.transform = CGAffineTransformMakeScale(1 - (1 - alpha) * 0.3, 1 - (1 - alpha) * 0.3);
//                cell.subtitleLabel.transform = CGAffineTransformMakeTranslation(0, (1- alpha) * 30);
            }else{
                cell.nameLabel.transform = CGAffineTransformIdentity;
//                cell.subtitleLabel.transform = CGAffineTransformIdentity;
            }
}
}
#pragma mark - cell setting
//세션 갯수
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

//로우 갯수
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.photo.count;
}

//셀 셋팅
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.nameLabel.text = self.photoName[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:[self.photo objectAtIndex:indexPath.row]];
    
    return cell;
}

//셀 선택시
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@" cell number : %ld", indexPath.row);
    //선택시 구동
    UICollectionViewCell *cell = [self.collectionView cellForItemAtIndexPath:indexPath];
    
    cell.layer.borderColor = [UIColor orangeColor].CGColor;
    cell.layer.borderWidth = 3.0f;
    
}

//셀을 다시 선택했을 경우
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [self.collectionView cellForItemAtIndexPath:indexPath];
    
    cell.layer.borderColor = nil;
    cell.layer.borderWidth = 0.0f;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
