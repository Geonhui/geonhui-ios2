//
//  ViewController.m
//  CollectionViewTest
//
//  Created by geon hui kim on 2016. 11. 28..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "ViewController.h"
#import "ImageViewController.h"

@interface ViewController ()
<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) IBOutlet UICollectionView *mainview;

@property (nonatomic) NSMutableArray *photoData;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //사진 추가
    UIBarButtonItem *add = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                         target:self
                                                                         action:@selector(showImagePicker)];
    self.navigationItem.rightBarButtonItem = add;
    
    [self.mainview setDelegate:self];
    [self.mainview setDataSource:self];
    [self.mainview setBackgroundColor:[UIColor whiteColor]];
    
    [self.view addSubview:self.mainview];
    
    //사진이미지, 이름, 내용 딕셔너리를 배열
    self.photoData = [[NSMutableArray alloc] init];
}

#pragma mark - collection count
//컬렉션뷰 세션 갯수
//- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
//{
//    return 1;
//}

//컬렉션뷰 아이템 갯수
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.photoData.count;
}

#pragma mark - cell setting
//셀 셋팅
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [self.mainview dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    NSDictionary *dic = [self.photoData objectAtIndex:indexPath.row];
    
    NSData *photoImageData = [dic objectForKey:@"photoImage"];
    UIImage *image = [UIImage imageWithData:photoImageData];
    
    NSData *photoNameData = [dic objectForKey:@"addName"];
    NSString *name = [[NSString alloc] initWithData:photoNameData encoding:NSUTF8StringEncoding];
    
    //image
    UIImageView *imageview = [[UIImageView alloc] initWithFrame:cell.contentView.bounds];
    [imageview setFrame:CGRectMake(0, 0, cell.frame.size.width, cell.frame.size.height)];
    [imageview setImage:image];
    [cell.contentView addSubview:imageview];
    
    //label
    UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, cell.frame.size.width, 20)];
    [lable setText:[NSString stringWithFormat:@"%@", name]];
    [lable setTextColor:[UIColor whiteColor]];
    [lable setFont:[UIFont boldSystemFontOfSize:20]];
    [cell.contentView addSubview:lable];
    
    return cell;
}

//셀 크기
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((self.mainview.bounds.size.width / 3) - 2.5, self.mainview.bounds.size.height / 3);
}

//컬렉션과 컬렉션 width 간격, 내부여백
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

//셀간의 최소간격
//위아래 간격 hight
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 5;
}

#pragma mark - cell action
//셀을 선택했을 경우
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    //다중선택
    //    [self.collectionView setMultipleTouchEnabled:YES];
    
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    
    cell.layer.borderColor = [UIColor orangeColor].CGColor;
    cell.layer.borderWidth = 3.0f;
    
}

//셀을 다시 선택했을 경우
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    
    cell.layer.borderColor = nil;
    cell.layer.borderWidth = 0.0f;
}

#pragma mark - image picker
//add 버튼 눌럿을 경우 imagepicker 포토라이브러리 접근
- (void)showImagePicker
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    [picker setDelegate:self];
    [picker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    [self presentViewController:picker animated:YES completion:nil];
}

//image picker 취소
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

//image 가져오기
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    [self dismissViewControllerAnimated:YES completion:^{
        
        UIAlertController *name = [UIAlertController alertControllerWithTitle:@"사진제목"
                                                                      message:@"제목을 입력해주세요"
                                                               preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *nameAction = [UIAlertAction actionWithTitle:@"확인"
                                                             style:UIAlertActionStyleDefault
                                                           handler:^(UIAlertAction * _Nonnull action) {

                                                               //user default
                                                               NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
                                                               
                                                               //image, textfield
                                                               UIImage *photoImage = info[UIImagePickerControllerOriginalImage];
                                                               UITextField *photoName = name.textFields.firstObject;
                                                               UITextField *photoStory = name.textFields.lastObject;
                                                               NSString *storyString = photoStory.text;
                                                               NSString *nameString = photoName.text;
                                                               
                                                               //변환
                                                               NSData *imageData = UIImageJPEGRepresentation(photoImage, 1.0);
                                                               NSData *nameData = [nameString dataUsingEncoding:NSUTF8StringEncoding];
                                                               NSData *storyData = [storyString dataUsingEncoding:NSUTF8StringEncoding];
                                                               
                                                               //저장
                                                               //[user setObject:imageData forKey:@"photoImage"];
                                                               //[user setObject:nameData forKey:@"addName"];
                                                               //[user setObject:storyData forKey:@"photoStory"];
                                                               
                                                               NSMutableDictionary *infoDic = [NSMutableDictionary new];
                                                               
                                                               [infoDic setObject:imageData forKey:@"photoImage"];
                                                               [infoDic setObject:nameData forKey:@"addName"];
                                                               [infoDic setObject:storyData forKey:@"photoStory"];
                                                               
//                                                               [self.photoData addObject:user];
                                                               [self.photoData addObject:infoDic];
                                                               [user setObject:self.photoData forKey:@"list"];
                                                               
//                                                               [infoDic setObject:photoImage forKey:@"photoImage"];
//                                                               [infoDic setObject:photoName forKey:@"Name"];
//                                                               [infoDic setObject:photoStory forKey:@"photoStory"];
                                                               
                                                               [self.mainview reloadData];

                                                               [user synchronize];
                                                           }];
        [name addAction:nameAction];
        
        [name addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
            textField.placeholder = @"제목입력";
        }];
        
        [name addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
            textField.placeholder = @"내용입력";
        }];
        
        [self presentViewController:name animated:YES completion:nil];
        
    }];
}

#pragma mark - cell select
//셀 선택했을 경우 현재 있는 데이터 전달
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //셀의 태그값도 보내야함
    UICollectionViewCell *cell = sender;
    NSIndexPath *cellIndex = [self.mainview indexPathForCell:cell];
    NSMutableArray *imageInfo = self.photoData[cellIndex.row];
    
    //
    ImageViewController *nextController = segue.destinationViewController;
    nextController.imageInfo = imageInfo;
}


#pragma mark - memory
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
