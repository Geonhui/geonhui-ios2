//
//  ViewController.m
//  CollectionView1
//
//  Created by Keun young Kim on 12. 12. 8..
//  Copyright (c) 2012년 Keun young Kim. All rights reserved.
//
//	이 예제 프로젝트의 모든 리소스는 iOS 프로그래밍을 학습하는 모든 분들이 자유롭게 사용하실 수 있습니다.
//	그러나 제작자의 동의없이 상업적인 용도로 사용하거나, 소스코드를 변경하여 재배포할 수는 없습니다.


#import "ViewController.h"
#import "InfoViewController.h"
#import <QuartzCore/QuartzCore.h>

#define kCellID @"IMG_CELL_ID"
#define kSupplementaryViewID @"SUP_VIEW_ID"

@interface ViewController ()
<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *infoButton;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSMutableArray* dataList;
@property (strong, nonatomic) UIPopoverController* infoPopover;

- (IBAction)onInfo:(id)sender;
- (IBAction)onAdd:(id)sender;
- (IBAction)onDeleteSelectedCells:(id)sender;

@end

@implementation ViewController

//====================================================================================================//
#pragma mark - Button Action

- (IBAction)onInfo:(id)sender {
	InfoViewController* info = [[InfoViewController alloc] initWithNibName:@"InfoViewController" bundle:nil];
	
	if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
		[self presentViewController:info animated:YES completion:NULL];
	}
	else {
		self.infoPopover = [[UIPopoverController alloc] initWithContentViewController:info];
		[self.infoPopover presentPopoverFromBarButtonItem:self.infoButton permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
	}
}

- (IBAction)onAdd:(id)sender {
	UIImage* girlImg = [UIImage imageNamed:@"girl00.jpeg"];
	[self.dataList[0] addObject:girlImg];
	
	NSIndexPath* indexPath1 = [NSIndexPath indexPathForItem:[self.dataList[0] count] - 1 inSection:0];
	[self.collectionView insertItemsAtIndexPaths:@[indexPath1]];
}

//삭제버튼
- (IBAction)onDeleteSelectedCells:(id)sender
{
	NSArray* selectedList = [[self.collectionView indexPathsForSelectedItems] sortedArrayUsingComparator:^(id obj1, id obj2){
		if ([obj1 section] == [obj2 section]) {
			if ([obj1 row] > [obj2 row]) return NSOrderedAscending;
			else if ([obj1 row] < [obj2 row]) return NSOrderedDescending;
			else return NSOrderedSame;
		}
		else if ([obj1 section] > [obj2 section]) return NSOrderedAscending;
		else return NSOrderedDescending;
	}];
	
	for (NSIndexPath* indexPath in selectedList) {
		NSMutableArray* targetList = self.dataList[indexPath.section];
		[targetList removeObject:self.dataList[indexPath.section][indexPath.row]];
	}
	
	[self.collectionView deleteItemsAtIndexPaths:selectedList];
}



//====================================================================================================//
#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
	return [self.dataList count];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
	return [self.dataList[section] count];
}


- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
	// 재사용 큐에 셀을 가져온다
	UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellID forIndexPath:indexPath];
	
	// 선택 상태에 따른 셀UI 업데이트
	// "#3. 셀에 대해 더 깊이 파고들어가보자" 글에 있는 약간의 수정 부분에 대한 해결방법. 아래의 두줄이 있을때와 없을때를 비교해보세요.
	cell.layer.borderColor = (cell.selected) ? [UIColor yellowColor].CGColor : nil;
	cell.layer.borderWidth = (cell.selected) ? 5.0f : 0.0f;
	
	// 표시할 이미지 설정
	UIImageView* imgView = (UIImageView*)[cell.contentView viewWithTag:100];
	if (imgView) imgView.image = self.dataList[indexPath.section][indexPath.row];
	
	return cell;
}


