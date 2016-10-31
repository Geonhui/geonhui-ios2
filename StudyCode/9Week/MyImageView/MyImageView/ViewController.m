//
//  ViewController.m
//  MyImageView
//
//  Created by geon hui kim on 2016. 10. 28..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (nonatomic, weak) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

//탭 제스처 리코나이저
- (IBAction)tapImageView:(UITapGestureRecognizer *)sender
{
    //강사님
    //얼럿컨트롤러 생성
    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"사진가져오기"
                                                                         message:@"사진을 가져올 소스선택"
                                                                  preferredStyle:UIAlertControllerStyleActionSheet];
    
    //weak - 약한연결, strong - 강한연결, __weak을 안해줄경우 강제로 strong으로 연결이된다.
    //viewcontroller ---- weakSelf
    __weak ViewController *weakSelf = self;
    
    //핸들러
    void (^actionHandler)(UIAlertAction * _Nonnull action) = ^(UIAlertAction * _Nonnull action) {
        
        //UIImagePickerControllerSourceTypePhotoLibrary << 정수
        UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        
        //얼럿액션의 타이틀이 "사진앨범"일때
        if ([[action title] isEqualToString:@"사진앨범"]) {
            //피커타입을 photoAlbum으로 지정
            sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        //얼럿액션의 타이틀이 "라이브러리"일때
        }else if ([[action title]isEqualToString:@"카메라"]) {
            //피커타입을 camera로 지정
            sourceType = UIImagePickerControllerSourceTypeCamera;
        }
        //weakSelf객체위에 sourceType를 올린다.
        [weakSelf showImagePicker:sourceType];
    };
    
    //actionTitle라는 배열을 만든다. 얼럿액션 title
    NSArray *actionTitle = @[@"사진 라이브러리",@"사진앨범",@"카메라",@"취소"];
    
    //스트링타입의 title객체로 actionTitle의 배열이 전부 돌린다.
    for (NSString *title in actionTitle) {
        //"취소"와 "카메라"가 아닌경우는 얼럿액션스타일을 default로 지정한다.
        UIAlertActionStyle style = UIAlertActionStyleDefault;
        
        //title이 "취소"일 경우 얼럿스타일을 cancel로 지정
        if ([title isEqualToString:@"취소"]) {
            style = UIAlertActionStyleCancel;
        //title이 "카메라"일 경우
        }else if ([title isEqualToString:@"카메라"]){
            //isSourceTypeAvailable: = is 가 들어가는 부분은 거의 BOOL값이다.
            //isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera = 이 타입이 이 디바이스에서 구현이 가능하냐? NO
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera] == NO) {
                //제일 가까운 반복문을 벗어난다.
                continue;
            }
                   style = UIAlertActionStyleDestructive;
        }
        //action얼럿액션에 title은 배열의 이름으로 사용하고, style은 핸들러를 사용하고, handler는 weakSelf메서드 이동
        UIAlertAction *action = [UIAlertAction actionWithTitle:title
                                                         style:style
                                                       handler:actionHandler];
        //액션시트 위에 액션 추가
        [actionSheet addAction:action];
    }
    //뷰위에 보여지기 위한
    [self presentViewController:actionSheet animated:YES completion:nil];
}

//이미지피커를 띄우기 위한 메서드
- (void)showImagePicker:(UIImagePickerControllerSourceType)sourceType
{
    UIImagePickerController *picker = [[UIImagePickerController alloc]init];
    [picker setDelegate:self]; //델리게이트 연결
    [picker setSourceType:sourceType];
    [picker setAllowsEditing:YES];  //편집사용
    //presentviewcontroller 화면을 올려준다.
    [self presentViewController:picker animated:YES completion:nil];
}

#pragma mark - UIImagePickerController Delegate

//이미지피커 취소
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    //돌아오기
    [picker dismissViewControllerAnimated:YES completion:nil];
}

//이미지 가져오기
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    //EditedImage = 편집되는 이미지
    UIImage *pickedImage = info[UIImagePickerControllerEditedImage];
    
    //pickedImage가 nil일 경우 = 편집을 하지않는 이미지
    if (pickedImage == nil) {
        //OriginalImage = 원본 이미지
        pickedImage = info[UIImagePickerControllerOriginalImage];
    }
    if (pickedImage == nil) {
        NSLog(@"사진없음");
        return;
    }
    
    //이진 데이터
    //jpeg데이터를 그용량 그대로 가져온다, (1.0, 용량 그래로 가져온다는말)
    NSData *imageData = UIImageJPEGRepresentation(pickedImage, 1.0);
    
    //싱글턴, 한번지정해주면 어디에서든 똑같이 쓸수가 있다.
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    
    //NSUserDefaults가 딕셔너리 형식으로 되어있기 때문에 setObject와 forKey로 불러온다.
    [userDefault setObject:imageData forKey:@"imageData"];
    
    //동기화
    [userDefault synchronize];
    
    //imageView의 프로퍼티 pickedImage넣는다.
    //기존에서 막고, 노티피케이션에서 표현
    [[self imageView] setImage:pickedImage];
    
    //dismissviewcontroller는 화면을 내려준다.
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //이미지뷰에 유저가 접근하기 위해서 해줘야한다.
    [self.imageView setUserInteractionEnabled:YES];

    //사진불러오기
    NSData *imageData = [[NSUserDefaults standardUserDefaults] objectForKey:@"imageData"];
    UIImage *image = [UIImage imageWithData:imageData];
    [[self imageView] setImage:image];
    
    //노티피케이션
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didUserDefaultsChange:)
                                                 name:NSUserDefaultsDidChangeNotification
                                               object:nil];
}

//노티피케이션 메서드
- (void)didUserDefaultsChange:(NSNotification *)noti
{
    NSLog(@"user default changed");
    
    //노티피케이션에서 지정한 메서드 안에서 발생
//    NSData *imageData = [[NSUserDefaults standardUserDefaults] objectForKey:@"imageData"];
//    UIImage *image = [UIImage imageWithData:imageData];
//    [[self imageView] setImage:image];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