- (UICollectionReusableView*)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
	// 요청된 Supplementary View가 헤더인지 확인
	if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
		
		// 재사용 큐에서 뷰를 가져온다
		UICollectionReusableView* view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kSupplementaryViewID forIndexPath:indexPath];
		
		NSArray* titles = [[NSArray alloc] initWithObjects:@"Girls", @"Cars", @"Movies", nil];
		
		UILabel* lbl = (UILabel*)[view viewWithTag:100];
		if (lbl) lbl.text = titles[indexPath.section];
		
		return view;
	}
	
	return nil;
}


//====================================================================================================//
#pragma mark - UICollectionViewDelegate

// 하일라이트
//- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath
//{
//	return YES;
//}


- (void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
	UICollectionViewCell* cell = [collectionView cellForItemAtIndexPath:indexPath];
	
	cell.layer.borderColor = [UIColor cyanColor].CGColor;
	cell.layer.borderWidth = 3.0f;
}

- (void)collectionView:(UICollectionView *)collectionView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
	UICollectionViewCell* cell = [collectionView cellForItemAtIndexPath:indexPath];
	
	cell.layer.borderColor = nil;
	cell.layer.borderWidth = 0.0f;
}


// 선택
//- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
//{
//	return YES;
//}
//
//- (BOOL)collectionView:(UICollectionView *)collectionView shouldDeselectItemAtIndexPath:(NSIndexPath *)indexPath
//{
//	return YES;
//}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
	UICollectionViewCell* cell = [collectionView cellForItemAtIndexPath:indexPath];
	
	cell.layer.borderColor = [UIColor yellowColor].CGColor;
	cell.layer.borderWidth = 5.0f;
    NSLog(@"select");
}


- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
	UICollectionViewCell* cell = [collectionView cellForItemAtIndexPath:indexPath];
	
	cell.layer.borderColor = nil;
	cell.layer.borderWidth = 0.0f;
    NSLog(@"deselect");
}


// 셀이 삭제되거나 보이지 않는 영역으로 이동했을때 
- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
	
}



//====================================================================================================//
#pragma mark -

- (void)updateData
{
	[self.dataList removeAllObjects];
	
	// girl
	NSMutableArray* girlList = [[NSMutableArray alloc] init];
	for (int i = 0; i <= 11; i++) {
		NSString* imgName = [[NSString alloc] initWithFormat:@"girl%02i.jpeg", i];
		UIImage* girlImg = [UIImage imageNamed:imgName];
		[girlList addObject:girlImg];
	}
	[self.dataList addObject:girlList];
	
	// car
	NSMutableArray* carList = [[NSMutableArray alloc] init];
	for (int i = 0; i <= 24; i++) {
		NSString* imgName = [[NSString alloc] initWithFormat:@"car%02i.jpg", i];
		UIImage* carImg = [UIImage imageNamed:imgName];
		[carList addObject:carImg];
	}
	[self.dataList addObject:carList];
	
	// Poster
	NSMutableArray* posterList = [[NSMutableArray alloc] init];
	for (int i = 0; i <= 11; i++) {
		NSString* imgName = [[NSString alloc] initWithFormat:@"poster%02i.jpeg", i];
		UIImage* posterImg = [UIImage imageNamed:imgName];
		[posterList addObject:posterImg];
	}
	[self.dataList addObject:posterList];
	
	[self.collectionView reloadData];
}




//====================================================================================================//
#pragma mark - View Life-cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	_dataList = [[NSMutableArray alloc] init];
	
	UINib* nib = [UINib nibWithNibName:@"Cell" bundle:nil];	
	[self.collectionView registerNib:nib forCellWithReuseIdentifier:kCellID];
	
	nib = [UINib nibWithNibName:@"SupplementaryView" bundle:nil];
	[self.collectionView registerNib:nib forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kSupplementaryViewID];
	
	self.collectionView.allowsMultipleSelection = YES;
	
	[self updateData];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
